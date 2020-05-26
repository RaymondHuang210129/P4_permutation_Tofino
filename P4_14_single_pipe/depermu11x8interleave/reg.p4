register box00 {
	width				: 32;
	instance_count		: 1;
}

register box01 {
	width				: 32;
	instance_count		: 1;
}

register box02 {
	width				: 32;
	instance_count		: 1;
}
/*
register box03 {
	width				: 16;
	instance_count		: 1;
}

register box04 {
	width				: 16;
	instance_count		: 1;
}
*/
blackbox stateful_alu salu_get_box00 {
	reg					: box00;
	update_lo_1_value	: register_lo;
	output_value		: alu_lo;
	output_dst			: key.code0;
}

blackbox stateful_alu salu_get_box01 {
	reg					: box01;
	update_lo_1_value	: register_lo;
	output_value		: alu_lo;
	output_dst			: key.code1;
}

blackbox stateful_alu salu_get_box02 {
	reg					: box02;
	update_lo_1_value	: register_lo;
	output_value		: alu_lo;
	output_dst			: key.code2;
}
/*
blackbox stateful_alu salu_get_box03 {
	reg					: box03;
	update_lo_1_value	: register_lo;
	output_value		: alu_lo;
	output_dst			: key.code3;
}

blackbox stateful_alu salu_get_box04 {
	reg					: box04;
	update_lo_1_value	: register_lo;
	output_value		: alu_lo;
	output_dst			: key.code4;
}
*/
