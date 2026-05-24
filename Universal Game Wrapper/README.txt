=================================================================
  UNIVERSAL PORTABLE GAME WRAPPER
  Run Windows games anywhere using Wine/Proton — no install needed.
=================================================================

HOW IT WORKS
=============
This wrapper bundles everything needed to run a Windows game in a
single portable folder. Drop in your game files, get a Wine/Proton
runner, edit config.ini, and run ./start. That's it.
The entire folder can be moved to any Linux system, USB drive,
external disk, etc. — it is fully self-contained.

=================================================================
QUICK START (2 minutes)
=================================================================

Option A — Automatic (recommended):
  1. Put your game files in the 'game_data' folder
  2. Run:  ./auto-setup
     (Detects your game, helps get a runner, sets up everything)
  3. Play: ./start

Option B — Manual (5 steps):
  1. GET A RUNNER
     ./download-runner   (guided download, easy!)
     Or extract Wine-GE/Proton-GE manually into the 'runner' folder.

  2. ADD YOUR GAME
     Copy your game files (.exe, DLLs, data) into the 'game_data' folder.

  3. CONFIGURE
     Open config.ini — change at least:
       [Game]
       name = Your Game Name
       exe  = YourGame.exe   ← your game's .exe filename
     Or run:  ./configure    (interactive editor)

  4. FIRST LAUNCH (one-time setup)
     ./first-launch
     (Creates Wine prefix, installs needed DLLs)

  5. PLAY
     ./start

=================================================================
FOLDER STRUCTURE
=================================================================

  Universal Game Wrapper/
  ├── auto-setup        ← Recommended: guided full setup
  ├── start             ← Launch the game
  ├── first-launch      ← First-time setup (run once)
  ├── configure         ← Interactive config helper
  ├── desktop           ← Create .desktop launcher
  ├── download-runner   ← Guided runner downloader
  ├── uninstall.sh      ← Remove everything
  │
  ├── config.ini        ← Your game settings
  ├── runner/           ← Place Wine/Proton binaries here
  ├── game_data/        ← Place game files here
  │
  ├── prefix/           ← Wine prefix (auto-created)
  ├── home/             ← Fake home directory (auto-created)
  ├── cache/            ← Shader caches (auto-created)
  │
  └── winetools/        ← Wine utility scripts
      ├── winecfg       → Wine configuration
      ├── regedit       → Registry editor
      ├── wineconsole   → Wine command prompt
      ├── winefile      → File manager
      ├── wineserver-kill → Kill Wine processes
      └── clean-prefix  → Reset Wine prefix

=================================================================
TIPS
=================================================================

- If the game crashes:
  1. Run ./first-launch again (reinstalls DLLs)
  2. Or run ./winetools/clean-prefix then ./first-launch
  3. Or add more DLLs under [Dependencies] in config.ini

- To force windowed mode (or if the game won't show):
    ./start -sw

- Put this folder on a USB drive and play on any Linux PC.
- For NVIDIA: install the proprietary driver.
  For AMD/Intel: Mesa drivers work out of the box.
- Check ProtonDB (protondb.com) for game compatibility.
- Optional: install gamemode for a performance boost.

=================================================================
REQUIREMENTS
=================================================================

- Linux (any distribution)
- Wine or Proton (in runner/ folder or system-wide)
- Graphics drivers (NVIDIA proprietary or Mesa for AMD/Intel)

=================================================================
SUPPORT
=================================================================

If you find this wrapper useful, consider supporting the project:
https://ko-fi.com/watrib

=================================================================
