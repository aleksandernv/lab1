
#include <bur/plctypes.h>

#ifdef _DEFAULT_INCLUDES
	#include <AsDefault.h>
#endif

void _INIT ProgramInit(void)
{
	dt = 0.01;
	ke = 0.00265;
	Tm = 0.0246;
	u = 0;
	
	fb_motor1.dt = dt;
	fb_motor1.ke = ke;
	fb_motor1.Tm = Tm;
	fb_motor1.u = u;
	
	fb_motor2.dt = dt;
	fb_motor2.ke = ke;
	fb_motor2.Tm = Tm;
	fb_motor2.u = u;
	
	fb_controller.dt = dt;
	fb_controller.k_i = 0.053;
	fb_controller.k_p = 0.0013;
	fb_controller.max_abs_value = 24;
	
	speed = 0;
	counter = 0;
	enable = 1;
}
