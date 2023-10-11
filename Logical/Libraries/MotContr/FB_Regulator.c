
#include <bur/plctypes.h>
#ifdef __cplusplus
	extern "C"
	{
#endif
	#include "MotContr.h"
#ifdef __cplusplus
	};
#endif
/* TODO: Add your comment here */
void FB_Regulator(struct FB_Regulator* inst)
{	
	inst->integrator.dt = inst->dt;
	
	REAL a = inst->e_in * inst->k_p;
	REAL b = inst->e_in * inst->k_i;
	
	a = a > inst->max_abs_value ? inst->max_abs_value : a;
	a = a < -inst->max_abs_value ? -inst->max_abs_value : a;
	
	inst->integrator.in = b + inst->last_sum;
	FB_Integrator(&inst->integrator);
	
	inst->sum = a + inst->integrator.out;
	inst->u_out = inst->sum;
	inst->u_out = inst->u_out > inst->max_abs_value ? inst->max_abs_value : inst->u_out;
	inst->u_out = inst->u_out < -inst->max_abs_value ? -inst->max_abs_value : inst->u_out;
	
	inst->last_sum = inst->u_out - inst->sum;
}
