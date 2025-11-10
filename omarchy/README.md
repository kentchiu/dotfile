# Omarchy 客製化配置

這個目錄包含 Omarchy 環境的客製化設定，包括覆寫的 scripts 和 shell 配置。

## 目錄結構說明

```
~/.config/dotfile/omarchy/          # 版控的 Omarchy 客製化
├── .bashrc                         # Bash 配置（symlinked from ~/）
├── bin/                            # 覆寫的 omarchy scripts
│   └── omarchy-screenshot-dated
├── .gitignore
└── README.md

~/.bashrc -> ~/.config/dotfile/omarchy/.bashrc    # symlink

~/.config/omarchy/                  # Omarchy 正常配置（不版控）
├── themes/                         # 主題連結
├── current/                        # 當前主題/背景
├── hooks/                          # 事件 hooks
└── branding/                       # 品牌文字
```

## .bashrc

Omarchy 環境的 Bash 配置檔案，包含：

- Omarchy 預設配置載入
- 客製化 aliases 和 functions
- PATH 設定（載入客製化 bin scripts）
- 整合工具配置（Atuin 等）

**使用方式**：透過 symlink `~/.bashrc -> ~/.config/dotfile/omarchy/.bashrc`

## bin/ 目錄

此目錄中的 scripts 透過 PATH 優先順序覆寫 `~/.local/share/omarchy/bin/` 中的預設 scripts。

### PATH 設定（在 .bashrc 中）

```bash
case ":${PATH}:" in
    *:"$HOME/.config/dotfile/omarchy/bin":*)
        ;;
    *)
        export PATH="$HOME/.config/dotfile/omarchy/bin:$PATH"
        ;;
esac
```

### 目前的覆寫 scripts

- `omarchy-screenshot-dated` - 將截圖儲存到日期目錄 (MMDD 格式)
  - 原始 script: `~/.local/share/omarchy/bin/omarchy-cmd-screenshot`
  - 覆寫原因: 自動依日期組織截圖檔案
  - 建立日期: 2025-11-01

## 新增覆寫 script 的步驟

```bash
# 1. 建立新的 script
nvim ~/.config/dotfile/omarchy/bin/omarchy-xxx

# 2. 加入執行權限
chmod +x ~/.config/dotfile/omarchy/bin/omarchy-xxx

# 3. 提交到 Git
cd ~/.config/dotfile
git add omarchy/bin/omarchy-xxx
git commit -m "feat: add omarchy-xxx override"
```

## 系統部署

在新系統上部署此配置：

```bash
# 1. Clone dotfile repo
git clone <your-repo> ~/.config/dotfile

# 2. 建立 .bashrc symlink
ln -sf ~/.config/dotfile/omarchy/.bashrc ~/.bashrc

# 3. 重新載入 shell
source ~/.bashrc
```

## 維護原則

- ✅ **版控 .bashrc 和 bin/**：Omarchy 環境的核心配置
- ✅ **其他 omarchy 配置不版控**：themes, hooks 等保持在 `~/.config/omarchy/`
- ✅ **遵循 KISS 原則**：保持簡單
- ✅ **記錄覆寫原因**：在 README 中說明為何覆寫
- ✅ **定期檢查**：Omarchy 更新後確認覆寫仍正常運作
