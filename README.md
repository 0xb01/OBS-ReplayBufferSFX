**OBS ReplayBufferSFX**
Sound triggers (startup, replay saved, stopped, error) for OBS' Replay Buffer.

**How to use**
 1. Download this repo and unzip on your PC.
 2. Download, install and run [OBS Studio](https://obsproject.com/).
 3. Go to **Tools -> Scripts**
 4. On the **Scripts** Tab, press **+**
 5. Find **ReplayBufferSFX_Script.lua** and press **Open**.
 6. Done!

**Are you using OBS Studio for the replay function only? Want to automatically start the replay when your PC starts? Sure!**
 1. In OBS Studio, go to **Settings**
 2. In General, find System Tray
 3. Tick, **enable**, **minimize to system tray when started**, and **always minimize to system tray instead of task bar**.
 4. Apply and OK
 5. Get OBS Studio shortcut located at `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OBS Studio`
 6. **Right-click shortcut -> Properties**
 7. In the **Target**, **after the quotations**, press **spacebar** and **add** ` --startreplaybuffer --disable-shutdown-check`
 8. Apply, and OK
 9. **Copy** shortcut, **paste** to `C:\Users\johnn\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
 10. Done! 

***Sound effects from [DOVA SYNDROME](https://dova-s.jp/).***
