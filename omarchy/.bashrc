# ============================================================================
# Omarchy Bash Configuration
# ============================================================================
# 此檔案位於 ~/.config/dotfile/omarchy/.bashrc
# 透過 symlink ~/.bashrc 載入
# ============================================================================

# ----------------------------------------------------------------------------
# 1. Interactive Shell 檢查
# ----------------------------------------------------------------------------
# 如果不是 interactive shell（例如執行 script），則不載入後續設定
# 保持此行在檔案最上方，避免影響非互動式操作
[[ $- != *i* ]] && return

# ----------------------------------------------------------------------------
# 2. Omarchy 預設配置
# ----------------------------------------------------------------------------
# 載入 Omarchy 官方提供的預設 aliases, functions, prompts 等
# 位置：~/.local/share/omarchy/default/bash/rc
# 注意：不要直接修改官方檔案，在此檔案下方覆寫即可
source ~/.local/share/omarchy/default/bash/rc

# ----------------------------------------------------------------------------
# 3. 個人 Aliases
# ----------------------------------------------------------------------------
# 這裡放置您的個人 aliases 和 functions
# 如果與 Omarchy 預設有衝突，後面定義的會覆寫前面的

# 使用 Neovim 取代 vi
alias vi='nvim'

# SSH 連線時使用 xterm-256color 確保顏色正常顯示
alias ssh='TERM=xterm-256color ssh'

# ----------------------------------------------------------------------------
# 4. 客製化 Omarchy Scripts 的 PATH 設定
# ----------------------------------------------------------------------------
# 將 ~/.config/dotfile/omarchy/bin 加入 PATH 最前面
# 這樣可以覆寫 ~/.local/share/omarchy/bin 中的官方 scripts
# 使用 case 語句避免重複加入（當 source .bashrc 多次時）
case ":${PATH}:" in
    *:"$HOME/.config/dotfile/omarchy/bin":*)
        # 已經在 PATH 中，不重複加入
        ;;
    *)
        # 加入到 PATH 最前面，確保優先順序
        export PATH="$HOME/.config/dotfile/omarchy/bin:$PATH"
        ;;
esac


# ----------------------------------------------------------------------------
# 5. Atuin - Shell History 管理工具
# ----------------------------------------------------------------------------
# Atuin 提供跨機器同步的 shell history，支援搜尋和統計
# 官方網站：https://github.com/atuinsh/atuin

## ATUIN START
# bash-preexec - Atuin 需要此 hook 來追蹤命令執行
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh

# 初始化 Atuin 環境變數和 shell integration
. "$HOME/.atuin/bin/env"

# 啟動 Atuin，並禁用上箭頭鍵的預設行為
# 可以使用 Ctrl+R 來搜尋 history
eval "$(atuin init bash --disable-up-arrow)"
## ATUIN END

# uv
export PATH="/home/kent/.local/share/../bin:$PATH"
