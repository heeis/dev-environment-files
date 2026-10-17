# Eza 설정

[eza](https://github.com/eza-community/eza)는 `ls` 명령어를 대체하는 모던하고 빠른 Rust 기반 파일 목록 뷰어입니다.  
아이콘 표시, Git 상태 연동, 다양한 색상 테마를 지원합니다.

---

## 디렉토리 구성

- [theme.yml](file:///Users/heeyong/Workspaces/dev-environment-files/eza/theme.yml): 기본 적용된 Tokyo Night 테마 설정
- [themes/](file:///Users/heeyong/Workspaces/dev-environment-files/eza/themes/): 다양한 커스텀 테마 프리셋 모음
  - `tokyonight.yml`, `catppuccin.yml`, `dracula.yml`, `gruvbox-dark.yml`, `one_dark.yml`, `rose-pine.yml`, `frosty.yml` 등

---

## 설치 방법

```bash
brew install eza
```

---

## 설정 파일 복사

```bash
# Eza 설정 디렉토리 생성 및 테마 파일 복사
mkdir -p ~/.config/eza
cp /Users/heeyong/Workspaces/dev-environment-files/eza/theme.yml ~/.config/eza/theme.yml
```

---

## Zsh 연동 및 별칭 (Alias)

[zsh/.zshrc](file:///Users/heeyong/Workspaces/dev-environment-files/zsh/.zshrc)에 아래 설정을 등록하여 사용합니다:

```zsh
# Eza 설정 디렉토리 지정
export EZA_CONFIG_DIR="$HOME/.config/eza/"

# 기본 ls를 eza로 대체 (아이콘 및 숨김 파일 표시)
alias ls="eza --all --icons=always"
alias l="ls -al"
```
