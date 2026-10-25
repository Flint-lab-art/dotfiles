-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- 设置中文语言环境
hl.env("LANG", "zh_CN.UTF-8")
hl.env("LANGUAGE", "zh_CN:en_US")

-- 输入法
hl.env("GTK_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("SDL_IM_MODULE", "fcitx")
hl.env("GLFW_IM_MODULE", "ibus")   -- 针对 Kitty 等 GLFW 应用
hl.env("INPUT_METHOD", "fcitx")
