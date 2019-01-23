function fish_user_key_bindings
	# plugin-peco
	bind \cr 'peco_select_history (commandline -b)'
	# ghq
	bind \c] peco_select_ghq_repository
  	bind \cG '__ghq_crtl_g'
	# fzf
	# bind \ct '__fzf_find_file'
	# bind \cr '__fzf_reverse_isearch'
	# bind \cx '__fzf_find_and_execute'
	# bind \ce '__fzf_cd'
end
