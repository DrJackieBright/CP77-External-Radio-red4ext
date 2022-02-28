use red4ext_rs::prelude::*;

define_plugin! {
    name: "CP77-External-Radio",
    author: "DrJackieBright",
    version: 2:0:0,
    on_register: {
        register_function!("play", play);
        register_function!("pause", pause);
    }
}

extern crate windows;
use windows::Media::Control::GlobalSystemMediaTransportControlsSessionManager;

fn pause() -> bool {
    GlobalSystemMediaTransportControlsSessionManager::RequestAsync().unwrap().get().unwrap().GetCurrentSession().unwrap().TryPauseAsync().unwrap().get().unwrap()
}

fn play() -> bool {
    GlobalSystemMediaTransportControlsSessionManager::RequestAsync().unwrap().get().unwrap().GetCurrentSession().unwrap().TryPlayAsync().unwrap().get().unwrap()
}