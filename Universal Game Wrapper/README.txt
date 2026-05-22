=================================================================
  UNIVERSAL PORTABLE GAME WRAPPER
  Run Windows games anywhere using Wine/Proton — no install needed.
=================================================================

HOW IT WORKS
=============
This wrapper bundles everything needed to run a Windows game in a
single portable folder. Drop in your game files, place a Wine or
Proton runner, edit config.ini, and run ./start. That's it.
The entire folder can be moved to any Linux system, USB drive,
external disk, etc. — it is fully self-contained.

=================================================================
QUICK START (5 minutes)
=================================================================

1. GET A RUNNER
   Download Wine-GE or Proton-GE from:
     https://github.com/GloriousEggroll/wine-ge-custom/releases
   Extract it into the 'runner' folder so that 'runner/bin/wine'
   exists (or runner/wine, runner/proton, etc.).

   Alternative: set [Runner] type=system in config.ini to use your
   system's Wine installation instead.

2. ADD YOUR GAME
   Copy all game files (the .exe, DLLs, data folders, etc.) into
   the 'game_data' folder.

3. EDIT CONFIG
   Open config.ini and change the settings:
     [Game]
     name = Your Game Name
     exe = Game.exe          ← change to your game's .exe filename
     version = 1.0

     [Runner]
     type = bundled          ← or "system" to use system Wine
     path = runner           ← folder where Wine is extracted
     binary = wine           ← usually "wine" or "proton"

     [Display]
     resolution = auto       ← or "1920x1080", "1280x720", etc.
     windowed = no           ← set "yes" to run in a window

     [Dependencies]
     verbs = vcrun2022       ← winetricks DLLs to auto-install

4. FIRST LAUNCH (sets up Wine prefix)
     ./first-launch

5. PLAY
     ./start

=================================================================
FOLDER STRUCTURE
=================================================================

  Universal Game Wrapper/
  ├── config.ini         ← Edit this to configure the game
  ├── start              ← Launch the game
  ├── first-launch       ← First-time setup (creates prefix, installs deps)
  ├── configure          ← Interactive config helper
  ├── desktop            ← Create .desktop launcher
  ├── uninstall.sh       ← Self-removal
  │
  ├── runner/            ← Place Wine/Proton binaries here
  ├── game_data/         ← Place game files here (.exe + DLLs + data)
  │
  ├── prefix/            ← Wine prefix (created automatically)
  ├── home/              ← Fake home directory (created automatically)
  ├── cache/             ← Shader caches (created automatically)
  │
  └── winetools/         ← Wine utility scripts
      ├── winecfg        → Run Wine configuration
      ├── regedit        → Run Wine registry editor
      ├── wineconsole    → Run Wine console
      ├── winefile       → Run Wine file manager
      ├── wineserver-kill → Kill all Wine processes
      └── clean-prefix   → Reset Wine prefix

=================================================================
TIPS
=================================================================

- Put this folder on a USB drive and play on any Linux PC.
- For NVIDIA: install the NVIDIA driver. For AMD/Intel: Mesa.
- If the game crashes, try running ./first-launch again or
  cleaning the prefix with: ./winetools/clean-prefix
- To use your own Wine (not bundled), set [Runner] type=system.
- Use ./configure for an interactive setup dialog.

=================================================================
REQUIREMENTS
=================================================================

- Linux (any distribution)
- Wine or Proton (bundled in runner/ or installed system-wide)
- Graphics drivers (Mesa for AMD/Intel, NVIDIA proprietary)
- Optional: gamemode (for performance boost)

=================================================================
SUPPORTED GAMES
=================================================================

Any Windows game that runs under Wine/Proton:
- Old & new titles (DX9, DX10, DX11, Vulkan via DXVK/VKD3D)
- Use ProtonDB (protondb.com) to check compatibility.

=================================================================
