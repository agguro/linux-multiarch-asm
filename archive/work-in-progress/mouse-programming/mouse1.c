#include <stdio.h>
#include <gpm.h>
#include <string.h>
#include <linux/keyboard.h>

int my_handler(Gpm_Event *event, void *data)
{       char report_string[80];

        report_string[0] = '\0';
        if(event->type & GPM_DOWN)
        {       if(event->modifiers & (1 << KG_SHIFT)) /* Shift is
pressed */
                        strcat(report_string, "Shift + ");
                if(event->modifiers & (1 << KG_CTRL))  /* Control is
pressed */
                        strcat(report_string, "Ctrl + ");
                if(event->modifiers & (1 << KG_ALT))   /* Left Alt is
pressed */
                        strcat(report_string, "Left Alt + ");
                if(event->modifiers & (1 << KG_ALTGR)) /* Right Alt is
pressed */
                        strcat(report_string, "Right Alt + ");
                if(event->buttons & GPM_B_LEFT)
                        strcat(report_string, " Left Button click ");
                if(event->buttons & GPM_B_RIGHT)
                        strcat(report_string, " Right Button click ");
                if(event->buttons & GPM_B_MIDDLE)
                        strcat(report_string, " Middle Button click ");

                printf("report string: %s\n", report_string);
        }
        return 0;
}

int main()
{       Gpm_Connect conn;
        int c;

        conn.eventMask  = ~0;
        conn.defaultMask = 0;
        conn.minMod     = 0;
        conn.maxMod     = ~0;

        if(Gpm_Open(&conn, 0) == -1)
                printf("Cannot connect to mouse server\n");

        gpm_handler = my_handler;
        while((c = Gpm_Getc(stdin)) != EOF){}
                printf("print this too: %c\n", c);
        Gpm_Close();
        return 0;
}