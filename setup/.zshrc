# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/<user>/.oh-my-zsh"

# Alias definitions
# You may want to put all your additions into a separate file like
# ~/.aliases, instead of adding them here directly

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

# Function definitions
# You may want to put all your additions into a separate file like
# ~/.functions, instead of adding them here directly

if [ -f ~/.functions ]; then
  . ~/.functions
fi

cat ~/banners/dragon.txt

dt # see aliases
curl 'wttr.in/Pune?format=%l+weather+:+%C+%c+|+Temperature+%t+|+Feels+like+%f+|+Humidity+%h+|+Moon+phase+%m+|+Sunrise+%S+|+Sunset+%s\n'

sshadd # see functions

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_17_HOME=$(/usr/libexec/java_home -v17)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java17='export JAVA_HOME=$JAVA_17_HOME'

# default to Java 17
java17

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
