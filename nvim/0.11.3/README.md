# Neovim 0.11.3 설정

Neovim 0.11.x 버전을 기준으로 작성된 설정 파일입니다.  
이 디렉토리는 당시의 플러그인 락 파일([lazy-lock.json](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/lazy-lock.json)) 및 설정 원본을 그대로 보존하고 있습니다.

---

## 디렉토리 구성

- [init.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/init.lua): Neovim 진입점 (core 및 lazy 로드)
- [lazy-lock.json](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/lazy-lock.json): 0.11.3 동작 검증 시점의 플러그인 커밋 락 파일
- [.stylua.toml](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/.stylua.toml): StyLua 코드 포맷터 설정
- [lua/hy0007/](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/lua/hy0007/)
  - [core/](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/lua/hy0007/core/): 기본 에디터 옵션([options.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/lua/hy0007/core/options.lua)) 및 키맵([keymaps.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/lua/hy0007/core/keymaps.lua))
  - [lazy.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/lua/hy0007/lazy.lua): `lazy.nvim` 패키지 매니저 부트스트랩 및 설정
  - [plugins/](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/lua/hy0007/plugins/): 플러그인별 모듈 설정 (Telescope, Treesitter, Lualine 등)
  - [plugins/lsp/](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/lua/hy0007/plugins/lsp/): Mason 및 LSP 설정 ([lspconfig.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/lua/hy0007/plugins/lsp/lspconfig.lua), [mason.lua](file:///Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/lua/hy0007/plugins/lsp/mason.lua))

---

## 주요 특징 및 의존성

- **패키지 관리**: `lazy.nvim`
- **LSP 보조**: `folke/neodev.nvim`
- **플러그인 커밋 고정**: `lazy-lock.json`을 통해 당시 설치된 정확한 플러그인 버전 재현 가능

---

## 설정 파일 복사 방법

0.11.3 설정을 활성화하려면 아래 명령어로 `~/.config/nvim`에 설정을 복사합니다:

```bash
mkdir -p ~/.config/nvim
cp -R /Users/heeyong/Workspaces/dev-environment-files/nvim/0.11.3/. ~/.config/nvim/
```
