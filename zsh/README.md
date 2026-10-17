# Zsh 쉘 환경 설정

macOS 및 Linux 환경에서 최적화된 개발 경험을 제공하는 Z shell(`.zshrc`) 설정입니다.

---

## 디렉토리 구성

- [.zshrc](file:///Users/heeyong/Workspaces/dev-environment-files/zsh/.zshrc): 쉘 환경 변수, 플러그인 로드, 유용한 별칭(Alias) 모음

---

## 주요 기능 및 구성

1. **프롬프트**: Starship 프롬프트 자동 연동 (`eval "$(starship init zsh)"`)
2. **플러그인**:
   - `zsh-syntax-highlighting`: 명령어 문법 하이라이팅 (밑줄 효과 비활성화 커스텀)
   - `zsh-autosuggestions`: 히스토리 기반 명령어 자동 완성 제안
3. **명령어 대체 및 단축 별칭**:
   - `ls` / `l`: `eza` 기반 아이콘 및 상세 목록 표시
   - `k`: `kubectl`
   - `h`: `helm`
   - `python`: `python3`
   - `pip`: `pip3`
4. **DevOps & Kubernetes 도구 연동**:
   - Rancher Desktop 실행 파일 PATH 연동
   - Krew(kubectl 플러그인 관리자) PATH 연동
   - 다중 클러스터 `KUBECONFIG` 병합 설정

---

## 사전 필수 패키지 설치

```bash
brew install zsh-syntax-highlighting zsh-autosuggestions
```

---

## 심볼릭 링크 설정

```bash
ln -sfn /Users/heeyong/Workspaces/dev-environment-files/zsh/.zshrc ~/.zshrc

# 설정 즉시 반영
source ~/.zshrc
```
