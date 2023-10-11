
{REDUND_ERROR} FUNCTION_BLOCK FB_Motor (*���*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		u : REAL; (*������� ����������, �*)
		dt : REAL; (*������ �������������, �*)
	END_VAR
	VAR_OUTPUT
		w : REAL; (*������� �������, ��./���.*)
		phi : REAL; (*��������� ����, ��.*)
	END_VAR
	VAR
		Tm : REAL; (*������������ ���������� �������, �*)
		integrator : FB_Integrator; (*����������*)
		ke : REAL; (*���������� ��� ���������, �/(��./���.)*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK FB_Integrator (*����������*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		in : REAL; (*����*)
		dt : REAL; (*������ �������������, �*)
	END_VAR
	VAR_OUTPUT
		out : REAL; (*�����*)
	END_VAR
	VAR
		prev_value : REAL; (*���������� ��������*)
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK FB_Regulator (*��-���������*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		e_in : REAL; (*���� (������)*)
		dt : REAL; (*������ �������������, �*)
	END_VAR
	VAR_OUTPUT
		u_out : REAL; (*�����*)
	END_VAR
	VAR
		k_p : REAL; (*����������� ����������������� �����*)
		k_i : REAL; (*����������� ������������� �����*)
		integrator : FB_Integrator; (*����������*)
		iyOld : REAL; (*���������� �������� ����� �����������������*)
		max_abs_value : REAL; (*�����������*)
		last_sum : REAL; (*������� ����� ����������� ���������� u � sum*)
		sum : REAL; (*�������� �������� �� ����� �����������*)
	END_VAR
END_FUNCTION_BLOCK
