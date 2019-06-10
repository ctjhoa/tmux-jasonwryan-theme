#!/usr/bin/env bash

main() {
	# Wm window title string (uses statusbar variables)
	tmux set-option -g set-titles-string "tmux:#I [ #W ]"

	tmux set-option -g window-status-format "#I:#W"
	tmux set-option -g window-status-current-format "#I:#W"
	
	tmux set-option -g status-interval 1
	tmux set-option -g status-justify centre # center align window list
	
	# Default statusbar colors
	tmux set-option -g status-fg white # deprecated
	tmux set-option -g status-bg default # deprecated
	tmux set-option -g status-style fg=white,bg=default
	
	# Default window title colors
	tmux set-window-option -g window-status-fg black # deprecated
	tmux set-window-option -g window-status-bg default # deprecated
	tmux set-window-option -g window-status-attr dim # deprecated
	tmux set-window-option -g window-status-style fg=black,bg=default,dim
	
	# Active window title colors
	tmux set-window-option -g window-status-current-fg white # deprecated
	tmux set-window-option -g window-status-current-bg default # deprecated
	tmux set-window-option -g window-status-current-attr dim # deprecated
	tmux set-window-option -g window-status-current-style fg=white,bg=default,dim
	
	# Set bell colours
	tmux set-option -g window-status-bell-fg red # deprecated
	tmux set-option -g window-status-bell-bg default # deprecated                                                                     
	tmux set-option -g window-status-bell-attr bright # deprecated
	tmux set-option -g window-status-bell-style fg=red,bg=default,bright
	
	# Command/message line colors
	tmux set-option -g message-fg white # deprecated
	tmux set-option -g message-bg black # deprecated
	tmux set-option -g message-attr bright # deprecated
	tmux set-option -g message-style fg=white,bg=black,bright
	
	# Statusbar starting in X or not
	if [ -n "$DISPLAY" ]
	then
		# in X
		tmux set-option -g status-attr bright # deprecated
		tmux set-option -g status-right-length 40
		tmux set-option -g status-left-length 40
		tmux set-option -g status-style bright

		tmux set-option -g status-left "#[fg=blue]#H #[fg=black,bright]• #[default]#[fg=green]#(uname -r)#[default]"
		tmux set-option -g status-right "#[fg=cyan] #(uptime -p) #[fg=black,bright]• #[fg=magenta]#{cpu_percentage}"
	else
		# Statusbar if tmux run in console
		# information normally in dwm bar
		tmux set-option -g status-attr bright # deprecated
		tmux set-option -g status-right-length 50
		tmux set-option -g status-left-length 50
		tmux set-option -g status-style bright

		# default window title colors
		tmux set-window-option -g window-status-fg black # deprecated
		tmux set-window-option -g window-status-bg default # deprecated
		tmux set-window-option -g window-status-attr bright # deprecated
		tmux set-window-option -g window-status-style fg=black,bg=default,bright

		# message colours
		tmux set-option -g message-fg black # deprecated
		tmux set-option -g message-bg green # deprecated
		tmux set-option -g message-attr bright # deprecated
		tmux set-option -g message-style fg=black,bg=green,bright

		tmux set-option -g status-left "#[fg=blue] #H #[fg=black]• #[fg=green]#(uname -r) #[fg=black]• #[fg=yellow]#{battery_percentage}"
		tmux set-option -g status-right "#[fg=yellow,nobright] #(uptime -p)#[fg=black,bright] • #[fg=magenta]#{cpu_percentage}#[fg=black] • #[fg=cyan]%I:%M #[default]"
	fi
}
main
