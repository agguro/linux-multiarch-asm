//https://www.linuxjournal.com/article/4600
#include <stdio.h>
#include <gpm.h>
#include <string.h>
#include <linux/keyboard.h>
#include <ncurses.h>
#include <stdlib.h>
#include <unistd.h>

#define CTRLD   4

typedef struct _WIN {
        int nlines;
        int ncols;
        int y;
        int x;
        WINDOW *p_win;
}WIN;

void create_windows(WIN my_windows[]);
void set_win_params(WIN *win, int nlines, int ncols, int y, int x);

int my_handler(Gpm_Event *p_event, void *data)
{       WINDOW *current_win;
        WIN *my_win;

        my_win = (WIN *)data;
        current_win = my_win -> p_win;

        if(p_event->type & GPM_ENTER)
                mvwprintw(current_win, 1, 1, "Entered");
        if(p_event->type & GPM_LEAVE)
                mvwprintw(current_win, 1, 1, "Leaving");
        if(p_event->type & GPM_DOWN)
        {       mvwprintw(current_win, my_win->nlines - 2, 1, "Mouse button down");
                if(p_event->buttons & GPM_B_LEFT)
                        mvwprintw(current_win, my_win->nlines/2, 1,"Left Button clicked  ");
                if(p_event->buttons & GPM_B_RIGHT)
                        mvwprintw(current_win, my_win->nlines/2,1,"Right Button clicked ");
                if(p_event->buttons & GPM_B_MIDDLE)
                        mvwprintw(current_win, my_win->nlines/2,1,"Middle Button clicked");
        }
        if(p_event->type & GPM_UP)
        {       mvwprintw(current_win, my_win->nlines - 2, 1, "Mouse button up  ");
                if(p_event->buttons & GPM_B_LEFT)
                        mvwprintw(current_win, my_win->nlines/2, 1,"Left Button clicked  ");
                if(p_event->buttons & GPM_B_RIGHT)
                        mvwprintw(current_win, my_win->nlines/2,1,"Right Button clicked ");
                if(p_event->buttons & GPM_B_MIDDLE)
                        mvwprintw(current_win, my_win->nlines/2, 1,"Middle Button clicked");
        }
        wrefresh(current_win);
        return 1;
}

int main()
{       Gpm_Connect conn;
        WIN my_windows[4];
        int i, mask, c;

        conn.eventMask  = ~0;
        conn.defaultMask = 0;
        conn.minMod     = 0;
        conn.maxMod     = ~0;


        if(Gpm_Open(&conn, 0) == -1)
                printf("Cannot connect to mouse server\n");

        initscr();
        clear();
        refresh();
        noecho();
        cbreak();       /* Line buffering disabled. pass on everything
*/

        create_windows(my_windows);
        mask = GPM_UP | GPM_DOWN | GPM_ENTER | GPM_LEAVE;
        for(i = 0;i < 4; ++i)
        {       box(my_windows[i].p_win, 0, 0);
                wrefresh(my_windows[i].p_win);
                Gpm_PushRoi(my_windows[i].x, my_windows[i].y,my_windows[i].x +my_windows[i].ncols - 1,my_windows[i].y + my_windows[i].nlines - 1, mask, my_handler, &my_windows[i]);
        }
gpm_visiblepointer      = 1;
        gpm_zerobased           = 1;
        gpm_roi_handler         = my_handler;
        gpm_roi_data            = stdscr;
        while((c = Gpm_Wgetch()) != EOF)
        {       if(c == CTRLD)
                        break;
        }
        Gpm_Close();
        endwin();

        return 0;
}

void create_windows(WIN my_windows[])
{       int     nlines = (LINES - 3) / 2;
        int ncols  = (COLS  - 3) / 2;

        my_windows[0].p_win = newwin(nlines, ncols, 1, 1);
        set_win_params(&my_windows[0], nlines, ncols, 1, 1);

        my_windows[1].p_win = newwin(nlines, ncols, 2 + nlines, 1);
        set_win_params(&my_windows[1], nlines, ncols, 2 + nlines, 1);

        my_windows[2].p_win = newwin(nlines, ncols, 1, 2 + ncols);
        set_win_params(&my_windows[2], nlines, ncols, 1, 2 + ncols);

        my_windows[3].p_win = newwin(nlines, ncols, 2 + nlines, 2 + ncols);
        set_win_params(&my_windows[3], nlines, ncols, 2 + nlines, 2 + ncols);
}

void set_win_params(WIN *win, int nlines, int ncols, int y, int x)
{       win->nlines = nlines;
        win->ncols      = ncols;
        win->y          = y;
        win->x          = x;
}
