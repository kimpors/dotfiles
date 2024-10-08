#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export XDG_RUNTIME_DIR=/run/user/$UID
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

export PATH=$PATH:$XDG_DATA_HOME/cargo/bin:$XDG_DATA_HOME/bin:$XDG_DATA_HOME/builds

# .NET SDK Configuration
export DOTNET_CLI_TELEMETRY_OPTOUT=1 # Disable analytics
export DOTNET_ROOT="/usr/bin/dotnet"
export DOTNET_HOME="/usr/bin/dotnet"
export DOTNET_ROLL_FORWARD_TO_PRERELEASE=1

# Add the .NET SDK to the system paths so we can use the `dotnet` tool.
export PATH="$PATH:/usr/bin/dotnet"
export PATH="$PATH:/usr/bin/dotnet/sdk"
export PATH="$PATH:$HOME/.dotnet/tools"

export MANPAGER="nvim +Man!"

export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export NIMBLE_DIR="$XDG_DATA_HOME"/nibmle
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export NUGET_PACKAGES="$XDG_CACHE_HOME"/nuget
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export MPD_HOST=localhost

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc 
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

export VIEB_DATAFOLDER="$XDG_DATA_HOME"/vieb
export VIEB_CONFIG_FILE="$XDG_CONFIG_HOME"/viebrc

startx
