use red4ext_rs::prelude::*;

define_plugin! {
    name: "CP77-External-Radio",
    author: "DrJackieBright",
    version: 2:1:0,
    on_register: {
        register_function!("play", play);
        register_function!("pause", pause);
    }
}

extern crate windows;
use windows::Media::Control::GlobalSystemMediaTransportControlsSessionManager;

fn pause() {
    GlobalSystemMediaTransportControlsSessionManager::RequestAsync().unwrap().get().unwrap().GetCurrentSession().unwrap().TryPauseAsync().unwrap().get().unwrap();
}

fn play()  {
    GlobalSystemMediaTransportControlsSessionManager::RequestAsync().unwrap().get().unwrap().GetCurrentSession().unwrap().TryPlayAsync().unwrap().get().unwrap();
}