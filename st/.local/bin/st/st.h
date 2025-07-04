/* See LICENSE for license details. */

#include <stdint.h>
#include <sys/types.h>

#include <gd.h>
#include <glib.h>

/* macros */
#define LEN(a)			(sizeof(a) / sizeof(a)[0])
#define BETWEEN(x, a, b)	((a) <= (x) && (x) <= (b))
#define DIVCEIL(n, d)		(((n) + ((d) - 1)) / (d))
#define DEFAULT(a, b)		(a) = (a) ? (a) : (b)
#define LIMIT(x, a, b)		(x) = (x) < (a) ? (a) : (x) > (b) ? (b) : (x)
#define ATTRCMP(a, b)		(((a).mode & (~ATTR_WRAP) & (~ATTR_LIGA)) != ((b).mode & (~ATTR_WRAP) & (~ATTR_LIGA)) || \
				(a).fg != (b).fg || \
				(a).bg != (b).bg)
#define TIMEDIFF(t1, t2)	((t1.tv_sec-t2.tv_sec)*1000 + \
				(t1.tv_nsec-t2.tv_nsec)/1E6)
#define MODBIT(x, set, bit)	((set) ? ((x) |= (bit)) : ((x) &= ~(bit)))

#define TRUECOLOR(r,g,b)	(1 << 24 | (r) << 16 | (g) << 8 | (b))
#define IS_TRUECOL(x)		(1 << 24 & (x))

// This decor color indicates that the fg color should be used. Note that it's
// not a 24-bit color because the 25-th bit is not set.
#define DECOR_DEFAULT_COLOR	0x0ffffff

enum glyph_attribute {
	ATTR_NULL       = 0,
	ATTR_BOLD       = 1 << 0,
	ATTR_FAINT      = 1 << 1,
	ATTR_ITALIC     = 1 << 2,
	ATTR_UNDERLINE  = 1 << 3,
	ATTR_BLINK      = 1 << 4,
	ATTR_REVERSE    = 1 << 5,
	ATTR_INVISIBLE  = 1 << 6,
	ATTR_STRUCK     = 1 << 7,
	ATTR_WRAP       = 1 << 8,
	ATTR_WIDE       = 1 << 9,
	ATTR_WDUMMY     = 1 << 10,
 	ATTR_BOXDRAW    = 1 << 11,
	ATTR_LIGA       = 1 << 12,
	ATTR_BOLD_FAINT = ATTR_BOLD | ATTR_FAINT,
	ATTR_IMAGE      = 1 << 14,
};

enum drawing_mode {
	DRAW_NONE = 0,
	DRAW_BG   = 1 << 0,
	DRAW_FG   = 1 << 1,
};

enum selection_mode {
	SEL_IDLE = 0,
	SEL_EMPTY = 1,
	SEL_READY = 2
};

enum selection_type {
	SEL_REGULAR = 1,
	SEL_RECTANGULAR = 2
};

enum selection_snap {
	SNAP_WORD = 1,
	SNAP_LINE = 2
};

enum underline_style {
	UNDERLINE_STRAIGHT = 1,
	UNDERLINE_DOUBLE = 2,
	UNDERLINE_CURLY = 3,
	UNDERLINE_DOTTED = 4,
	UNDERLINE_DASHED = 5,
};

typedef unsigned char uchar;
typedef unsigned int uint;
typedef unsigned long ulong;
typedef unsigned short ushort;

typedef uint_least32_t Rune;

#define Glyph Glyph_
typedef struct {
	Rune u;           /* character code */
	ushort mode;      /* attribute flags */
	uint32_t fg;      /* foreground  */
	uint32_t bg;      /* background  */
	uint32_t decor;   /* decoration (like underline) */
} Glyph;

typedef Glyph *Line;

typedef union {
	int i;
	uint ui;
	float f;
	const void *v;
} Arg;

typedef struct {
	uint b;
	uint mask;
	void (*func)(const Arg *);
	const Arg arg;
} MouseKey;

void die(const char *, ...);
void redraw(void);
void draw(void);

void externalpipe(const Arg *);
void iso14755(const Arg *);
void kscrolldown(const Arg *);
void kscrollup(const Arg *);
void newterm(const Arg *);
void printscreen(const Arg *);
void printsel(const Arg *);
void sendbreak(const Arg *);
void toggleprinter(const Arg *);

int tattrset(int);
int tisaltscr(void);
void tnew(int, int);
void tresize(int, int);
void tsetdirtattr(int);
void ttyhangup(void);
int ttynew(const char *, char *, const char *, char **);
size_t ttyread(void);
void ttyresize(int, int);
void ttywrite(const char *, size_t, int);

void resettitle(void);

void selclear(void);
void selinit(void);
void selstart(int, int, int);
void selextend(int, int, int, int);
int selected(int, int);
char *getsel(void);

Glyph getglyphat(int, int);

size_t utf8encode(Rune, char *);

void *xmalloc(size_t);
void *xrealloc(void *, size_t);
char *xstrdup(const char *);

int isboxdraw(Rune);
ushort boxdrawindex(const Glyph *);
#ifdef XFT_VERSION
/* only exposed to x.c, otherwise we'll need Xft.h for the types */
void boxdraw_xinit(Display *, Colormap, XftDraw *, Visual *);
void drawboxes(int, int, int, int, XftColor *, XftColor *, const XftGlyphFontSpec *, int);
#endif

/* config.h globals */
extern char *utmp;
extern char *stty_args;
extern char *vtiden;
extern wchar_t *worddelimiters;
extern int allowaltscreen;
extern char *termname;
extern unsigned int tabspaces;
extern unsigned int defaultfg;
extern unsigned int defaultbg;
extern unsigned int defaultcs;
extern const int boxdraw, boxdraw_bold, boxdraw_braille;
extern float alpha;
extern MouseKey mkeys[];
extern int ximspot_update_interval;
