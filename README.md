# dotfiles

个人 Arch Linux + Hyprland 配置，使用符号链接管理。

## 环境

- 发行版：Arch Linux
- 合成器：Hyprland（Lua 配置，0.55+）
- 终端：Kitty
- 状态栏：Waybar
- 启动器：Wofi
- 终端复用：Zellij
- 文件管理器：Ranger（带 devicons）
- 输入法：Fcitx5

## 目录结构

    dotfiles/
    ├── dot.sh          # 链接管理脚本
    ├── hypr/           # ~/.config/hypr
    ├── kitty/          # ~/.config/kitty
    ├── ranger/         # ~/.config/ranger
    ├── uv/             # ~/.config/uv
    ├── waybar/         # ~/.config/waybar
    ├── wofi/           # ~/.config/wofi
    └── zellij/         # ~/.config/zellij

仓库里的每个顶层目录，都对应 `~/.config/` 下的同名目录。

## 依赖

### 核心

    sudo pacman -S hyprland kitty waybar wofi zellij ranger \
        fcitx5 fcitx5-chinese-addons noto-fonts-cjk \
        ttf-jetbrains-mono-nerd

### 可选

- hyprpaper — 壁纸
- grim + slurp — 截图
- wl-clipboard + cliphist — 剪贴板
- brightnessctl — 亮度控制
- pavucontrol — 图形化音量控制
- xdg-desktop-portal-hyprland — 屏幕共享

## 部署

### 1. 克隆仓库

    git clone https://github.com/Flint-lab-art/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    chmod +x dot.sh

### 2. 备份现有配置（如果有）

`dot.sh` 不会覆盖真实目录。如果 `~/.config/` 下已存在同名目录，脚本会提示并跳过。手动处理：

    mv ~/.config/hypr ~/.config/hypr.bak

其他目录同理。

### 3. 建立符号链接

    ./dot.sh link

### 4. 验证

    ./dot.sh status

输出中每个目录应显示 `LINK` 并指向仓库路径。

## 脚本用法

    ./dot.sh link     # 建立符号链接
    ./dot.sh unlink   # 移除符号链接（不删除仓库文件）
    ./dot.sh status   # 查看链接状态

脚本只管理链接，Git 操作直接手动执行：

    cd ~/Projects/dotfiles
    git add -A
    git commit -m "改了什么"
    git push

因为 `~/.config/xxx` 是指向仓库的符号链接，编辑系统配置等于直接编辑仓库文件，`git status` 能立即看到变更。

## 许可

个人配置，仅供参考。
