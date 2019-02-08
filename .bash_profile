# Add Homebrew `/usr/local/bin` and User `~/bin` to the `$PATH`
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH
export PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export GIT_HOME='/usr/local/Cellar/git/2.20.1/bin'

PATH=&GIT_HOME:$PATH
