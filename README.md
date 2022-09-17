![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/DrJackieBright/CP77-External-Radio-red4ext) [![CI](https://github.com/DrJackieBright/CP77-External-Radio-red4ext/actions/workflows/ci.yml/badge.svg)](https://github.com/DrJackieBright/CP77-External-Radio-red4ext/actions/workflows/ci.yml) ![Custom badge](https://img.shields.io/endpoint?url=https%3A%2F%2Fnexusmodsdownloadsbadge.jackiebright.repl.co%2F%3Fgame%3D3333%26mod%3D3741)

# [ Cyberpunk 2077 External Radio ]

This is the simplest and most versatile solution I could find for a radio replacer.

## [ How it works ]


- The redscript script watches for the player to enter or exit the front left seat
- The redscript calls a function in red4ext that tells the windows global media controls to play or pause


## [ Installation ]

- Install [redscript](https://www.nexusmods.com/cyberpunk2077/mods/1511), [RED4ext](https://www.nexusmods.com/cyberpunk2077/mods/2380), and [TweakXL](https://www.nexusmods.com/cyberpunk2077/mods/4197)
- Install [cybercmd](https://www.nexusmods.com/cyberpunk2077/mods/5176) if you use REDmod
- Use Vortex or unzip in your game directory


## [ Tested Players ]

| Player  | Supported | Plugin required |
|---------|-----------|-----------------|  
| Spotify | Yes       | No              |  
| VLC     | Yes       | [vlc-win10smtc](https://github.com/spmn/vlc-win10smtc)    |
| Winamp  | Yes       | [gen_smtc](https://github.com/NanMetal/gen_smtc)        |
| Youtube |![](https://img.icons8.com/fluency/12/000000/chrome.png)  ![](https://img.icons8.com/color/12/000000/firefox.png)  ![](https://img.icons8.com/color/12/000000/ms-edge-new.png) ![](https://img.icons8.com/color/12/000000/opera-gx.png) | No              |

<sup>Note: a more comprehensive list of SMTC compatible players [can be found here](https://github.com/ModernFlyouts-Community/ModernFlyouts/blob/main/docs/GSMTC-Support-And-Popular-Apps.md)</sup>

## [ How to know if your player is supported ]
If your player appears in the windows system media transport controls (SMTC) it is supported  
This can be seen by changing the volume and seeing if the player shows up  
![](https://github.com/DrJackieBright/CP77-External-Radio-red4ext/raw/master/Screenshots/Supported%20media%20player.png)  
If your player is not supported, it will not show up  
![](https://github.com/DrJackieBright/CP77-External-Radio-red4ext/raw/master/Screenshots/Unsupported%20media%20player.png)  
If your player is not supported, you may be able to find an SMTC integration plugin

<sub>[Icons8:](https://icons8.com/) [Chrome](https://icons8.com/icons/set/chrome), [Firefox](https://icons8.com/icons/set/firefox), [Edge](https://icons8.com/icons/set/ms-edge-new), [Opera GX](https://icons8.com/icons/set/opera-gx)</sub>
