directory=$(
	{
		fd . ~/dev ~/ ~/areas ~/projects -t d --maxdepth 1 | \
	awk '{
    short=$0
    sub("^/Users/toby/", "", short)
    sub("/$", "", short)
    slash = index(short, "/")
    if (slash > 1) {
        first = substr(short,1,1)
        rest = substr(short, slash+1)
        short = first "/" rest
    }
    print short "\t" $0
}'

printf ".config\t$HOME/.config"
} | fzf-tmux -p 80%,80% --with-nth=1 --delimiter=$'\t' | cut -f2
)

if [[ -z "$directory" ]]; then
    exit 0
fi

name=$(basename "$directory" | tr . _)

if [[ -z $TMUX ]] ; then
    tmux new-session -s $name -c $selected
    exit 0
fi

if ! tmux has-session -t=$name 2> /dev/null; then
    tmux new-session -ds "$name" -c "$directory"
fi

tmux switch-client -t "$name"
