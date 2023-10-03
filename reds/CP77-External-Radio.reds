native func play() -> Bool;
native func pause() -> Bool;

@wrapMethod(PlayerPuppet)
private cb func OnMountingEvent(evt: ref<MountingEvent>) -> Bool{
    let ret = wrappedMethod(evt);

    if (this.GetPS().auxRadioEnabled && Equals(evt.request.lowLevelMountingInfo.slotId.id, n"seat_front_left")) {
        let vehicleObject: ref<VehicleObject> = GameInstance.FindEntityByID(this.GetGame(), evt.request.lowLevelMountingInfo.parentId) as VehicleObject;
        vehicleObject.ToggleRadioReceiver(false);
        play();
        // Log("[External Radio] Play");
    }

    return ret;
}

@wrapMethod(PlayerPuppet)
private cb func OnUnmountingEvent(evt: ref<UnmountingEvent>) -> Bool{
    let ret = wrappedMethod(evt);

    if (this.GetPS().auxRadioEnabled && Equals(evt.request.lowLevelMountingInfo.slotId.id, n"seat_front_left")) {
        pause();
        // Log("[External Radio] Pause");
    }

    return ret;
}

@addField(PlayerPuppetPS)
private persistent let auxRadioEnabled: Bool;

@wrapMethod(VehiclesManagerDataHelper)
public final static func GetRadioStations(player: ref<GameObject>) -> array<ref<IScriptable>> {
    let res = wrappedMethod(player);
    let auxArray: array<ref<IScriptable>>;
    VehiclesManagerDataHelper.PushRadioStationData(auxArray, TweakDBInterface.GetRadioStationRecord(t"RadioStation.Aux"));
    ArrayInsert(res, 1, auxArray[0]);
    // Log("[External Radio] Inserted radio station");
    return res;
}

@wrapMethod(VehicleRadioPopupGameController)
protected func Activate() -> Void {
    if !IsDefined(this.m_selectedItem) {
        return;
    };
    let player: wref<PlayerPuppet> = GetPlayer(this.m_playerPuppet.GetGame());
    if this.m_selectedItem.GetStationData().m_record.Index() == -2 {
        // Log("[External Radio] Radio station selected, enabling");
        this.m_quickSlotsManager.SendRadioEvent(false, false, -1);
        player.GetPS().auxRadioEnabled = true;
        play();
    } else { 
        if (player.GetPS().auxRadioEnabled) {
            player.GetPS().auxRadioEnabled = false;
            pause();
        }
        wrappedMethod();
    }
}

@wrapMethod(VehicleComponent)
protected cb func OnVehicleRadioEvent(evt: ref<VehicleRadioEvent>) -> Bool {
    let ret = wrappedMethod(evt);
    if (this.m_radioState && GetPlayer(this.GetVehicle().GetGame()).GetPS().auxRadioEnabled) {
        // Log("[External Radio] Radio change detected, disabling");
        GetPlayer(this.GetVehicle().GetGame()).GetPS().auxRadioEnabled = false;
        pause();
    }
    return ret;
}