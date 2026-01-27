#!/usr/bin/env bash
HEADER="C- [4;38;2;127;117;96md[0melete [4;38;2;127;117;96mr[0mename"
sesh list --icons | fzf-tmux -p 80%,70% --ansi --no-sort --border-label ' sesh ' --header "$HEADER" --color='border:#7f7560' --bind 'ctrl-d:change-prompt(D )' --bind 'ctrl-r:execute(
				printf "stdin" | fzf --print-query --prompt="Rename to: " --query "q" | head -n1
)' --preview 'sesh preview {}' --preview-window 'right:75%'
# --no-sort --ansi --border-label ' sesh '--prompt '⚡  '# --bind 'tab:down,btab:up'# --bind 'ctrl-t:change-prompt(H   )+reload(sesh list -t --icons)'# --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)'# --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)'# --preview 'sesh preview {}' # sesh list --icons | fzf-tmux -p 80%,70% \
# 	--header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
# 	--bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
# 	--bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
# 	--bind 'ctrl-f:change-prompt(🔎  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
# 	--preview-window 'right:55%' \
# # --color='bg:#4B4B4B,bg+:#3F3F3F,info:#BDBB72,border:#6B6B6B,spinner:#98BC99'
