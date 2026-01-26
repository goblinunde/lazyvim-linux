#!/bin/bash
# 快速测试 Which-key 多语言功能

echo "=== Which-key 多语言功能测试脚本 ==="
echo ""

# 检查当前保存的语言
echo "1. 检查保存的语言设置:"
if [ -f ~/.local/share/nvim/language.txt ]; then
    LANG=$(cat ~/.local/share/nvim/language.txt)
    echo "   当前语言: $LANG"
else
    echo "   未找到语言文件，将使用默认语言 (en)"
fi

echo ""
echo "2. 验证关键文件存在:"
echo "   - i18n/init.lua: $([ -f ~/Downloads/lazyvim-linux/lua/i18n/init.lua ] && echo '✓ 存在' || echo '✗ 缺失')"
echo "   - i18n/locales/zh_CN.lua: $([ -f ~/Downloads/lazyvim-linux/lua/i18n/locales/zh_CN.lua ] && echo '✓ 存在' || echo '✗ 缺失')"
echo "   - config/lazy.lua: $([ -f ~/Downloads/lazyvim-linux/lua/config/lazy.lua ] && echo '✓ 存在' || echo '✗ 缺失')"

echo ""
echo "3. 检查 refresh_which_key_groups 函数:"
if grep -q "refresh_which_key_groups" ~/Downloads/lazyvim-linux/lua/i18n/init.lua; then
    echo "   ✓ refresh_which_key_groups 函数已定义"
else
    echo "   ✗ refresh_which_key_groups 函数未找到"
fi

echo ""
echo "4. 检查 which-key 分组注册:"
if grep -q 'group = i18n.t("which_key' ~/Downloads/lazyvim-linux/lua/config/lazy.lua; then
    echo "   ✓ which-key 分组已使用 i18n"
else
    echo "   ✗ which-key 分组未使用 i18n"
fi

echo ""
echo "=== 测试步骤 ==="
echo "请按以下步骤测试:"
echo ""
echo "1. 完全退出当前所有 Neovim 窗口"
echo "   :qa"
echo ""
echo "2. 重新启动 Neovim"  
echo "   nvim"
echo ""
echo "3. 如果启动界面是英文，切换语言:"
echo "   :LangSwitch zh_CN"
echo ""
echo "4. 按 Space 键，查看 which-key 菜单"
echo "   应该显示:"
echo "   f → 文件"
echo "   g → Git"
echo "   c → 代码"
echo "   等等..."
echo ""
echo "如果仍然显示英文，请告诉我具体看到了什么。"
