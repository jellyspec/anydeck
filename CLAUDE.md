# CLAUDE.md

This file is for AI coding assistants working on this repo.

## Project overview

- Project: "DeckShark" a Mixxx-on-Raspberry-Pi solution that converts any USB class-compliant DJ controller (such as the Pioneer DDJ-FLX4) into a standalone DJ system (such as the Denon DJ SC LIVE 4)
- Platform: Raspberry Pi (debian)


## Tech and feature priorities

- Core goals:
    - Implement a USB-eject UX driven primarily by **Python** and **MIDI**.
    - Use the Mixxx DB only if necessary (avoid coupling to schema if possible)
    - Use **Bash** only where it is the right tool:
        - Install / setup (`setup.sh`, package install, permissions).
        - OS-level operations that Python reasonably cannot or should not do.
- USB-eject feature:
    - Primary implementation language: **Python**.
    - Primary interaction channel: **MIDI** (get info from Mixxx or send commands to Mixxx).
    - Python code should handle:
        - MIDI I/O
        - Any state machine or UX logic for the eject flow.
    - Use the Mixxx DB only when you cannot get necessary info via MIDI or other APIs, and keep DB access narrow and isolated.

- Bash:
    - Constrained use:
        - `setup.sh` and similar scripts for install/setup and environment bootstrapping.
        - Helper scripts only where Python would be impractical (e.g., low-level system/USB ops, udev quirks).
    - Do **not** add new behavior-heavy Bash scripts for application logic if Python can do it.

