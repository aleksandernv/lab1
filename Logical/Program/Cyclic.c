
#include <bur/plctypes.h>

#ifdef _DEFAULT_INCLUDES
	#include <AsDefault.h>
#endif

void _CYCLIC ProgramCyclic(void)
{
	if(enable)
	{
		if(counter == 200)
		{
			speed = 50;
		}
		if(counter == 400)
		{
			speed = 0;
			counter = 0;
		}
		counter = counter + 1;
		
		fb_controller.e_in = speed - fb_motor1.w;
		FB_Regulator(&fb_controller);
		
		fb_motor1.u = fb_controller.u_out;
		FB_Motor(&fb_motor1);
		
		fb_motor2.u = speed * fb_motor2.ke;
		FB_Motor(&fb_motor2);
	}
}
