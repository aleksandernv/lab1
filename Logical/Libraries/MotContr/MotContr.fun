
{REDUND_ERROR} FUNCTION_BLOCK FB_Motor (*ДПТ*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		u : REAL; (*Входное напряжение, В*)
		dt : REAL; (*Период дискретизации, с*)
	END_VAR
	VAR_OUTPUT
		w : REAL; (*Частота вращени, об./мин.*)
		phi : REAL; (*Положение вала, об.*)
	END_VAR
	VAR
		Tm : REAL; (*Механическая постоянная времени, с*)
		integrator : FB_Integrator; (*Интегратор*)
		ke : REAL; (*Постоянная ЭДС двигателя, В/(об./мин.)*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK FB_Integrator (*Интегратор*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		in : REAL; (*Вход*)
		dt : REAL; (*Период дискретизации, с*)
	END_VAR
	VAR_OUTPUT
		out : REAL; (*Выход*)
	END_VAR
	VAR
		prev_value : REAL; (*Предыдущее значение*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK FB_Regulator (*ПИ-регулятор*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		e_in : REAL; (*Вход (ошибка)*)
		dt : REAL; (*Период дискретизации, с*)
	END_VAR
	VAR_OUTPUT
		u_out : REAL; (*Выход*)
	END_VAR
	VAR
		k_p : REAL; (*Коэффициент пропорционального звена*)
		k_i : REAL; (*Коэффициент интегрального звена*)
		integrator : FB_Integrator; (*Интегратор*)
		iyOld : REAL; (*Предыдущее значение схемы противонакопления*)
		max_abs_value : REAL; (*Ограничение*)
		last_sum : REAL; (*Разница между предыдущими значениями u и sum*)
		sum : REAL; (*Выходное значение до звена ограничения*)
	END_VAR
END_FUNCTION_BLOCK
