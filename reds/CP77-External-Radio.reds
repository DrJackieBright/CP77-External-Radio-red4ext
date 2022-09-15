native func play() -> Bool;
native func pause() -> Bool;

@wrapMethod(PlayerPuppet)
private cb func OnMountingEvent(evt: ref<MountingEvent>) -> Bool{
    let ret = wrappedMethod(evt);

    if (this.auxRadioEnabled && Equals(evt.request.lowLevelMountingInfo.slotId.id, n"seat_front_left")) {
        let vehicleObject: ref<VehicleObject> = GameInstance.FindEntityByID(this.GetGame(), evt.request.lowLevelMountingInfo.parentId) as VehicleObject;
        vehicleObject.ToggleRadioReceiver(false);
        play();
        Log("[External Radio] Play");
    }

    return ret;
}

@wrapMethod(PlayerPuppet)
private cb func OnUnmountingEvent(evt: ref<UnmountingEvent>) -> Bool{
    let ret = wrappedMethod(evt);

    if (this.auxRadioEnabled && Equals(evt.request.lowLevelMountingInfo.slotId.id, n"seat_front_left")) {
        pause();
        Log("[External Radio] Pause");
    }

    return ret;
}

@addField(PlayerPuppet)
let auxRadioEnabled: Bool;

@wrapMethod(PlayerPuppet)
protected cb func OnGameAttached() -> Bool {
    this.auxRadioEnabled = true;
    return wrappedMethod();
}

@wrapMethod(VehiclesManagerDataHelper)
public final static func GetRadioStations(player: ref<GameObject>) -> array<ref<IScriptable>> {
    let res = wrappedMethod(player);
    let auxArray: array<ref<IScriptable>>;
    VehiclesManagerDataHelper.PushRadioStationData(auxArray, TweakDBInterface.GetRadioStationRecord(t"RadioStation.Aux"));
    ArrayInsert(res, 1, auxArray[0]);
    Log("[External Radio] Inserted radio station");
    return res;
}

@wrapMethod(VehicleRadioPopupGameController)
protected func Activate() -> Void {
    wrappedMethod();
    if !IsDefined(this.m_selectedItem) {
        return;
    };
    let player: wref<PlayerPuppet> = GetPlayer(this.m_playerPuppet.GetGame());
    if this.m_selectedItem.GetStationData().m_record.Index() == -2 {
        this.m_quickSlotsManager.SendRadioEvent(false, false, -1);
        player.auxRadioEnabled = true;
    } else {
        player.auxRadioEnabled = false;
    }
    if (player.auxRadioEnabled) { play(); }
    else { pause(); }
}