# Enable zsh Prompt Expansion
setopt PROMPT_SUBST

# To load vcs_info like shown in Episode III (https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples)
autoload -Uz vcs_info
config_zstyle() {
	local branch_width
	branch_width=$(( [#10] $COLUMNS * 0.2 ))
	zstyle ':vcs_info:*' enable git
	zstyle ':vcs_info:*' check-for-changes true
	zstyle ':vcs_info:*' formats "%{%F{blue}%}%${branch_width}>…>%b%>>%{%f%}%{%F{yellow}%}%m%{%f%}%c%u"
	zstyle ':vcs_info:*' actionformats "%{%F{blue}%}%${branch_width}>…>%b%>>%{%F{yellow}%}(%{%F{red}%}%a%{%F{yellow}%})%{%f%}%c%u"
	zstyle ':vcs_info:*' stagedstr '%{%F{green}%}●%{%f%}'
	zstyle ':vcs_info:*' unstagedstr '%{%F{red}%}◐%{%f%}'
}

precmd() {
	# set tab title (`\e]1;`='start', `\a`='end')
	# `%17<X<`='truncation-start', `%<<`='truncation-end'
	print -Pn "\e]1;%17<…<%~%<<\a"

	config_zstyle
	vcs_info
	if [[ -n ${vcs_info_msg_0_} ]]; then
		# vcs_info found something
		PROMPT='$(prompt_vcs_construction)'
	else
		# nothing from vcs_info
		PROMPT='$(prompt_construction)'
	fi
}

RPROMPT='[%D{%T}]'

# Prompt construction with version control information
prompt_vcs_construction() {
	local path_width
	path_width=$(( [#10] $COLUMNS * 0.3 ))
	prompt_user_host_part
	prompt_segment black cyan "%${path_width}<…<%~%<<"
	prompt_segment black blue "($(git_remote_status)${vcs_info_msg_0_}$(git_untracked)%{%F{blue}%})"
	print -n '%{%f%}'
	prompt_border
}

# Prompt construction without version control information
prompt_construction() {
	prompt_user_host_part
	prompt_segment black cyan '%-70<…<%~%<<'
	print -n '%{%f%}'
	prompt_border
}

# Construct user@host prompt part
# Will omit user if `$USER` equals `$ZSH_DEFAULT_USER`
prompt_user_host_part() {
	if [[ $USER != $ZSH_DEFAULT_USER ]]; then
		prompt_segment black green '%n'
	fi
	prompt_segment black white '@'
	prompt_segment black red '%m'
	prompt_segment black white ':'
}

# Construct prompt border
# Will be red when exit code is != 0
prompt_border() {
	prompt_segment black white '%(?.%{%F{white}%}.%{%F{red}%})%(!.∷.∵)%{%f%} '
}

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts
# (adapted from https://github.com/agnoster/agnoster-zsh-theme/blob/master/agnoster.zsh-theme)
CURRENT_BG='NONE'
SEGMENT_SEPARATOR=""

# Begin a segment
# Takes three arguments, background, foreground, content (and optional seperator)
prompt_segment() {
	local bg fg sep
	bg="%K{$1}"
	fg="%F{$2}"
	[[ -n $4 ]] && sep="$4" || sep="$SEGMENT_SEPARATOR"
	if [[ -n $3 ]]; then
		if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
			print -n "%{$bg%F{$CURRENT_BG}%}$sep%{$fg%}"
		else
			print -n "%{$bg%}%{$fg%}"
		fi
		CURRENT_BG=$1
		print -n $3
	fi
}

# End the prompt, closing any open segments
prompt_end() {
	local sep
	[[ -n $1 ]] && sep="$1" || sep="$SEGMENT_SEPARATOR"
	if [[ -n $CURRENT_BG ]]; then
		print -n "%{%k%F{$CURRENT_BG}%}$sep"
	else
		print -n "%{%k%}"
	fi
	print -n "%{%f%}"
	CURRENT_BG=''
}

### vcs information
# Gets the difference between the local and remote branches
# (adapted from https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh)
function git_remote_status() {
	local remote ahead behind git_remote_status
	remote=${$(command git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2> /dev/null)/refs\/remotes\/}
	if [[ -n ${remote} ]]; then
		ahead=$(command git rev-list ${hook_com[branch]}@{upstream}..HEAD 2> /dev/null | wc -l)
		behind=$(command git rev-list HEAD..${hook_com[branch]}@{upstream} 2> /dev/null | wc -l)

		if [[ $ahead -eq 0 ]] && [[ $behind -eq 0 ]]; then
			git_remote_status="%{%F{green}%}%{%f%}"
		elif [[ $ahead -gt 0 ]] && [[ $behind -eq 0 ]]; then
			git_remote_status="%{%F{yellow}%}$((ahead))∆%{%f%}"
		elif [[ $behind -gt 0 ]] && [[ $ahead -eq 0 ]]; then
			git_remote_status="%{%F{yellow}%}$((behind))∇%{%f%}"
		elif [[ $ahead -gt 0 ]] && [[ $behind -gt 0 ]]; then
			git_remote_status="%{%F{yellow}%}$((ahead))∆$((behind))∇%{%f%}"
		fi
	else
		git_remote_status="%{%F{yellow}%}%{%f%}"
	fi
	echo $git_remote_status
}

function git_untracked() {
	local git_status_porcelain
	git_status_porcelain=$(command git status --porcelain 2> /dev/null | grep -E '^\?\?' | tail -n1)
	if [[ -n $git_status_porcelain ]]; then
		echo "%{%F{red}%}○%{%f%}"
	fi
}
