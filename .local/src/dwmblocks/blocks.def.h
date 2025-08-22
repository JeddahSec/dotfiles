//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "cat /tmp/recordingicon 2>/dev/null", 0,	9},
	{"", "recording-status",0,	3},
	{"", "target-status",5,	0},
	{"", "vpn-details",5,	0},
	{"", "dwmblocks_networkmanager",10,	14},
	{"",  "dwmblocks_disks",          0,  9},
	{"", "dwmblocks_systemstats",   10,	14},
	{"", "status-weather",        1800,	 0},
	{"", "status-timedate",          5,	 0}
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " ❘  ";
static unsigned int delimLen = 5;

