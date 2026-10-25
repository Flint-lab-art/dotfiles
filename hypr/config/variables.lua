---------------------
------ VARIABLES ----
---------------------

-- 主修饰键（Super/Windows 键）
local mainMod = "SUPER"

-- 默认终端
local terminal = "kitty"

-- 默认文件管理器
local fileManager = "dolphin"

-- 默认应用启动器
local menu = "wofi --show drun"

---------------------
------ EXPORTS ------
---------------------

return {
    mainMod     = mainMod,
    terminal    = terminal,
    fileManager = fileManager,
    menu        = menu,
}
