export PATH="/usr/local/bin:$PATH"

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

source ~/.bashrc

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Add Bloomberg-specific proxies if they exist (I work for Bloomberg)
if [ -f ~/.bloomberg_proxies ]; then
    . ~/.bloomberg_proxies
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Add Android SDK
export ANDROID_SDK=/Users/noah/Library/Android/sdk
export PATH=$ANDROID_SDK/platform-tools:$PATH


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/noah/bin/google-cloud-sdk/path.bash.inc' ]; then . '/Users/noah/bin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/noah/bin/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/noah/bin/google-cloud-sdk/completion.bash.inc'; fi
