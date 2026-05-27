function toby_shorten_path
	set pwd $argv
	set new (string replace "$HOME" "" $pwd)
	set inHome $status
	set new (string sub -s 2 $new) # remove leading /
	set parts (string split "/" $new)
	if test $inHome = 0
		switch $parts[1]
			case code
				set parts[1] c
			case Downloads
				set parts[1] Down
			case projects
				set parts[1] p
			case school
				set parts[1] s
			case .config
				set parts[1] .conf
		end
	end
	# echo $parts
	# echo (string join '/' $parts)
	set final (string join '/' $parts)
	if test (count $parts) = 1
		set final "$final/"
	end
	if test $inHome != 0
		set final "/$final"
	end
	printf $final
end

# shorten /Users/toby/.config/nvim/lua/toby
# shorten /Users/toby/.config
# shorten /Users/toby/code
# shorten /Users/toby/Downloads
# shorten /Users/toby/code/golox/cmd/golox
# shorten /Users/toby/code/advent-of-code/2025
# shorten /opt/homebrew/Cellar/python@3.14/3.14.2.reinstall

function fish_prompt
	set_color blue
	if contains -- --final-rendering $argv
		set_color blue
		printf "❯ "
		printf \n
	else
		# printf \n
		toby_shorten_path $PWD
		printf \n
		printf "❯ "
	end
end

function fish_right_prompt
	set code $status
	if contains -- --final-rendering $argv
		set_color -d
		printf "$(date '+%H%M')"
	else
		printf $code
	end
end

set -g fish_transient_prompt 1
