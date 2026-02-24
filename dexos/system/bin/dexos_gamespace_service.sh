#!/system/bin/sh
# Lightweight game launcher registration for DexOS
cmd shortcut create --id dexos.gamespace --package com.dexos.gamespace --short-label "Game Space" --intent "#Intent;action=android.intent.action.MAIN;category=android.intent.category.LAUNCHER;component=com.dexos.gamespace/.MainActivity;end"
