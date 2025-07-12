/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
[SchemeNorm] = { "#bbbbbb", "#222222" },
[SchemeSel] = { "#eeeeee", "#005577" },
[SchemeOut] = { "#000000", "#00ffff" },
[SchemeNorm] = { "#ebdbb2", "#282828" },
[SchemeSel] = { "#ebdbb2", "#98971a" },
[SchemeOut] = { "#ebdbb2", "#8ec07c" },
};
/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines      = 5;
static unsigned int columns    = 1;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static const unsigned int border_width = 3;


/*
 * -vi option; if nonzero, vi mode is always enabled and can be
 * accessed with the global_esc keysym + mod mask
 */
static unsigned int vi_mode = 1;
static unsigned int start_mode = 0;  /* 0 = insert mode, 1 = normal mode */
static Key global_esc = { XK_n, Mod1Mask }; /* escape key when vi mode is not explicitly enabled */
static Key quit_keys[] = {
    /* keysym   modifier */
    { XK_q,     0 }
};
