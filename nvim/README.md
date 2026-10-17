# Neovim 설정 (버전별 디렉토리)

Neovim 버전에 따라 최적화된 설정을 별도 디렉토리로 관리합니다.

## 디렉토리 구조

```
nvim/
├── 0.11.3/    # Neovim 0.11.x 호환 설정 (기존 설정 보존)
└── 0.12.3/    # Neovim 0.12.x 최적화 설정
```

---

## 0.12.3 최적화 주요 변경점

1. **`vim.uv` 표준 API 적용**
   - [lazy.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/lazy.lua): 비권장(deprecated)된 `vim.loop` 대신 `vim.uv`를 사용하여 시작 시 발생하는 경고를 제거했습니다.

2. **LSP 생태계 최신화 (`lazydev.nvim`)**
   - [lspconfig.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/plugins/lsp/lspconfig.lua): 공식 아카이브(지원 중단)된 `neodev.nvim` 대신 최신 표준인 `folke/lazydev.nvim`으로 교체하여 Neovim Lua API 및 `vim.uv` 타입 완성 기능을 최적화했습니다.

3. **Neovim 0.12 진단 탐색 API 적용**
   - [lspconfig.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/plugins/lsp/lspconfig.lua): `[d` / `]d` 키매핑에 0.11+부터 권장되는 `vim.diagnostic.jump({ count = ... })` 함수를 적용했습니다.

4. **Neovim 0.12 내장 LSP 활성화 (`vim.lsp.enable`)**
   - [lspconfig.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/plugins/lsp/lspconfig.lua): Neovim 0.12의 내장 LSP 아키텍처에 맞춰 `vim.lsp.enable(servers)`를 통해 설치된 서버들을 안정적으로 자동 활성화합니다.

5. **0.12 에디터 옵션 개선**
   - [options.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/core/options.lua): 
     - `undofile = true`: 세션 종료 후에도 영구 Undo 히스토리 보존
     - `updatetime = 200`: CursorHold, GitSigns, 자동완성 트리거 반응속도 개선
     - `timeoutlen = 300`: Which-Key 및 Leader 키 입력 딜레이 단축
     - `smoothscroll = true`: Neovim 0.10+ 네이티브 부드러운 스크롤 활성화
     - `inccommand = "split"`: 치환(`:%s`) 시 분할 창에서 실시간 결과 미리보기

6. **버그 및 플러그인 호환성 픽스**
   - [lualine.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/plugins/lualine.lua): Inactive 상태줄에서 정의되지 않았던 색상 변수(`semilightgray`) 정의
   - [telescope.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/plugins/telescope.lua): 키맵 설명 오타 수정 (`Find todos` -> `Find keymaps`)
   - [comment.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/plugins/comment.lua): `nvim-ts-context-commentstring`의 최신 옵션 규격 반영 (`enable_autocmd = false`)

---

## 설정 파일 복사 방법

### Neovim 0.12.3 설정 사용 시 (현재 추천)

```bash
mkdir -p ~/.config/nvim
cp -R /Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/. ~/.config/nvim/
```

### Neovim 0.11.3 설정으로 복구/전환 시

```bash
mkdir -p ~/.config/nvim
cp -R /Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/. ~/.config/nvim/
```
