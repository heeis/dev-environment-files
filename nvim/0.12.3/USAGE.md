# IntelliJ 사용자를 위한 Neovim 0.12.3 완벽 가이드 🚀

IntelliJ IDEA에서 Neovim으로 전환하시는 분들을 위해, 현재 설정된 플러그인과 단축키를 IntelliJ 기능과 1:1로 매핑하여 정리한 실전 가이드입니다.

---

## 📌 핵심 기본 개념: `<leader>` 키

이 설정에서 `<leader>` 키는 **스페이스바 (`Space`)**입니다.  
`<leader>ff`는 **`Space`를 누른 뒤 `f`, `f`**를 연속으로 누르는 것을 의미합니다.

> 💡 **Tip (단축키 힌트)**:  
> `Space` 키를 누르고 약 0.3초간 기다리면, 화면 하단에 사용 가능한 모든 단축키 목록(`which-key`)이 팝업으로 나타납니다. 단축키를 외우지 않아도 쉽게 탐색할 수 있습니다.

---

## ⚡ IntelliJ ↔ Neovim 핵심 단축키 1:1 대조표

| 작업 | IntelliJ 단축키 (Mac) | Neovim 0.12.3 단축키 | 설명 |
| :--- | :--- | :--- | :--- |
| **전체 파일 검색** | `Shift` `Shift` / `Cmd + O` | `<leader>ff` | 프로젝트 내 파일명 퍼지 검색 (Telescope) |
| **최근 파일 열기** | `Cmd + E` | `<leader>fr` | 최근 열었던 파일 목록 (Recent Files) |
| **전체 문자열 검색** | `Cmd + Shift + F` | `<leader>fs` | 전체 텍스트 검색 (ripgrep 기반 Live Grep) |
| **현재 단어 검색** | `Cmd + F3` | `<leader>fc` | 커서 위치 단어 프로젝트 전체 검색 |
| **프로젝트 창 토글** | `Cmd + 1` | `<leader>ee` | 파일 탐색기 열기/닫기 (NvimTree) |
| **현재 파일 위치 찾기** | `Option + F1` → `1` | `<leader>ef` | 현재 편집 중인 파일 위치를 탐색기에서 강조 |
| **정의/선언 이동** | `Cmd + B` / `F12` | `gd` (또는 `gD`) | 심볼 선언/정의 위치로 이동 |
| **구현체 이동** | `Cmd + Option + B` | `gi` | 인터페이스의 구현체 목록 보기 |
| **사용처 찾기 (Usages)** | `Option + F7` / `Shift + F12` | `gR` | 함수/변수 참조 위치 목록 (References) |
| **퀵 픽스 / 코드 액션** | `Option + Enter` | `<leader>ca` | 빠른 수정, import 추가 등 Code Action |
| **이름 변경 (Rename)** | `Shift + F6` | `<leader>rn` | 변수/함수 심볼 스마트 일괄 리네임 |
| **코드 포맷팅** | `Option + Cmd + L` | `<leader>mp` | Prettier, StyLua, Black 등으로 서식 정리 |
| **문서 / 파라미터 정보** | `F1` / `Cmd + J` | `K` | 커서 위치 타입 및 docstring 호버 표시 |
| **다음 / 이전 에러 이동** | `F2` / `Shift + F2` | `]d` / `[d` | 다음/이전 문법 에러 및 경고 위치로 점프 |
| **에러 상세 팝업** | `Cmd + F1` | `<leader>d` | 현재 줄의 에러/경고 상세 플로팅 창 표시 |
| **프로젝트 에러 창** | `Cmd + 6` (Problems) | `<leader>xw` | 프로젝트 전체 진단 목록 (Trouble 창) |
| **자동 완성 팝업** | `Ctrl + Space` | `<C-Space>` | 코드 자동 완성 및 스니펫 추천 |
| **Git 관리 창** | `Cmd + 9` / `Cmd + K` | `<leader>lg` | 터미널 UI 기반 풀스크린 LazyGit 실행 |

---

## 🛠 영역별 상세 사용법

### 1. 파일 및 프로젝트 관리 (NvimTree)

- `<leader>ee`: 파일 탐색기 토글 (열기/닫기)
- `<leader>ef`: 현재 파일 위치를 탐색기에서 자동 포커스
- `<leader>ec`: 열려 있는 모든 디렉토리 접기
- `<leader>er`: 탐색기 새로고침

**탐색기 창 안에서 유용한 단축키:**
- `a`: 새 파일 또는 새 폴더 생성 (이름 끝에 `/`를 붙이면 폴더)
- `d`: 파일/폴더 삭제 (확인 프롬프트)
- `r`: 이름 변경 (Rename)
- `x` / `c` / `p`: 잘라내기 / 복사 / 붙여넣기
- `o` 또는 `<Enter>`: 파일 열기
- `q`: 탐색기 닫기

---

### 2. 검색 및 내비게이션 (Telescope)

- `<leader>ff`: 파일 이름으로 찾기 (Fuzzy Find Files)
- `<leader>fr`: 최근 열었던 파일 찾기 (Recent Files)
- `<leader>fs`: 코드 내용 실시간 검색 (Live Grep)
- `<leader>fc`: 커서 위치 단어를 전체 코드에서 검색 (Grep String)
- `<leader>ft`: 프로젝트 내 `TODO`, `FIXME`, `BUG` 주석 검색
- `<leader>fk`: 등록된 단축키 검색

**검색 팝업 창 안에서:**
- `<C-j>` / `<C-k>`: 목록 아래/위로 이동
- `<Enter>`: 선택한 파일 열기
- `<C-q>`: 검색 결과를 목록창(Trouble / Quickfix)으로 전송
- `<Esc>`: 검색 창 닫기

---

### 3. 코드 인텔리센스 및 리팩토링 (LSP)

언어 서버(LSP)가 동작 중일 때 사용 가능합니다:
- `gd`: 정의로 이동 (`Telescope lsp_definitions`)
- `gD`: 선언으로 이동
- `gi`: 구현체 목록 보기 (`Telescope lsp_implementations`)
- `gt`: 타입 정의로 이동
- `gR`: 사용처 전체 조회 (`Telescope lsp_references`)
- `K`: 마우스 호버 효과 (타입, 함수 시그니처, 설명 팝업)
- `<leader>ca`: IntelliJ의 `Option + Enter`와 같은 코드 수정 액션
- `<leader>rn`: 심볼 이름 변경 (프로젝트 전체 반영)
- `<leader>rs`: 언어 서버 재시작 (LSP 먹통 시 유용)

---

### 4. 에러 및 경고 확인 (Diagnostics & Trouble)

- `]d` / `[d`: 다음 / 이전 에러나 경고로 바로 점프
- `<leader>d`: 현재 줄의 에러 메시지를 작은 창으로 확인
- `<leader>D`: 현재 파일의 모든 에러를 Telescope 목록으로 확인
- `<leader>xw`: **IntelliJ의 Problems 창과 동일**. 프로젝트 전체 에러 목록을 하단에 고정 표시
- `<leader>xd`: 현재 문서의 에러 목록만 하단에 표시

---

### 5. 코드 서식 정리 및 린트 (Formatting & Linting)

- `<leader>mp`: 현재 파일 수동 포맷팅
- **자동 포맷팅**: 파일을 저장(`:w`)할 때마다 설정된 포맷터(Prettier, StyLua, Black 등)가 자동으로 코드를 정리합니다.
- `<leader>l`: 현재 파일 린터(ESLint_d, Pylint 등) 수동 실행

---

### 6. Git 작업 (GitSigns & LazyGit)

- `<leader>lg`: **LazyGit 실행**. 커밋, 푸시, 브랜치 변경, 머지, 리베이스 등 IntelliJ의 Git 도구창보다 훨씬 빠르고 직관적인 TUI 제공 (`q`로 종료)
- **에디터 내 Git Hunk 조작**:
  - `]h` / `[h`: 변경된 코드 블록(Hunk)으로 이동
  - `<leader>hp`: 해당 변경 블록의 이전 코드 diff 미리보기
  - `<leader>hs`: 해당 변경 블록만 스테이징 (git add)
  - `<leader>hr`: 해당 변경 블록 변경 취소 (Revert)
  - `<leader>hb`: 현재 줄의 Git Blame(작성자, 커밋 메시지) 확인
  - `<leader>hB`: 현재 줄 Git Blame 인라인 표시 토글

---

### 7. 창 분할 및 탭 관리 (Window & Splits)

- `<leader>sv`: 세로로 창 분할 (Vertical Split)
- `<leader>sh`: 가로로 창 분할 (Horizontal Split)
- `<leader>se`: 분할된 창 크기 균등 분할
- `<leader>sx`: 현재 분할 창 닫기
- `<leader>sm`: 현재 창 최대화 / 복원 토글 (Vim Maximizer)
- `Ctrl + h / j / k / l`: 분할된 창 사이를 왼쪽/아래/위/오른쪽으로 방향키처럼 자유롭게 이동 (tmux-navigator)

---

### 8. 편의 기능 및 텍스트 오브젝트 (Surround & Substitute)

- **따옴표/괄호 감싸기 & 변경 (nvim-surround)**:
  - 단어에 따옴표 추가: `ysiw"` (`ys` + `inner word` + `"`)
  - 따옴표를 작은따옴표로 변경: `cs"'` (`change surround` `"` to `'`)
  - 따옴표 제거: `ds"` (`delete surround` `"`)
- **치환 (Substitute)**:
  - 복사한 내용으로 단어 대체: `siw`
  - 줄 전체 대체: `ss`
- **빠른 ESC**:
  - 입력(Insert) 모드에서 `jk`를 빠르게 누르면 `ESC`와 동일하게 Normal 모드로 빠져나옵니다.

---

## 📦 새로운 언어 도구 추가하기 (Mason)

Python, TypeScript, HTML, CSS, Tailwind, Svelte, GraphQL, Prisma, ESLint 등이 기본 구성되어 있습니다.  
추가로 Go, Rust, Java, C++ 등의 언어 서버나 포맷터가 필요한 경우:

1. Neovim 실행 후 `:Mason` 입력
2. 인터랙티브 창에서:
   - `1` (LSP), `2` (DAP), `3` (Linter), `4` (Formatter) 탭 이동
   - `/` 키로 원하는 도구 검색 (예: `gopls`, `rust-analyzer`, `clangd`)
   - `i` 키를 눌러 설치 완료
3. 설치된 서버는 Neovim에서 즉시 자동 인식됩니다.

---

## 💾 세션 저장 및 복원 (Auto-Session)

- `<leader>ws`: 현재 열려있는 창 배치와 버퍼를 작업 공간 세션으로 저장
- `<leader>wr`: 이전 작업 공간 세션 복원
