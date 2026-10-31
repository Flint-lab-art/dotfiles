#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# ===== 要管理的配置目录（仓库根目录下同名文件夹）=====
MANAGED=(
    "hypr"
    "waybar"
    "uv"
    "ranger"
    "wofi"
    "zellij"
    "kitty"
)

link_one() {
    local name="$1"
    local src="$DOTFILES_DIR/$name"
    local dst="$CONFIG_HOME/$name"

    if [[ ! -d "$src" ]]; then
        echo "!! 仓库中不存在目录: $src"
        return 1
    fi

    if [[ -L "$dst" ]]; then
        local current
        current="$(readlink "$dst")"
        if [[ "$current" == "$src" ]]; then
            echo "== 已链接: $dst -> $src"
            return 0
        fi
        echo ">> 替换旧链接: $dst (原指向 $current)"
        rm "$dst"
    elif [[ -e "$dst" ]]; then
        echo "!! 目标已存在且不是符号链接: $dst"
        echo "   请手动处理，例如：mv \"$dst\" \"${dst}.bak\""
        return 1
    fi

    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
    echo ">> 已链接: $dst -> $src"
}

unlink_one() {
    local name="$1"
    local dst="$CONFIG_HOME/$name"

    if [[ -L "$dst" ]]; then
        rm "$dst"
        echo ">> 已取消链接: $dst"
    else
        echo "== 跳过（不是符号链接）: $dst"
    fi
}

show_status() {
    local name dst
    for name in "${MANAGED[@]}"; do
        dst="$CONFIG_HOME/$name"
        if [[ -L "$dst" ]]; then
            printf 'LINK  %-10s -> %s\n' "$name" "$(readlink "$dst")"
        elif [[ -e "$dst" ]]; then
            printf 'REAL  %-10s （真实目录/文件，未链接）\n' "$name"
        else
            printf 'MISS  %-10s （不存在）\n' "$name"
        fi
    done
}

case "${1:-}" in
    link)
        for name in "${MANAGED[@]}"; do
            link_one "$name"
        done
        ;;
    unlink)
        for name in "${MANAGED[@]}"; do
            unlink_one "$name"
        done
        ;;
    status)
        show_status
        ;;
    *)
        echo "用法: $(basename "$0") {link|unlink|status}"
        exit 1
        ;;
esac
