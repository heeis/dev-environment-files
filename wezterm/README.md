# WezTerm 터미널 설정

[WezTerm](https://wezfurlong.org/wezterm/)은 Rust로 작성된 GPU 가속 기반의 강력하고 빠른 크로스 플랫폼 터미널 에뮬레이터입니다.

---

## 디렉토리 구성

- [wezterm.lua](file:///Users/heeyong/Workspaces/dev-environment-files/wezterm/wezterm.lua): 메인 진입점 (환경변수 `WEZTERM_THEME` 기반 테마 선택 기능 포함)
- [config.lua](file:///Users/heeyong/Workspaces/dev-environment-files/wezterm/config.lua): 터미널 폰트, 배경 이미지, 투명도, 패딩, URL 하이퍼링크 감지 등 상세 설정
- [events.lua](file:///Users/heeyong/Workspaces/dev-environment-files/wezterm/events.lua): 시작 시 창 최대화(`gui-startup`) 및 화면 리사이즈 시 여백 최적화 이벤트 핸들러
- `dark-desert.jpg`: 터미널 배경으로 사용되는 사막 이미지

---

## 주요 설정 특징

- **폰트 설정**:
  - 기본: `JetBrains Mono (Bold, 12.5pt)`
  - 한글 폴백: `D2Coding (Bold)`
- **배경 커스텀**:
  - `dark-desert.jpg` 배경 이미지와 짙은 배경색(`#282c35`, 불투명도 0.55) 블렌딩으로 세련된 비주얼 제공
- **창 관리**:
  - 시작 시 전체화면 자동 최대화
  - 탭 바 숨김 및 창 크기 변경 시 패딩 여백 자동 보정
- **하이퍼링크 감지**:
  - 터미널에 표시되는 웹 URL을 자동으로 감지하여 클릭 시 브라우저 오픈

---

## 설치 방법

```bash
# WezTerm 설치
brew install --cask wezterm

# 권장 폰트 설치
brew install font-jetbrains-mono
brew install font-d2coding
```

---

## 설정 파일 복사

```bash
# WezTerm 설정 디렉토리 복사
mkdir -p ~/.config/wezterm
cp -R /Users/heeyong/Workspaces/dev-environment-files/wezterm/. ~/.config/wezterm/
```
