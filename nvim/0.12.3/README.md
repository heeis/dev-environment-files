# Neovim 0.12.3 최적화 설정

Neovim 0.12.x 버전에 최적화된 모던 설정입니다.

---

## 디렉토리 구성

- [init.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/init.lua): Neovim 진입점
- [.stylua.toml](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/.stylua.toml): StyLua 코드 포맷터 설정
- [lua/hy0007/](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/)
  - [core/](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/core/): 기본 에디터 옵션([options.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/core/options.lua)) 및 키맵([keymaps.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/core/keymaps.lua))
  - [lazy.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/lazy.lua): `lazy.nvim` 부트스트랩 (`vim.uv` 표준 API 사용)
  - [plugins/](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/plugins/): 플러그인별 모듈 설정 (Telescope, Treesitter, Lualine 등)
  - [plugins/lsp/](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/plugins/lsp/): LSP 설정 ([lspconfig.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/plugins/lsp/lspconfig.lua), [mason.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3/lua/hy0007/plugins/lsp/mason.lua))

---

## 0.12.3 주요 최적화 사항

1. **`vim.uv` 적용**: `vim.loop` 비권장 경고 제거
2. **`lazydev.nvim` 적용**: `neodev.nvim` 지원 종료에 따라 최신 표준으로 교체 및 Lua/Vim API 타입 인텔리센스 지원
3. **`vim.diagnostic.jump` 키맵**: Neovim 0.11+ 정식 진단 탐색 함수 적용
4. **`vim.lsp.enable(servers)`**: Neovim 0.12 내장 LSP 활성화
5. **에디터 옵션**: `undofile`(영구 실행취소), `smoothscroll`(부드러운 스크롤), `inccommand`(실시간 치환 미리보기), `updatetime=200`, `timeoutlen=300`

---

## 심볼릭 링크 설정 방법

```bash
ln -sfn /Users/heeyong/Workspaces/dev-environment-files/nvim/0.12.3 ~/.config/nvim
```
