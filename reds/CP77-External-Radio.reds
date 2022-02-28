native func play() -> Bool;
native func pause() -> Bool;

@wrapMethod(PlayerPuppet)
private cb func OnMountingEvent(evt: ref<MountingEvent>) -> Bool{
    let ret = wrappedMethod(evt);
    if (Equals(evt.request.lowLevelMountingInfo.slotId.id, n"seat_front_left")) {
        let success = play();
    }
    return ret;
}

@wrapMethod(PlayerPuppet)
private cb func OnUnmountingEvent(evt: ref<UnmountingEvent>) -> Bool{
    let ret = wrappedMethod(evt);
    if (Equals(evt.request.lowLevelMountingInfo.slotId.id, n"seat_front_left")) {
        let success = pause();
    }
    return ret;
}