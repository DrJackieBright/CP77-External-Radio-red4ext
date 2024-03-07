use red4ext_rs::prelude::*;

define_plugin! {
    name: "CP77-External-Radio",
    author: "DrJackieBright",
    version: 2:1:14,
    on_register: {
        register_function!("play", play);
        register_function!("pause", pause);
    }
}

extern crate windows;
use windows::Media::Control::GlobalSystemMediaTransportControlsSessionManager;

macro_rules! handle_err {
    ($e: expr) => {
        match $e { Err(err) => {
            error!("{}", err);
            return;
        }, Ok(o) => o }
    };
}

fn pause() {
    handle_err!(
        handle_err!(
            handle_err!(
                handle_err!(
                    handle_err!(
                        GlobalSystemMediaTransportControlsSessionManager::RequestAsync()
                    ).get()
                ).GetCurrentSession()
            ).TryPauseAsync()
        ).get()
    );
}

fn play()  {
    handle_err!(
        handle_err!(
            handle_err!(
                handle_err!(
                    handle_err!(
                        GlobalSystemMediaTransportControlsSessionManager::RequestAsync()
                    ).get()
                ).GetCurrentSession()
            ).TryPlayAsync()
        ).get()
    );
}
