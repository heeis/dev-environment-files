# Dev Environment Files 🚀

macOS 및 개발 환경을 빠르고 일관되게 구축하기 위한 개인 도트파일(Dotfiles) 및 개발 설정 모음 저장소입니다.  
터미널 환경(WezTerm, Zsh, Starship)부터 모던 CLI 도구(Eza, Bat) 및 Neovim(0.11.3 / 0.12.3 최적화 버전)까지 체계적으로 관리합니다.

---

## 📁 저장소 디렉토리 구조

```
dev-environment-files/
├── wezterm/         # GPU 가속 WezTerm 터미널 설정 (폰트, 배경 이미지, 창 자동최대화)
├── zsh/             # Zsh 쉘 환경 (.zshrc, 문법강조, 자동완성, 유용한 별칭)
├── starship/        # Starship 프롬프트 설정 (Nord 테마, Git/K8s/언어 런타임 표시)
├── eza/             # eza (ls 대체) 설정 및 테마 프리셋
├── nvim/            # Neovim 버전별 설정
│   ├── 0.11.3/      # Neovim 0.11.x 호환 설정 및 락 파일(lazy-lock.json) 보존
│   └── 0.12.3/      # Neovim 0.12.x 최적화 설정 (vim.uv, lazydev, diagnostic.jump 등)
└── kubernetes/      # Krew, kube-ctx, kube-ns 등 K8s CLI 유틸리티 설정
```

---

## 🛠 구성 요소별 상세 안내

| 구성 요소 | 설명 | 상세 가이드 |
| :--- | :--- | :--- |
| **WezTerm** | JetBrains Mono + D2Coding 한글 폰트, 다크 데저트 반투명 배경, 창 자동 최대화 | [wezterm/README.md](file:///Users/heeyong/Workspaces/dev-environment-files/wezterm/README.md) |
| **Zsh** | 문법 강조, 자동 제안, Eza/Bat/Python 별칭, Rancher Desktop/Krew 연동 | [zsh/README.md](file:///Users/heeyong/Workspaces/dev-environment-files/zsh/README.md) |
| **Starship** | Nord 테마 기반 Git 브랜치, Kubernetes 컨텍스트, Python/Node/Go 런타임 표시 | [starship/README.md](file:///Users/heeyong/Workspaces/dev-environment-files/starship/README.md) |
| **Eza** | 아이콘 및 Tokyo Night 테마가 적용된 모던 `ls` 대체 도구 | [eza/README.md](file:///Users/heeyong/Workspaces/dev-environment-files/eza/README.md) |
| **Neovim** | Lua 기반 고속 모듈형 설정 (버전별 분리 관리: 0.11.3 / 0.12.3 최적화) | [nvim/README.md](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/README.md) |
| **Kubernetes** | Krew 플러그인 매니저 및 ctx, ns, neat 플러그인 가이드 | [kubernetes/README.md](file:///Users/heeyong/Workspaces/dev-environment-files/kubernetes/README.md) |

---

## ⚡ 빠른 시작 가이드 (Quick Start)

### 1. 필수 패키지 설치 (Homebrew)

```bash
# 기본 CLI 유틸리티 및 에디터
brew install neovim zsh starship eza bat ripgrep node

# Zsh 플러그인
brew install zsh-syntax-highlighting zsh-autosuggestions

# 터미널 에뮬레이터 (WezTerm)
brew install --cask wezterm

# 권장 폰트 (Nerd Font 및 코딩 폰트)
brew install font-meslo-lg-nerd-font
brew install font-jetbrains-mono
brew install font-d2coding
```

---

### 2. 설정 파일 복사 (Copy)

저장소를 클론한 후, 각 도구의 설정 경로로 파일을 복사합니다:

```bash
# 환경 설정 경로 변수 (본인 저장소 경로에 맞게 지정)
DOTFILES_DIR="$HOME/Workspaces/dev-environment-files"

# 1. Zsh (.zshrc 복사)
cp "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc

# 2. Starship (starship.toml 복사)
mkdir -p ~/.config
cp "$DOTFILES_DIR/starship/starship.toml" ~/.config/starship.toml

# 3. WezTerm (wezterm 디렉토리 복사)
mkdir -p ~/.config
rm -rf ~/.config/wezterm && cp -R "$DOTFILES_DIR/wezterm" ~/.config/wezterm

# 4. Eza (테마 파일 복사)
mkdir -p ~/.config/eza
cp "$DOTFILES_DIR/eza/theme.yml" ~/.config/eza/theme.yml

# 5. Neovim (0.12.3 최신 최적화 버전 권장)
mkdir -p ~/.config
rm -rf ~/.config/nvim && cp -R "$DOTFILES_DIR/nvim/0.12.3" ~/.config/nvim
# (0.11.3 버전이 필요한 경우: rm -rf ~/.config/nvim && cp -R "$DOTFILES_DIR/nvim/0.11.3" ~/.config/nvim)
```

---

### 3. Neovim 첫 실행 및 플러그인 세팅

설정 복사 완료 후 `nvim`을 실행하면 `lazy.nvim`이 필요한 플러그인들을 자동으로 설치합니다:

```bash
# 1. Neovim 실행
nvim

# 2. Neovim 내부 명령어로 상태 점검 및 Treesitter 파서 갱신
:checkhealth
:TSUpdate
```