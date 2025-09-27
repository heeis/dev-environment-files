# krew 설치

kubectl 플러그인 매니저

### Bash or ZSH shells

Run this command to download and install krew:

```zsh
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)
```

Add the $HOME/.krew/bin directory to your PATH environment variable. To do this, update your .bashrc or .zshrc file and append the following line:

```zsh
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
```

and restart your shell.

### kube-ctx 설치

```zsh
kubectl krew install ctx
```

### kube-ns 설치

```zsh
kubectl krew install ns
```

### kube-neat 설치

```zsh
kubectl krew install neat
```