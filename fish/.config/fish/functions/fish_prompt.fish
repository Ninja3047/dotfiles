function fish_prompt
	set_color green
	printf '%s' (whoami)
	printf '@'

	printf '%s' (hostname|cut -d . -f 1)
	printf ' '

	set_color $fish_color_cwd
	echo -n $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||'

	printf ' $ '
	set_color normal
end
