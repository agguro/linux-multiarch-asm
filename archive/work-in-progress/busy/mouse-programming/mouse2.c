#include <stdio.h>
#include <gpm.h>
#include <string.h>
#include <linux/keyboard.h>
#include <ncurses.h>
#include <stdlib.h>
#include <unistd.h>

#define WIDTH 30
#define HEIGHT 10
#define MOVE_DONE 99

int startx = 0;
int starty = 0;

char *choices[] = {
                          "Choice 1",
                          "Choice 2",
                          "Choice 3",
                          "Choice 4",
                          "Exit",
                  };

int n_choices = sizeof(choices) / sizeof(char *);

void print_menu(WINDOW *menu_win, int highlight);
int report_choice(int mouse_x, int mouse_y);

int my_handler(Gpm_Event *event, void *data)
{       int choice = -1;

        if(event->type & GPM_MOVE)
        {       choice = report_choice(event->x, event->y);
                if(choice == -1)
                        return 0;
                else
                        return MOVE_DONE + choice;
/* Return the choice with move_done added so that
 * we can distinguish in the main loop */
}
        if(event->type & GPM_DOWN)
        {       choice = report_choice(event->x, event->y);
                if(choice == -1)
                        return 0;       /* Tell Gpm_Getc() to go on */
                else
                        return choice;
        }

        return 0;
}

int main()
{       Gpm_Connect conn;
        int c, choice = -1;
        WINDOW *menu_win;

        if(!isatty(1))
        {       printf("stdout not attached to this tty");
                exit(1);
        }

        conn.eventMask  = ~0;
        conn.defaultMask = 0;
        conn.minMod     = 0;
        conn.maxMod     = ~0;


        if(Gpm_Open(&conn, 0) == -1)
                printf("Cannot connect to mouse server\n");

        initscr();
        clear();
        noecho();
        cbreak();       /* Line buffering disabled. pass on everything
*/
        startx = (80 - WIDTH) / 2; /* At the middle */
        starty = (24 - HEIGHT) / 2;

        menu_win = newwin(HEIGHT, WIDTH, starty, startx);
        print_menu(menu_win, 1);
gpm_handler = my_handler;
        gpm_visiblepointer = 1;
        while((c = Gpm_Wgetch(menu_win)) != EOF)
        {       if(c != -1 && gpm_hflag)
                {
                        if(c > MOVE_DONE)
                        {       choice = c - MOVE_DONE; /* Find out the
choice and update menu */
                                print_menu(menu_win, choice);
                                continue;
                        }
                        else
                        {       mvprintw(23, 1, "Choice made is : %d String Chosen is \"%10s\"", c, choices[c - 1]);
                                refresh();
                                if(c == n_choices)              /* Exit chosen */
                                        break;
                                print_menu(menu_win, c);
                        }
                }
        }
        Gpm_Close();
        endwin();

        return 0;
}

/* Prints the menu. High light tells the option to highlight */
void print_menu(WINDOW *menu_win, int highlight)
{
        int x, y, i;

        x = 2;
        y = 2;
        box(menu_win, 0, 0);
        for(i = 0; i < n_choices; ++i)
        {       if(highlight == i + 1)
                {       wattron(menu_win, A_REVERSE);
                        mvwprintw(menu_win, y, x, "%s", choices[i]);
                        wattroff(menu_win, A_REVERSE);
                }
                else
                        mvwprintw(menu_win, y, x, "%s", choices[i]);
                ++y;
        }
        wrefresh(menu_win);
}
/* This function finds out the choice on which mouse is clicked */
int report_choice(int mouse_x, int mouse_y)
{       int i,j, choice;

        i = startx + 2;
        j = starty + 3;

        for(choice = 0; choice < n_choices; ++choice)
                if(mouse_y == j + choice && mouse_x >= i && mouse_x <= i
+ strlen(choices[choice]))
                        break;

        if(choice == n_choices)
                return -1;
        else
                return (choice + 1);

}