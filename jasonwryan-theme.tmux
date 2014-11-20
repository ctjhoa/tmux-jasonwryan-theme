#!/usr/bin/env bash

main() {
	# Wm window title string (uses statusbar variables)
	tmux set-option -g set-titles-string "tmux:#I [ #W ]"

	tmux set-option -g window-status-format "#I:#W"
	tmux set-option -g window-status-current-format "#I:#W"
	
	tmux set-option -g status-interval 1
	tmux set-option -g status-justify centre # center align window list
	
	# Default statusbar colors
	tmux set-option -g status-fg white
	tmux set-option -g status-bg default
	
	# Default window title colors
	tmux set-window-option -g window-status-fg black
	tmux set-window-option -g window-status-bg default
	tmux set-window-option -g window-status-attr dim
	
	# Active window title colors
	tmux set-window-option -g window-status-current-fg white
	tmux set-window-option -g window-status-current-bg default
	tmux set-window-option -g window-status-current-attr dim
	
	# Set bell colours
	tmux set-option -g window-status-bell-bg default                                                                      
	tmux set-option -g window-status-bell-fg red
	tmux set-option -g window-status-bell-attr bright
	
	# Command/message line colors
	tmux set-option -g message-fg white
	tmux set-option -g message-bg black
	tmux set-option -g message-attr bright
	
	# Statusbar starting in X or not
	if [ -n "$DISPLAY" ]
	then
		# in X
		tmux set-option -g status-attr bright
		tmux set-option -g status-right-length 40
		tmux set-option -g status-left-length 40

		tmux set-option -g status-left "#[fg=blue]#H #[fg=black,bright]• #[default]#[fg=green]#(uname -r)#[default]"
		tmux set-option -g status-right "#[fg=cyan] #(uptime -p) #[fg=black,bright]• #[fg=magenta]#(awk \'{print $1,$2,$3}\' /proc/loadavg)"
	else
		# Statusbar if tmux run in console
		# information normally in dwm bar
		tmux set-option -g status-attr bright
		tmux set-option -g status-right-length 50
		tmux set-option -g status-left-length 50

		# default window title colors
		tmux set-window-option -g window-status-fg black
		tmux set-window-option -g window-status-bg default
		tmux set-window-option -g window-status-attr bright

		# message colours
		tmux set-option -g message-fg black
		tmux set-option -g message-bg green
		tmux set-option -g message-attr bright

		tmux set-option -g status-left "#[fg=blue] #H #[fg=black]• #[fg=green]#(uname -r) #[fg=black]• #[fg=yellow]#(sensors | awk \'\/MB\/ { print +$3\"°C\" }\')"
		tmux set-option -g status-right "#[fg=yellow,nobright] #(uptime)#[fg=black,bright] • #[fg=magenta]#(awk \'{ print $1,$2,$3 }\' /proc/loadavg)#[fg=black] • #[fg=cyan]%I:%M #[default]"
	fi
}
main
