# Starship 프롬프트 설정

[Starship](https://starship.rs/)은 빠르고 다양한 정보를 깔끔하게 보여주는 쉘 프롬프트 커스터마이저입니다.

---

## 디렉토리 구성

- [starship.toml](file:///Users/heeyong/Workspaces/dev-environment-files/starship/starship.toml): Starship 상세 설정 파일

---

## 주요 설정 특징

- **컬러 팔레트**: `nord` 테마 기반의 일관된 색상 구성
- **디렉토리 표시**: 문서(`󰈙`), 다운로드(` `), 음악(` `), 사진(` `) 등 Nerd Font 아이콘 치환
- **Git 상태**: 브랜치명(` `) 및 스테이징/커밋 변경 상태 표시
- **Kubernetes 연동**: 현재 컨텍스트(`⛵`) 및 네임스페이스 실시간 표시
- **언어 및 런타임**: Python(` `), Node.js, Lua, Go, Rust 등 사용 중인 런타임 버전 자동 감지
- **도커 및 실행 시간**: Docker 컨텍스트 및 직전 명령어 실행 시간(`cmd_duration`) 표시

---

## 설치 방법

```bash
brew install starship
```

---

## 심볼릭 링크 설정

```bash
ln -sfn /Users/heeyong/Workspaces/dev-environment-files/starship/starship.toml ~/.config/starship.toml
```

---

## Zsh 연동

[zsh/.zshrc](file:///Users/heeyong/Workspaces/dev-environment-files/zsh/.zshrc)에 다음 라인을 추가하여 활성화합니다:

```zsh
eval "$(starship init zsh)"
```
