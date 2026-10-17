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
  - 창 크기 변경 시 패딩 여백 자동 보정
- **탭 바**:
  - 하단 탭 바 상시 표시 (탭이 하나여도 표시), 탭/패인 인덱스 0부터 시작
  - catppuccin macchiato 색상의 square 스타일 탭, 활성 탭은 `인덱스: 제목` 으로 강조
  - LEADER 키 입력 대기 중에는 왼쪽 상태줄에 🌊 표시
- **멀티플렉서 (tmux 대체)**:
  - unix domain(`hy0007`)에 자동 접속하여 GUI 를 닫아도 세션 유지
  - 스크롤백 3000줄
- **하이퍼링크 감지**:
  - 터미널에 표시되는 웹 URL을 자동으로 감지하여 클릭 시 브라우저 오픈

---

## 키 바인딩 (tmux 스타일)

LEADER = `Ctrl+b` (2초 내 입력)

| 키 | 동작 |
|---|---|
| `LEADER c` | 새 탭 |
| `LEADER x` | 현재 패인 닫기 (확인) |
| `LEADER b` / `LEADER n` | 이전 / 다음 탭 |
| `LEADER 0`–`9` | 해당 번호 탭으로 이동 |
| `LEADER \|` | 좌우 분할 |
| `LEADER -` | 상하 분할 |
| `LEADER h/j/k/l` | 왼쪽/아래/위/오른쪽 패인으로 이동 |
| `LEADER ←/→/↓/↑` | 패인 크기 5칸 조절 |

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
