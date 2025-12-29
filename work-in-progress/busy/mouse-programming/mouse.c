#include <stdio.h>
#include <gpm.h>

int my_handler(Gpm_Event *event, void *data)
{       printf("Event Type : %d at x=%d y=%d\n", event->type, event->x, event->y);
        return 0;       
}
int main()
{
       Gpm_Connect conn;
        int c;
        conn.eventMask  = ~0;   /* Want to know about all the events */
        conn.defaultMask = 0;   /* don't handle anything by default  */
        conn.minMod     = 0;    /* want everything                   */  
        conn.maxMod     = ~0;   /* all modifiers included            */
        
        if(Gpm_Open(&conn, 0) == -1)
                printf("Cannot connect to mouse server\n");
        
        gpm_handler = my_handler;
        while((c = Gpm_Getc(stdin)) != EOF)
                printf("%c", c);
        Gpm_Close();
        return 0;
}
