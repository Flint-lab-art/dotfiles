-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("fcitx5 -d --replace")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hyprscratch init")
end)
