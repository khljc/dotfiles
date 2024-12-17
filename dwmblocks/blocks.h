// Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
		{" bat - ",     "echo \"$(cat /sys/class/power_supply/BAT0/capacity)%\"", 15, 0},
		{"wtr - " ,     "curl -s 'wttr.in/Kuala_Lumpur?format=%t'", 300, 0},
		{"audio - ",    "~/.local/bin/audio.sh", 1, 0},
		{"date - " ,    "date '+%m.%d'", 60, 0},
		{"time - ",     "date '+%H:%M '", 5, 0},};

static char delim[] = " | ";
static unsigned int delimLen = 7;
