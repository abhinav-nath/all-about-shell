# all-about-shell

This repository contains various shell scripting snippets. Great for recalling basic syntaxes while writing shell scripts.
It also includes a dev setup for `zsh` (aliases, functions, etc).

- **[Scripting](./scripting)**
  - [notes](./scripting/shell-scripting-notes.md)
  - [One liner scripts](./scripting/one-liner-scripts.md)
  - [arguments](./scripting/arguments)
  - [arrays](./scripting/arrays)
  - [awk](./scripting/awk)
  - [sed](./scripting/sed)
  - [loops](./scripting/loops)
  - [wildcards](./scripting/wildcards)

#### My setup for zsh:

- **[Setup](./dev-setup)**
  - [.zshrc](./dev-setup/.zshrc)
  - [.aliases](./dev-setup/.aliases)
  - [.functions](./dev-setup/.functions)
  - [kubectl aliases](./dev-setup/kubectl-aliases.md)

### Order of Operations

This is the order in which these files get read. Keep in mind that it reads first from the system-wide file (i.e. `/etc/zshenv`) then from the file in your home directory (`~/.zshenv`) as it goes through the following order:

`.zshenv` → `.zprofile` → `.zshrc` → `.zlogin` → `.zlogout`

Details - [What should/shouldn't go in .zshenv, .zshrc, .zlogin, .zprofile, .zlogout?](https://unix.stackexchange.com/q/71253/107777)
