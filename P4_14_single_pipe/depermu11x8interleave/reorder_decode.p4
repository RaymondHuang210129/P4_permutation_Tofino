/* -*- P4_14 -*- */


#include "headers.p4"
#include "parser.p4"
#include "reg.p4"
#ifdef __TARGET_TOFINO__
#include <tofino/intrinsic_metadata.p4>
#include <tofino/constants.p4>
#include <tofino/stateful_alu_blackbox.p4>
#else
#error This program is intended to compile for Tofino P4 architecture only
#endif

action nop() {
}

action _drop() {
	drop();
}

action set_egr(egress_spec) {
	modify_field(ig_intr_md_for_tm.ucast_egress_port, egress_spec);
}

table forward {
	reads {
		ethernet.dstAddr : exact;
	}
	actions {
		set_egr; 
		nop;
	}
	default_action: set_egr(0);
}
/////////////////////////////////////////////////  0


action bit0_0_0_action() {
	modify_field(unit0.data0, buff0.data);
}

action bit0_0_1_action() {
	modify_field(unit0.data0, unit1.data0);
	modify_field(unit1.data0, unit2.data0);
	modify_field(unit2.data0, unit3.data0);
	modify_field(unit3.data0, unit4.data0);
	modify_field(unit4.data0, unit5.data0);
	modify_field(unit5.data0, unit6.data0);
	modify_field(unit6.data0, unit7.data0);
	modify_field(unit7.data0, unit8.data0);
	modify_field(unit8.data0, unit9.data0);
	modify_field(unit9.data0, unit10.data0);
	modify_field(unit10.data0, unit11.data0);
	modify_field(unit11.data0, buff0.data);
}

table bit0_0 {
	reads {
		key.code0 mask 0x00000001 :	exact;
	}
	actions {
		bit0_0_0_action;
		bit0_0_1_action;
	}
	default_action: bit0_0_0_action;
}

action bit1_0_0_action() {
	modify_field(unit0.data1, buff1.data);
}

action bit1_0_1_action() {
	modify_field(unit0.data1, unit1.data1);
	modify_field(unit1.data1, unit2.data1);
	modify_field(unit2.data1, unit3.data1);
	modify_field(unit3.data1, unit4.data1);
	modify_field(unit4.data1, unit5.data1);
	modify_field(unit5.data1, unit6.data1);
	modify_field(unit6.data1, unit7.data1);
	modify_field(unit7.data1, unit8.data1);
	modify_field(unit8.data1, unit9.data1);
	modify_field(unit9.data1, unit10.data1);
	modify_field(unit10.data1, unit11.data1);
	modify_field(unit11.data1, buff1.data);
}

table bit1_0 {
	reads {
		key.code0 mask 0x00000002 :	exact;
	}
	actions {
		bit1_0_0_action;
		bit1_0_1_action;
	}
	default_action: bit1_0_0_action;
}

action bit2_0_0_action() {
	modify_field(unit0.data2, buff2.data);
}

action bit2_0_1_action() {
	modify_field(unit0.data2, unit1.data2);
	modify_field(unit1.data2, unit2.data2);
	modify_field(unit2.data2, unit3.data2);
	modify_field(unit3.data2, unit4.data2);
	modify_field(unit4.data2, unit5.data2);
	modify_field(unit5.data2, unit6.data2);
	modify_field(unit6.data2, unit7.data2);
	modify_field(unit7.data2, unit8.data2);
	modify_field(unit8.data2, unit9.data2);
	modify_field(unit9.data2, unit10.data2);
	modify_field(unit10.data2, unit11.data2);
	modify_field(unit11.data2, buff2.data);
}

table bit2_0 {
	reads {
		key.code0 mask 0x00000004 :	exact;
	}
	actions {
		bit2_0_0_action;
		bit2_0_1_action;
	}
	default_action: bit2_0_0_action;
}

action bit3_0_0_action() {
	modify_field(unit0.data3, buff3.data);
}

action bit3_0_1_action() {
	modify_field(unit0.data3, unit1.data3);
	modify_field(unit1.data3, unit2.data3);
	modify_field(unit2.data3, unit3.data3);
	modify_field(unit3.data3, unit4.data3);
	modify_field(unit4.data3, unit5.data3);
	modify_field(unit5.data3, unit6.data3);
	modify_field(unit6.data3, unit7.data3);
	modify_field(unit7.data3, unit8.data3);
	modify_field(unit8.data3, unit9.data3);
	modify_field(unit9.data3, unit10.data3);
	modify_field(unit10.data3, unit11.data3);
	modify_field(unit11.data3, buff3.data);
}

table bit3_0 {
	reads {
		key.code0 mask 0x00000008 :	exact;
	}
	actions {
		bit3_0_0_action;
		bit3_0_1_action;
	}
	default_action: bit3_0_0_action;
}

action bit4_0_0_action() {
	modify_field(unit0.data4, buff4.data);
}

action bit4_0_1_action() {
	modify_field(unit0.data4, unit1.data4);
	modify_field(unit1.data4, unit2.data4);
	modify_field(unit2.data4, unit3.data4);
	modify_field(unit3.data4, unit4.data4);
	modify_field(unit4.data4, unit5.data4);
	modify_field(unit5.data4, unit6.data4);
	modify_field(unit6.data4, unit7.data4);
	modify_field(unit7.data4, unit8.data4);
	modify_field(unit8.data4, unit9.data4);
	modify_field(unit9.data4, unit10.data4);
	modify_field(unit10.data4, unit11.data4);
	modify_field(unit11.data4, buff4.data);
}

table bit4_0 {
	reads {
		key.code0 mask 0x00000010 :	exact;
	}
	actions {
		bit4_0_0_action;
		bit4_0_1_action;
	}
	default_action: bit4_0_0_action;
}

action bit5_0_0_action() {
	modify_field(unit0.data5, buff5.data);
}

action bit5_0_1_action() {
	modify_field(unit0.data5, unit1.data5);
	modify_field(unit1.data5, unit2.data5);
	modify_field(unit2.data5, unit3.data5);
	modify_field(unit3.data5, unit4.data5);
	modify_field(unit4.data5, unit5.data5);
	modify_field(unit5.data5, unit6.data5);
	modify_field(unit6.data5, unit7.data5);
	modify_field(unit7.data5, unit8.data5);
	modify_field(unit8.data5, unit9.data5);
	modify_field(unit9.data5, unit10.data5);
	modify_field(unit10.data5, unit11.data5);
	modify_field(unit11.data5, buff5.data);
}

table bit5_0 {
	reads {
		key.code0 mask 0x00000020 :	exact;
	}
	actions {
		bit5_0_0_action;
		bit5_0_1_action;
	}
	default_action: bit5_0_0_action;
}

action bit6_0_0_action() {
	modify_field(unit0.data6, buff6.data);
}

action bit6_0_1_action() {
	modify_field(unit0.data6, unit1.data6);
	modify_field(unit1.data6, unit2.data6);
	modify_field(unit2.data6, unit3.data6);
	modify_field(unit3.data6, unit4.data6);
	modify_field(unit4.data6, unit5.data6);
	modify_field(unit5.data6, unit6.data6);
	modify_field(unit6.data6, unit7.data6);
	modify_field(unit7.data6, unit8.data6);
	modify_field(unit8.data6, unit9.data6);
	modify_field(unit9.data6, unit10.data6);
	modify_field(unit10.data6, unit11.data6);
	modify_field(unit11.data6, buff6.data);
}

table bit6_0 {
	reads {
		key.code0 mask 0x00000040 :	exact;
	}
	actions {
		bit6_0_0_action;
		bit6_0_1_action;
	}
	default_action: bit6_0_0_action;
}

action bit7_0_0_action() {
	modify_field(buff7.data, unit0.data7);
	
}

action bit7_0_1_action() {
	modify_field(unit0.data7, unit1.data7);
	modify_field(unit1.data7, unit2.data7);
	modify_field(unit2.data7, unit3.data7);
	modify_field(unit3.data7, unit4.data7);
	modify_field(unit4.data7, unit5.data7);
	modify_field(unit5.data7, unit6.data7);
	modify_field(unit6.data7, unit7.data7);
	modify_field(unit7.data7, unit8.data7);
	modify_field(unit8.data7, unit9.data7);
	modify_field(unit9.data7, unit10.data7);
	modify_field(unit10.data7, unit11.data7);
	modify_field(unit11.data7, buff7.data);
}

table bit7_0 {
	reads {
		key.code0 mask 0x00000080 :	exact;
	}
	actions {
		bit7_0_0_action;
		bit7_0_1_action;
	}
	default_action: bit7_0_0_action;
}


//////////////////////////////////////////////  1

action bit0_1_0_action() {
	modify_field(unit1.data0, buff0.data);
	modify_field(buff0.data, unit0.data0);
}

action bit0_1_1_action() {
	modify_field(unit1.data0, unit2.data0);
	modify_field(unit2.data0, unit3.data0);
	modify_field(unit3.data0, unit4.data0);
	modify_field(unit4.data0, unit5.data0);
	modify_field(unit5.data0, unit6.data0);
	modify_field(unit6.data0, unit7.data0);
	modify_field(unit7.data0, unit8.data0);
	modify_field(unit8.data0, unit9.data0);
	modify_field(unit9.data0, unit10.data0);
	modify_field(unit10.data0, unit11.data0);
	modify_field(unit11.data0, buff0.data);
	modify_field(buff0.data, unit0.data0);
}

table bit0_1 {
	reads {
		key.code0 mask 0x00000100 :	exact;
	}
	actions {
		bit0_1_0_action;
		bit0_1_1_action;
	}
	default_action: bit0_1_0_action;
}

action bit1_1_0_action() {
	modify_field(unit1.data1, buff1.data);
	modify_field(buff1.data, unit0.data1);
}

action bit1_1_1_action() {
	modify_field(unit1.data1, unit2.data1);
	modify_field(unit2.data1, unit3.data1);
	modify_field(unit3.data1, unit4.data1);
	modify_field(unit4.data1, unit5.data1);
	modify_field(unit5.data1, unit6.data1);
	modify_field(unit6.data1, unit7.data1);
	modify_field(unit7.data1, unit8.data1);
	modify_field(unit8.data1, unit9.data1);
	modify_field(unit9.data1, unit10.data1);
	modify_field(unit10.data1, unit11.data1);
	modify_field(unit11.data1, buff1.data);
	modify_field(buff1.data, unit0.data1);
}

table bit1_1 {
	reads {
		key.code0 mask 0x00000200 :	exact;
	}
	actions {
		bit1_1_0_action;
		bit1_1_1_action;
	}
	default_action: bit1_1_0_action;
}

action bit2_1_0_action() {
	modify_field(unit1.data2, buff2.data);
	modify_field(buff2.data, unit0.data2);
}

action bit2_1_1_action() {
	modify_field(unit1.data2, unit2.data2);
	modify_field(unit2.data2, unit3.data2);
	modify_field(unit3.data2, unit4.data2);
	modify_field(unit4.data2, unit5.data2);
	modify_field(unit5.data2, unit6.data2);
	modify_field(unit6.data2, unit7.data2);
	modify_field(unit7.data2, unit8.data2);
	modify_field(unit8.data2, unit9.data2);
	modify_field(unit9.data2, unit10.data2);
	modify_field(unit10.data2, unit11.data2);
	modify_field(unit11.data2, buff2.data);
	modify_field(buff2.data, unit0.data2);

}

table bit2_1 {
	reads {
		key.code0 mask 0x00000400 :	exact;
	}
	actions {
		bit2_1_0_action;
		bit2_1_1_action;
	}
	default_action: bit2_1_0_action;
}

action bit3_1_0_action() {
	modify_field(unit1.data3, buff3.data);
	modify_field(buff3.data, unit0.data3);
}

action bit3_1_1_action() {
	modify_field(unit1.data3, unit2.data3);
	modify_field(unit2.data3, unit3.data3);
	modify_field(unit3.data3, unit4.data3);
	modify_field(unit4.data3, unit5.data3);
	modify_field(unit5.data3, unit6.data3);
	modify_field(unit6.data3, unit7.data3);
	modify_field(unit7.data3, unit8.data3);
	modify_field(unit8.data3, unit9.data3);
	modify_field(unit9.data3, unit10.data3);
	modify_field(unit10.data3, unit11.data3);
	modify_field(unit11.data3, buff3.data);
	modify_field(buff3.data, unit0.data3);
}

table bit3_1 {
	reads {
		key.code0 mask 0x00000800 :	exact;
	}
	actions {
		bit3_1_0_action;
		bit3_1_1_action;
	}
	default_action: bit3_1_0_action;
}

action bit4_1_0_action() {
	modify_field(unit1.data4, buff4.data);
	modify_field(buff4.data, unit0.data4);
}

action bit4_1_1_action() {
	modify_field(unit1.data4, unit2.data4);
	modify_field(unit2.data4, unit3.data4);
	modify_field(unit3.data4, unit4.data4);
	modify_field(unit4.data4, unit5.data4);
	modify_field(unit5.data4, unit6.data4);
	modify_field(unit6.data4, unit7.data4);
	modify_field(unit7.data4, unit8.data4);
	modify_field(unit8.data4, unit9.data4);
	modify_field(unit9.data4, unit10.data4);
	modify_field(unit10.data4, unit11.data4);
	modify_field(unit11.data4, buff4.data);
	modify_field(buff4.data, unit0.data4);
}

table bit4_1 {
	reads {
		key.code0 mask 0x00001000 :	exact;
	}
	actions {
		bit4_1_0_action;
		bit4_1_1_action;
	}
	default_action: bit4_1_0_action;
}

action bit5_1_0_action() {
	modify_field(unit1.data5, buff5.data);
	modify_field(buff5.data, unit0.data5);
}

action bit5_1_1_action() {
	modify_field(unit1.data5, unit2.data5);
	modify_field(unit2.data5, unit3.data5);
	modify_field(unit3.data5, unit4.data5);
	modify_field(unit4.data5, unit5.data5);
	modify_field(unit5.data5, unit6.data5);
	modify_field(unit6.data5, unit7.data5);
	modify_field(unit7.data5, unit8.data5);
	modify_field(unit8.data5, unit9.data5);
	modify_field(unit9.data5, unit10.data5);
	modify_field(unit10.data5, unit11.data5);
	modify_field(unit11.data5, buff5.data);
	modify_field(buff5.data, unit0.data5);
}

table bit5_1 {
	reads {
		key.code0 mask 0x00002000 :	exact;
	}
	actions {
		bit5_1_0_action;
		bit5_1_1_action;
	}
	default_action: bit5_1_0_action;
}

action bit6_1_0_action() {
	modify_field(unit1.data6, buff6.data);
	modify_field(buff6.data, unit0.data6);
}

action bit6_1_1_action() {
	modify_field(unit1.data6, unit2.data6);
	modify_field(unit2.data6, unit3.data6);
	modify_field(unit3.data6, unit4.data6);
	modify_field(unit4.data6, unit5.data6);
	modify_field(unit5.data6, unit6.data6);
	modify_field(unit6.data6, unit7.data6);
	modify_field(unit7.data6, unit8.data6);
	modify_field(unit8.data6, unit9.data6);
	modify_field(unit9.data6, unit10.data6);
	modify_field(unit10.data6, unit11.data6);
	modify_field(unit11.data6, buff6.data);
	modify_field(buff6.data, unit0.data6);
}

table bit6_1 {
	reads {
		key.code0 mask 0x00004000 :	exact;
	}
	actions {
		bit6_1_0_action;
		bit6_1_1_action;
	}
	default_action: bit6_1_0_action;
}

action bit7_1_0_action() {
	modify_field(unit1.data7, buff7.data);
	modify_field(buff7.data, unit0.data7);
	
}

action bit7_1_1_action() {
	modify_field(unit1.data7, unit2.data7);
	modify_field(unit2.data7, unit3.data7);
	modify_field(unit3.data7, unit4.data7);
	modify_field(unit4.data7, unit5.data7);
	modify_field(unit5.data7, unit6.data7);
	modify_field(unit6.data7, unit7.data7);
	modify_field(unit7.data7, unit8.data7);
	modify_field(unit8.data7, unit9.data7);
	modify_field(unit9.data7, unit10.data7);
	modify_field(unit10.data7, unit11.data7);
	modify_field(unit11.data7, buff7.data);
	modify_field(buff7.data, unit0.data7);
}

table bit7_1 {
	reads {
		key.code0 mask 0x00008000 :	exact;
	}
	actions {
		bit7_1_0_action;
		bit7_1_1_action;
	}
	default_action: bit7_1_0_action;
}

//////////////////////////////////////////////  2

action bit0_2_0_action() {
	modify_field(unit2.data0, buff0.data);
	modify_field(buff0.data, unit1.data0);
}

action bit0_2_1_action() {
	modify_field(unit2.data0, unit3.data0);
	modify_field(unit3.data0, unit4.data0);
	modify_field(unit4.data0, unit5.data0);
	modify_field(unit5.data0, unit6.data0);
	modify_field(unit6.data0, unit7.data0);
	modify_field(unit7.data0, unit8.data0);
	modify_field(unit8.data0, unit9.data0);
	modify_field(unit9.data0, unit10.data0);
	modify_field(unit10.data0, unit11.data0);
	modify_field(unit11.data0, buff0.data);
	modify_field(buff0.data, unit1.data0);
}

table bit0_2 {
	reads {
		key.code0 mask 0x00010000 :	exact;
	}
	actions {
		bit0_2_0_action;
		bit0_2_1_action;
	}
	default_action: bit0_2_0_action;
}

action bit1_2_0_action() {
	modify_field(unit2.data1, buff1.data);
	modify_field(buff1.data, unit1.data1);
}

action bit1_2_1_action() {
	modify_field(unit2.data1, unit3.data1);
	modify_field(unit3.data1, unit4.data1);
	modify_field(unit4.data1, unit5.data1);
	modify_field(unit5.data1, unit6.data1);
	modify_field(unit6.data1, unit7.data1);
	modify_field(unit7.data1, unit8.data1);
	modify_field(unit8.data1, unit9.data1);
	modify_field(unit9.data1, unit10.data1);
	modify_field(unit10.data1, unit11.data1);
	modify_field(unit11.data1, buff1.data);
	modify_field(buff1.data, unit1.data1);
}

table bit1_2 {
	reads {
		key.code0 mask 0x00020000 :	exact;
	}
	actions {
		bit1_2_0_action;
		bit1_2_1_action;
	}
	default_action: bit1_2_0_action;
}

action bit2_2_0_action() {
	modify_field(unit2.data2, buff2.data);
	modify_field(buff2.data, unit1.data2);
}

action bit2_2_1_action() {
	modify_field(unit2.data2, unit3.data2);
	modify_field(unit3.data2, unit4.data2);
	modify_field(unit4.data2, unit5.data2);
	modify_field(unit5.data2, unit6.data2);
	modify_field(unit6.data2, unit7.data2);
	modify_field(unit7.data2, unit8.data2);
	modify_field(unit8.data2, unit9.data2);
	modify_field(unit9.data2, unit10.data2);
	modify_field(unit10.data2, unit11.data2);
	modify_field(unit11.data2, buff2.data);
	modify_field(buff2.data, unit1.data2);
}

table bit2_2 {
	reads {
		key.code0 mask 0x00040000 :	exact;
	}
	actions {
		bit2_2_0_action;
		bit2_2_1_action;
	}
	default_action: bit2_2_0_action;
}

action bit3_2_0_action() {
	modify_field(unit2.data3, buff3.data);
	modify_field(buff3.data, unit1.data3);
}

action bit3_2_1_action() {
	modify_field(unit2.data3, unit3.data3);
	modify_field(unit3.data3, unit4.data3);
	modify_field(unit4.data3, unit5.data3);
	modify_field(unit5.data3, unit6.data3);
	modify_field(unit6.data3, unit7.data3);
	modify_field(unit7.data3, unit8.data3);
	modify_field(unit8.data3, unit9.data3);
	modify_field(unit9.data3, unit10.data3);
	modify_field(unit10.data3, unit11.data3);
	modify_field(unit11.data3, buff3.data);
	modify_field(buff3.data, unit1.data3);
}

table bit3_2 {
	reads {
		key.code0 mask 0x00080000 :	exact;
	}
	actions {
		bit3_2_0_action;
		bit3_2_1_action;
	}
	default_action: bit3_2_0_action;
}

action bit4_2_0_action() {
	modify_field(unit2.data4, buff4.data);
	modify_field(buff4.data, unit1.data4);
}

action bit4_2_1_action() {
	modify_field(unit2.data4, unit3.data4);
	modify_field(unit3.data4, unit4.data4);
	modify_field(unit4.data4, unit5.data4);
	modify_field(unit5.data4, unit6.data4);
	modify_field(unit6.data4, unit7.data4);
	modify_field(unit7.data4, unit8.data4);
	modify_field(unit8.data4, unit9.data4);
	modify_field(unit9.data4, unit10.data4);
	modify_field(unit10.data4, unit11.data4);
	modify_field(unit11.data4, buff4.data);
	modify_field(buff4.data, unit1.data4);
}

table bit4_2 {
	reads {
		key.code0 mask 0x00100000 :	exact;
	}
	actions {
		bit4_2_0_action;
		bit4_2_1_action;
	}
	default_action: bit4_2_0_action;
}

action bit5_2_0_action() {
	modify_field(unit2.data5, buff5.data);
	modify_field(buff5.data, unit1.data5);
}

action bit5_2_1_action() {
	modify_field(unit2.data5, unit3.data5);
	modify_field(unit3.data5, unit4.data5);
	modify_field(unit4.data5, unit5.data5);
	modify_field(unit5.data5, unit6.data5);
	modify_field(unit6.data5, unit7.data5);
	modify_field(unit7.data5, unit8.data5);
	modify_field(unit8.data5, unit9.data5);
	modify_field(unit9.data5, unit10.data5);
	modify_field(unit10.data5, unit11.data5);
	modify_field(unit11.data5, buff5.data);
	modify_field(buff5.data, unit1.data5);
}

table bit5_2 {
	reads {
		key.code0 mask 0x00200000 :	exact;
	}
	actions {
		bit5_2_0_action;
		bit5_2_1_action;
	}
	default_action: bit5_2_0_action;
}

action bit6_2_0_action() {
	modify_field(unit2.data6, buff6.data);
	modify_field(buff6.data, unit1.data6);
}

action bit6_2_1_action() {
	modify_field(unit2.data6, unit3.data6);
	modify_field(unit3.data6, unit4.data6);
	modify_field(unit4.data6, unit5.data6);
	modify_field(unit5.data6, unit6.data6);
	modify_field(unit6.data6, unit7.data6);
	modify_field(unit7.data6, unit8.data6);
	modify_field(unit8.data6, unit9.data6);
	modify_field(unit9.data6, unit10.data6);
	modify_field(unit10.data6, unit11.data6);
	modify_field(unit11.data6, buff6.data);
	modify_field(buff6.data, unit1.data6);
}

table bit6_2 {
	reads {
		key.code0 mask 0x00400000 :	exact;
	}
	actions {
		bit6_2_0_action;
		bit6_2_1_action;
	}
	default_action: bit6_2_0_action;
}

action bit7_2_0_action() {
	modify_field(unit2.data7, buff7.data);
	modify_field(buff7.data, unit1.data7);
	
}

action bit7_2_1_action() {
	modify_field(unit2.data7, unit3.data7);
	modify_field(unit3.data7, unit4.data7);
	modify_field(unit4.data7, unit5.data7);
	modify_field(unit5.data7, unit6.data7);
	modify_field(unit6.data7, unit7.data7);
	modify_field(unit7.data7, unit8.data7);
	modify_field(unit8.data7, unit9.data7);
	modify_field(unit9.data7, unit10.data7);
	modify_field(unit10.data7, unit11.data7);
	modify_field(unit11.data7, buff7.data);
	modify_field(buff7.data, unit1.data7);
}

table bit7_2 {
	reads {
		key.code0 mask 0x00800000 :	exact;
	}
	actions {
		bit7_2_0_action;
		bit7_2_1_action;
	}
	default_action: bit7_2_0_action;
}

//////////////////////////////////////////////  3

action bit0_3_0_action() {
	modify_field(unit3.data0, buff0.data);
	modify_field(buff0.data, unit2.data0);
}

action bit0_3_1_action() {
	modify_field(unit3.data0, unit4.data0);
	modify_field(unit4.data0, unit5.data0);
	modify_field(unit5.data0, unit6.data0);
	modify_field(unit6.data0, unit7.data0);
	modify_field(unit7.data0, unit8.data0);
	modify_field(unit8.data0, unit9.data0);
	modify_field(unit9.data0, unit10.data0);
	modify_field(unit10.data0, unit11.data0);
	modify_field(unit11.data0, buff0.data);
	modify_field(buff0.data, unit2.data0);
}

table bit0_3 {
	reads {
		key.code0 mask 0x01000000 :	exact;
	}
	actions {
		bit0_3_0_action;
		bit0_3_1_action;
	}
	default_action: bit0_3_0_action;
}

action bit1_3_0_action() {
	modify_field(unit3.data1, buff1.data);
	modify_field(buff1.data, unit2.data1);
}

action bit1_3_1_action() {
	modify_field(unit3.data1, unit4.data1);
	modify_field(unit4.data1, unit5.data1);
	modify_field(unit5.data1, unit6.data1);
	modify_field(unit6.data1, unit7.data1);
	modify_field(unit7.data1, unit8.data1);
	modify_field(unit8.data1, unit9.data1);
	modify_field(unit9.data1, unit10.data1);
	modify_field(unit10.data1, unit11.data1);
	modify_field(unit11.data1, buff1.data);
	modify_field(buff1.data, unit2.data1);
}

table bit1_3 {
	reads {
		key.code0 mask 0x02000000 :	exact;
	}
	actions {
		bit1_3_0_action;
		bit1_3_1_action;
	}
	default_action: bit1_3_0_action;
}

action bit2_3_0_action() {
	modify_field(unit3.data2, buff2.data);
	modify_field(buff2.data, unit2.data2);
}

action bit2_3_1_action() {
	modify_field(unit3.data2, unit4.data2);
	modify_field(unit4.data2, unit5.data2);
	modify_field(unit5.data2, unit6.data2);
	modify_field(unit6.data2, unit7.data2);
	modify_field(unit7.data2, unit8.data2);
	modify_field(unit8.data2, unit9.data2);
	modify_field(unit9.data2, unit10.data2);
	modify_field(unit10.data2, unit11.data2);
	modify_field(unit11.data2, buff2.data);
	modify_field(buff2.data, unit2.data2);
}

table bit2_3 {
	reads {
		key.code0 mask 0x04000000 :	exact;
	}
	actions {
		bit2_3_0_action;
		bit2_3_1_action;
	}
	default_action: bit2_3_0_action;
}

action bit3_3_0_action() {
	modify_field(unit3.data3, buff3.data);
	modify_field(buff3.data, unit2.data3);
}

action bit3_3_1_action() {
	modify_field(unit3.data3, unit4.data3);
	modify_field(unit4.data3, unit5.data3);
	modify_field(unit5.data3, unit6.data3);
	modify_field(unit6.data3, unit7.data3);
	modify_field(unit7.data3, unit8.data3);
	modify_field(unit8.data3, unit9.data3);
	modify_field(unit9.data3, unit10.data3);
	modify_field(unit10.data3, unit11.data3);
	modify_field(unit11.data3, buff3.data);
	modify_field(buff3.data, unit2.data3);
}

table bit3_3 {
	reads {
		key.code0 mask 0x08000000 :	exact;
	}
	actions {
		bit3_3_0_action;
		bit3_3_1_action;
	}
	default_action: bit3_3_0_action;
}

action bit4_3_0_action() {
	modify_field(unit3.data4, buff4.data);
	modify_field(buff4.data, unit2.data4);
}

action bit4_3_1_action() {
	modify_field(unit3.data4, unit4.data4);
	modify_field(unit4.data4, unit5.data4);
	modify_field(unit5.data4, unit6.data4);
	modify_field(unit6.data4, unit7.data4);
	modify_field(unit7.data4, unit8.data4);
	modify_field(unit8.data4, unit9.data4);
	modify_field(unit9.data4, unit10.data4);
	modify_field(unit10.data4, unit11.data4);
	modify_field(unit11.data4, buff4.data);
	modify_field(buff4.data, unit2.data4);
}

table bit4_3 {
	reads {
		key.code0 mask 0x10000000 :	exact;
	}
	actions {
		bit4_3_0_action;
		bit4_3_1_action;
	}
	default_action: bit4_3_0_action;
}

action bit5_3_0_action() {
	modify_field(unit3.data5, buff5.data);
	modify_field(buff5.data, unit2.data5);
}

action bit5_3_1_action() {
	modify_field(unit3.data5, unit4.data5);
	modify_field(unit4.data5, unit5.data5);
	modify_field(unit5.data5, unit6.data5);
	modify_field(unit6.data5, unit7.data5);
	modify_field(unit7.data5, unit8.data5);
	modify_field(unit8.data5, unit9.data5);
	modify_field(unit9.data5, unit10.data5);
	modify_field(unit10.data5, unit11.data5);
	modify_field(unit11.data5, buff5.data);
	modify_field(buff5.data, unit2.data5);
}

table bit5_3 {
	reads {
		key.code0 mask 0x20000000 :	exact;
	}
	actions {
		bit5_3_0_action;
		bit5_3_1_action;
	}
	default_action: bit5_3_0_action;
}

action bit6_3_0_action() {
	modify_field(unit3.data6, buff6.data);
	modify_field(buff6.data, unit2.data6);
}

action bit6_3_1_action() {
	modify_field(unit3.data6, unit4.data6);
	modify_field(unit4.data6, unit5.data6);
	modify_field(unit5.data6, unit6.data6);
	modify_field(unit6.data6, unit7.data6);
	modify_field(unit7.data6, unit8.data6);
	modify_field(unit8.data6, unit9.data6);
	modify_field(unit9.data6, unit10.data6);
	modify_field(unit10.data6, unit11.data6);
	modify_field(unit11.data6, buff6.data);
	modify_field(buff6.data, unit2.data6);
}

table bit6_3 {
	reads {
		key.code0 mask 0x40000000 :	exact;
	}
	actions {
		bit6_3_0_action;
		bit6_3_1_action;
	}
	default_action: bit6_3_0_action;
}

action bit7_3_0_action() {
	modify_field(unit3.data7, buff7.data);
	modify_field(buff7.data, unit2.data7);
	
}

action bit7_3_1_action() {
	modify_field(unit3.data7, unit4.data7);
	modify_field(unit4.data7, unit5.data7);
	modify_field(unit5.data7, unit6.data7);
	modify_field(unit6.data7, unit7.data7);
	modify_field(unit7.data7, unit8.data7);
	modify_field(unit8.data7, unit9.data7);
	modify_field(unit9.data7, unit10.data7);
	modify_field(unit10.data7, unit11.data7);
	modify_field(unit11.data7, buff7.data);
	modify_field(buff7.data, unit2.data7);
}

table bit7_3 {
	reads {
		key.code0 mask 0x80000000 :	exact;
	}
	actions {
		bit7_3_0_action;
		bit7_3_1_action;
	}
	default_action: bit7_3_0_action;
}

////////////////////////////////////////////// 4

action bit0_4_0_action() {
	modify_field(unit4.data0, buff0.data);
	modify_field(buff0.data, unit3.data0);
}

action bit0_4_1_action() {
	modify_field(unit4.data0, unit5.data0);
	modify_field(unit5.data0, unit6.data0);
	modify_field(unit6.data0, unit7.data0);
	modify_field(unit7.data0, unit8.data0);
	modify_field(unit8.data0, unit9.data0);
	modify_field(unit9.data0, unit10.data0);
	modify_field(unit10.data0, unit11.data0);
	modify_field(unit11.data0, buff0.data);
	modify_field(buff0.data, unit3.data0);
}

table bit0_4 {
	reads {
		key.code1 mask 0x00000001 :	exact;
	}
	actions {
		bit0_4_0_action;
		bit0_4_1_action;
	}
	default_action: bit0_4_0_action;
}

action bit1_4_0_action() {
	modify_field(unit4.data1, buff1.data);
	modify_field(buff1.data, unit3.data1);
}

action bit1_4_1_action() {
	modify_field(unit4.data1, unit5.data1);
	modify_field(unit5.data1, unit6.data1);
	modify_field(unit6.data1, unit7.data1);
	modify_field(unit7.data1, unit8.data1);
	modify_field(unit8.data1, unit9.data1);
	modify_field(unit9.data1, unit10.data1);
	modify_field(unit10.data1, unit11.data1);
	modify_field(unit11.data1, buff1.data);
	modify_field(buff1.data, unit3.data1);
}

table bit1_4 {
	reads {
		key.code1 mask 0x00000002 :	exact;
	}
	actions {
		bit1_4_0_action;
		bit1_4_1_action;
	}
	default_action: bit1_4_0_action;
}

action bit2_4_0_action() {
	modify_field(unit4.data2, buff2.data);
	modify_field(buff2.data, unit3.data2);
}

action bit2_4_1_action() {
	modify_field(unit4.data2, unit5.data2);
	modify_field(unit5.data2, unit6.data2);
	modify_field(unit6.data2, unit7.data2);
	modify_field(unit7.data2, unit8.data2);
	modify_field(unit8.data2, unit9.data2);
	modify_field(unit9.data2, unit10.data2);
	modify_field(unit10.data2, unit11.data2);
	modify_field(unit11.data2, buff2.data);
	modify_field(buff2.data, unit3.data2);
}

table bit2_4 {
	reads {
		key.code1 mask 0x00000004 :	exact;
	}
	actions {
		bit2_4_0_action;
		bit2_4_1_action;
	}
	default_action: bit2_4_0_action;
}

action bit3_4_0_action() {
	modify_field(unit4.data3, buff3.data);
	modify_field(buff3.data, unit3.data3);
}

action bit3_4_1_action() {
	modify_field(unit4.data3, unit5.data3);
	modify_field(unit5.data3, unit6.data3);
	modify_field(unit6.data3, unit7.data3);
	modify_field(unit7.data3, unit8.data3);
	modify_field(unit8.data3, unit9.data3);
	modify_field(unit9.data3, unit10.data3);
	modify_field(unit10.data3, unit11.data3);
	modify_field(unit11.data3, buff3.data);
	modify_field(buff3.data, unit3.data3);
}

table bit3_4 {
	reads {
		key.code1 mask 0x00000008 :	exact;
	}
	actions {
		bit3_4_0_action;
		bit3_4_1_action;
	}
	default_action: bit3_4_0_action;
}

action bit4_4_0_action() {
	modify_field(unit4.data4, buff4.data);
	modify_field(buff4.data, unit3.data4);
}

action bit4_4_1_action() {
	modify_field(unit4.data4, unit5.data4);
	modify_field(unit5.data4, unit6.data4);
	modify_field(unit6.data4, unit7.data4);
	modify_field(unit7.data4, unit8.data4);
	modify_field(unit8.data4, unit9.data4);
	modify_field(unit9.data4, unit10.data4);
	modify_field(unit10.data4, unit11.data4);
	modify_field(unit11.data4, buff4.data);
	modify_field(buff4.data, unit3.data4);
}

table bit4_4 {
	reads {
		key.code1 mask 0x00000010 :	exact;
	}
	actions {
		bit4_4_0_action;
		bit4_4_1_action;
	}
	default_action: bit4_4_0_action;
}

action bit5_4_0_action() {
	modify_field(unit4.data5, buff5.data);
	modify_field(buff5.data, unit3.data5);
}

action bit5_4_1_action() {
	modify_field(unit4.data5, unit5.data5);
	modify_field(unit5.data5, unit6.data5);
	modify_field(unit6.data5, unit7.data5);
	modify_field(unit7.data5, unit8.data5);
	modify_field(unit8.data5, unit9.data5);
	modify_field(unit9.data5, unit10.data5);
	modify_field(unit10.data5, unit11.data5);
	modify_field(unit11.data5, buff5.data);
	modify_field(buff5.data, unit3.data5);
}

table bit5_4 {
	reads {
		key.code1 mask 0x00000020 :	exact;
	}
	actions {
		bit5_4_0_action;
		bit5_4_1_action;
	}
	default_action: bit5_4_0_action;
}

action bit6_4_0_action() {
	modify_field(unit4.data6, buff6.data);
	modify_field(buff6.data, unit3.data6);
}

action bit6_4_1_action() {
	modify_field(unit4.data6, unit5.data6);
	modify_field(unit5.data6, unit6.data6);
	modify_field(unit6.data6, unit7.data6);
	modify_field(unit7.data6, unit8.data6);
	modify_field(unit8.data6, unit9.data6);
	modify_field(unit9.data6, unit10.data6);
	modify_field(unit10.data6, unit11.data6);
	modify_field(unit11.data6, buff6.data);
	modify_field(buff6.data, unit3.data6);
}

table bit6_4 {
	reads {
		key.code1 mask 0x00000040 :	exact;
	}
	actions {
		bit6_4_0_action;
		bit6_4_1_action;
	}
	default_action: bit6_4_0_action;
}

action bit7_4_0_action() {
	modify_field(unit4.data7, buff7.data);
	modify_field(buff7.data, unit3.data7);
	
}

action bit7_4_1_action() {
	modify_field(unit4.data7, unit5.data7);
	modify_field(unit5.data7, unit6.data7);
	modify_field(unit6.data7, unit7.data7);
	modify_field(unit7.data7, unit8.data7);
	modify_field(unit8.data7, unit9.data7);
	modify_field(unit9.data7, unit10.data7);
	modify_field(unit10.data7, unit11.data7);
	modify_field(unit11.data7, buff7.data);
	modify_field(buff7.data, unit3.data7);
}

table bit7_4 {
	reads {
		key.code1 mask 0x00000080 :	exact;
	}
	actions {
		bit7_4_0_action;
		bit7_4_1_action;
	}
	default_action: bit7_4_0_action;
}

//////////////////////////////////////////////  5

action bit0_5_0_action() {
	modify_field(unit5.data0, buff0.data);
	modify_field(buff0.data, unit4.data0);
}

action bit0_5_1_action() {
	modify_field(unit5.data0, unit6.data0);
	modify_field(unit6.data0, unit7.data0);
	modify_field(unit7.data0, unit8.data0);
	modify_field(unit8.data0, unit9.data0);
	modify_field(unit9.data0, unit10.data0);
	modify_field(unit10.data0, unit11.data0);
	modify_field(unit11.data0, buff0.data);
	modify_field(buff0.data, unit4.data0);
}

table bit0_5 {
	reads {
		key.code1 mask 0x00000100 :	exact;
	}
	actions {
		bit0_5_0_action;
		bit0_5_1_action;
	}
	default_action: bit0_5_0_action;
}

action bit1_5_0_action() {
	modify_field(unit5.data1, buff1.data);
	modify_field(buff1.data, unit4.data1);
}

action bit1_5_1_action() {
	modify_field(unit5.data1, unit6.data1);
	modify_field(unit6.data1, unit7.data1);
	modify_field(unit7.data1, unit8.data1);
	modify_field(unit8.data1, unit9.data1);
	modify_field(unit9.data1, unit10.data1);
	modify_field(unit10.data1, unit11.data1);
	modify_field(unit11.data1, buff1.data);
	modify_field(buff1.data, unit4.data1);
}

table bit1_5 {
	reads {
		key.code1 mask 0x00000200 :	exact;
	}
	actions {
		bit1_5_0_action;
		bit1_5_1_action;
	}
	default_action: bit1_5_0_action;
}

action bit2_5_0_action() {
	modify_field(unit5.data2, buff2.data);
	modify_field(buff2.data, unit4.data2);
}

action bit2_5_1_action() {
	modify_field(unit5.data2, unit6.data2);
	modify_field(unit6.data2, unit7.data2);
	modify_field(unit7.data2, unit8.data2);
	modify_field(unit8.data2, unit9.data2);
	modify_field(unit9.data2, unit10.data2);
	modify_field(unit10.data2, unit11.data2);
	modify_field(unit11.data2, buff2.data);
	modify_field(buff2.data, unit4.data2);
}

table bit2_5 {
	reads {
		key.code1 mask 0x00000400 :	exact;
	}
	actions {
		bit2_5_0_action;
		bit2_5_1_action;
	}
	default_action: bit2_5_0_action;
}

action bit3_5_0_action() {
	modify_field(unit5.data3, buff3.data);
	modify_field(buff3.data, unit4.data3);
}

action bit3_5_1_action() {
	modify_field(unit5.data3, unit6.data3);
	modify_field(unit6.data3, unit7.data3);
	modify_field(unit7.data3, unit8.data3);
	modify_field(unit8.data3, unit9.data3);
	modify_field(unit9.data3, unit10.data3);
	modify_field(unit10.data3, unit11.data3);
	modify_field(unit11.data3, buff3.data);
	modify_field(buff3.data, unit4.data3);
}

table bit3_5 {
	reads {
		key.code1 mask 0x00000800 :	exact;
	}
	actions {
		bit3_5_0_action;
		bit3_5_1_action;
	}
	default_action: bit3_5_0_action;
}

action bit4_5_0_action() {
	modify_field(unit5.data4, buff4.data);
	modify_field(buff4.data, unit4.data4);
}

action bit4_5_1_action() {
	modify_field(unit5.data4, unit6.data4);
	modify_field(unit6.data4, unit7.data4);
	modify_field(unit7.data4, unit8.data4);
	modify_field(unit8.data4, unit9.data4);
	modify_field(unit9.data4, unit10.data4);
	modify_field(unit10.data4, unit11.data4);
	modify_field(unit11.data4, buff4.data);
	modify_field(buff4.data, unit4.data4);
}

table bit4_5 {
	reads {
		key.code1 mask 0x00001000 :	exact;
	}
	actions {
		bit4_5_0_action;
		bit4_5_1_action;
	}
	default_action: bit4_5_0_action;
}

action bit5_5_0_action() {
	modify_field(unit5.data5, buff5.data);
	modify_field(buff5.data, unit4.data5);
}

action bit5_5_1_action() {
	modify_field(unit5.data5, unit6.data5);
	modify_field(unit6.data5, unit7.data5);
	modify_field(unit7.data5, unit8.data5);
	modify_field(unit8.data5, unit9.data5);
	modify_field(unit9.data5, unit10.data5);
	modify_field(unit10.data5, unit11.data5);
	modify_field(unit11.data5, buff5.data);
	modify_field(buff5.data, unit4.data5);
}

table bit5_5 {
	reads {
		key.code1 mask 0x00002000 :	exact;
	}
	actions {
		bit5_5_0_action;
		bit5_5_1_action;
	}
	default_action: bit5_5_0_action;
}

action bit6_5_0_action() {
	modify_field(unit5.data6, buff6.data);
	modify_field(buff6.data, unit4.data6);
}

action bit6_5_1_action() {
	modify_field(unit5.data6, unit6.data6);
	modify_field(unit6.data6, unit7.data6);
	modify_field(unit7.data6, unit8.data6);
	modify_field(unit8.data6, unit9.data6);
	modify_field(unit9.data6, unit10.data6);
	modify_field(unit10.data6, unit11.data6);
	modify_field(unit11.data6, buff6.data);
	modify_field(buff6.data, unit4.data6);
}

table bit6_5 {
	reads {
		key.code1 mask 0x00004000 :	exact;
	}
	actions {
		bit6_5_0_action;
		bit6_5_1_action;
	}
	default_action: bit6_5_0_action;
}

action bit7_5_0_action() {
	modify_field(unit5.data7, buff7.data);
	modify_field(buff7.data, unit4.data7);
	
}

action bit7_5_1_action() {
	modify_field(unit5.data7, unit6.data7);
	modify_field(unit6.data7, unit7.data7);
	modify_field(unit7.data7, unit8.data7);
	modify_field(unit8.data7, unit9.data7);
	modify_field(unit9.data7, unit10.data7);
	modify_field(unit10.data7, unit11.data7);
	modify_field(unit11.data7, buff7.data);
	modify_field(buff7.data, unit4.data7);
}

table bit7_5 {
	reads {
		key.code1 mask 0x00008000 :	exact;
	}
	actions {
		bit7_5_0_action;
		bit7_5_1_action;
	}
	default_action: bit7_5_0_action;
}

//////////////////////////////////////////////  6

action bit0_6_0_action() {
	modify_field(unit6.data0, buff0.data);
	modify_field(buff0.data, unit5.data0);
}

action bit0_6_1_action() {
	modify_field(unit6.data0, unit7.data0);
	modify_field(unit7.data0, unit8.data0);
	modify_field(unit8.data0, unit9.data0);
	modify_field(unit9.data0, unit10.data0);
	modify_field(unit10.data0, unit11.data0);
	modify_field(unit11.data0, buff0.data);
	modify_field(buff0.data, unit5.data0);
}

table bit0_6 {
	reads {
		key.code1 mask 0x00010000 :	exact;
	}
	actions {
		bit0_6_0_action;
		bit0_6_1_action;
	}
	default_action: bit0_6_0_action;
}

action bit1_6_0_action() {
	modify_field(unit6.data1, buff1.data);
	modify_field(buff1.data, unit5.data1);
}

action bit1_6_1_action() {
	modify_field(unit6.data1, unit7.data1);
	modify_field(unit7.data1, unit8.data1);
	modify_field(unit8.data1, unit9.data1);
	modify_field(unit9.data1, unit10.data1);
	modify_field(unit10.data1, unit11.data1);
	modify_field(unit11.data1, buff1.data);
	modify_field(buff1.data, unit5.data1);
}

table bit1_6 {
	reads {
		key.code1 mask 0x00020000 :	exact;
	}
	actions {
		bit1_6_0_action;
		bit1_6_1_action;
	}
	default_action: bit1_6_0_action;
}

action bit2_6_0_action() {
	modify_field(unit6.data2, buff2.data);
	modify_field(buff2.data, unit5.data2);
}

action bit2_6_1_action() {
	modify_field(unit6.data2, unit7.data2);
	modify_field(unit7.data2, unit8.data2);
	modify_field(unit8.data2, unit9.data2);
	modify_field(unit9.data2, unit10.data2);
	modify_field(unit10.data2, unit11.data2);
	modify_field(unit11.data2, buff2.data);
	modify_field(buff2.data, unit5.data2);
}

table bit2_6 {
	reads {
		key.code1 mask 0x00040000 :	exact;
	}
	actions {
		bit2_6_0_action;
		bit2_6_1_action;
	}
	default_action: bit2_6_0_action;
}

action bit3_6_0_action() {
	modify_field(unit6.data3, buff3.data);
	modify_field(buff3.data, unit5.data3);
}

action bit3_6_1_action() {
	modify_field(unit6.data3, unit7.data3);
	modify_field(unit7.data3, unit8.data3);
	modify_field(unit8.data3, unit9.data3);
	modify_field(unit9.data3, unit10.data3);
	modify_field(unit10.data3, unit11.data3);
	modify_field(unit11.data3, buff3.data);
	modify_field(buff3.data, unit5.data3);
}

table bit3_6 {
	reads {
		key.code1 mask 0x00080000 :	exact;
	}
	actions {
		bit3_6_0_action;
		bit3_6_1_action;
	}
	default_action: bit3_6_0_action;
}

action bit4_6_0_action() {
	modify_field(unit6.data4, buff4.data);
	modify_field(buff4.data, unit5.data4);
}

action bit4_6_1_action() {
	modify_field(unit6.data4, unit7.data4);
	modify_field(unit7.data4, unit8.data4);
	modify_field(unit8.data4, unit9.data4);
	modify_field(unit9.data4, unit10.data4);
	modify_field(unit10.data4, unit11.data4);
	modify_field(unit11.data4, buff4.data);
	modify_field(buff4.data, unit5.data4);
}

table bit4_6 {
	reads {
		key.code1 mask 0x00100000 :	exact;
	}
	actions {
		bit4_6_0_action;
		bit4_6_1_action;
	}
	default_action: bit4_6_0_action;
}

action bit5_6_0_action() {
	modify_field(unit6.data5, buff5.data);
	modify_field(buff5.data, unit5.data5);
}

action bit5_6_1_action() {
	modify_field(unit6.data5, unit7.data5);
	modify_field(unit7.data5, unit8.data5);
	modify_field(unit8.data5, unit9.data5);
	modify_field(unit9.data5, unit10.data5);
	modify_field(unit10.data5, unit11.data5);
	modify_field(unit11.data5, buff5.data);
	modify_field(buff5.data, unit5.data5);
}

table bit5_6 {
	reads {
		key.code1 mask 0x00200000 :	exact;
	}
	actions {
		bit5_6_0_action;
		bit5_6_1_action;
	}
	default_action: bit5_6_0_action;
}

action bit6_6_0_action() {
	modify_field(unit6.data6, buff6.data);
	modify_field(buff6.data, unit5.data6);
}

action bit6_6_1_action() {
	modify_field(unit6.data6, unit7.data6);
	modify_field(unit7.data6, unit8.data6);
	modify_field(unit8.data6, unit9.data6);
	modify_field(unit9.data6, unit10.data6);
	modify_field(unit10.data6, unit11.data6);
	modify_field(unit11.data6, buff6.data);
	modify_field(buff6.data, unit5.data6);
}

table bit6_6 {
	reads {
		key.code1 mask 0x00400000 :	exact;
	}
	actions {
		bit6_6_0_action;
		bit6_6_1_action;
	}
	default_action: bit6_6_0_action;
}

action bit7_6_0_action() {
	modify_field(unit6.data7, buff7.data);
	modify_field(buff7.data, unit5.data7);
	
}

action bit7_6_1_action() {
	modify_field(unit6.data7, unit7.data7);
	modify_field(unit7.data7, unit8.data7);
	modify_field(unit8.data7, unit9.data7);
	modify_field(unit9.data7, unit10.data7);
	modify_field(unit10.data7, unit11.data7);
	modify_field(unit11.data7, buff7.data);
	modify_field(buff7.data, unit5.data7);
}

table bit7_6 {
	reads {
		key.code1 mask 0x00800000 :	exact;
	}
	actions {
		bit7_6_0_action;
		bit7_6_1_action;
	}
	default_action: bit7_6_0_action;
}

////////////////////////////////////////////// 7

action bit0_7_0_action() {
	modify_field(unit7.data0, buff0.data);
	modify_field(buff0.data, unit6.data0);
}

action bit0_7_1_action() {
	modify_field(unit7.data0, unit8.data0);
	modify_field(unit8.data0, unit9.data0);
	modify_field(unit9.data0, unit10.data0);
	modify_field(unit10.data0, unit11.data0);
	modify_field(unit11.data0, buff0.data);
	modify_field(buff0.data, unit6.data0);
}

table bit0_7 {
	reads {
		key.code1 mask 0x01000000 :	exact;
	}
	actions {
		bit0_7_0_action;
		bit0_7_1_action;
	}
	default_action: bit0_7_0_action;
}

action bit1_7_0_action() {
	modify_field(unit7.data1, buff1.data);
	modify_field(buff1.data, unit6.data1);
}

action bit1_7_1_action() {
	modify_field(unit7.data1, unit8.data1);
	modify_field(unit8.data1, unit9.data1);
	modify_field(unit9.data1, unit10.data1);
	modify_field(unit10.data1, unit11.data1);
	modify_field(unit11.data1, buff1.data);
	modify_field(buff1.data, unit6.data1);
}

table bit1_7 {
	reads {
		key.code1 mask 0x02000000 :	exact;
	}
	actions {
		bit1_7_0_action;
		bit1_7_1_action;
	}
	default_action: bit1_7_0_action;
}

action bit2_7_0_action() {
	modify_field(unit7.data2, buff2.data);
	modify_field(buff2.data, unit6.data2);
}

action bit2_7_1_action() {
	modify_field(unit7.data2, unit8.data2);
	modify_field(unit8.data2, unit9.data2);
	modify_field(unit9.data2, unit10.data2);
	modify_field(unit10.data2, unit11.data2);
	modify_field(unit11.data2, buff2.data);
	modify_field(buff2.data, unit6.data2);
}

table bit2_7 {
	reads {
		key.code1 mask 0x04000000 :	exact;
	}
	actions {
		bit2_7_0_action;
		bit2_7_1_action;
	}
	default_action: bit2_7_0_action;
}

action bit3_7_0_action() {
	modify_field(unit7.data3, buff3.data);
	modify_field(buff3.data, unit6.data3);
}

action bit3_7_1_action() {
	modify_field(unit7.data3, unit8.data3);
	modify_field(unit8.data3, unit9.data3);
	modify_field(unit9.data3, unit10.data3);
	modify_field(unit10.data3, unit11.data3);
	modify_field(unit11.data3, buff3.data);
	modify_field(buff3.data, unit6.data3);
}

table bit3_7 {
	reads {
		key.code1 mask 0x08000000 :	exact;
	}
	actions {
		bit3_7_0_action;
		bit3_7_1_action;
	}
	default_action: bit3_7_0_action;
}

action bit4_7_0_action() {
	modify_field(unit7.data4, buff4.data);
	modify_field(buff4.data, unit6.data4);
}

action bit4_7_1_action() {
	modify_field(unit7.data4, unit8.data4);
	modify_field(unit8.data4, unit9.data4);
	modify_field(unit9.data4, unit10.data4);
	modify_field(unit10.data4, unit11.data4);
	modify_field(unit11.data4, buff4.data);
	modify_field(buff4.data, unit6.data4);
}

table bit4_7 {
	reads {
		key.code1 mask 0x10000000 :	exact;
	}
	actions {
		bit4_7_0_action;
		bit4_7_1_action;
	}
	default_action: bit4_7_0_action;
}

action bit5_7_0_action() {
	modify_field(unit7.data5, buff5.data);
	modify_field(buff5.data, unit6.data5);
}

action bit5_7_1_action() {
	modify_field(unit7.data5, unit8.data5);
	modify_field(unit8.data5, unit9.data5);
	modify_field(unit9.data5, unit10.data5);
	modify_field(unit10.data5, unit11.data5);
	modify_field(unit11.data5, buff5.data);
	modify_field(buff5.data, unit6.data5);
}

table bit5_7 {
	reads {
		key.code1 mask 0x20000000 :	exact;
	}
	actions {
		bit5_7_0_action;
		bit5_7_1_action;
	}
	default_action: bit5_7_0_action;
}

action bit6_7_0_action() {
	modify_field(unit7.data6, buff6.data);
	modify_field(buff6.data, unit6.data6);
}

action bit6_7_1_action() {
	modify_field(unit7.data6, unit8.data6);
	modify_field(unit8.data6, unit9.data6);
	modify_field(unit9.data6, unit10.data6);
	modify_field(unit10.data6, unit11.data6);
	modify_field(unit11.data6, buff6.data);
	modify_field(buff6.data, unit6.data6);
}

table bit6_7 {
	reads {
		key.code1 mask 0x40000000 :	exact;
	}
	actions {
		bit6_7_0_action;
		bit6_7_1_action;
	}
	default_action: bit6_7_0_action;
}

action bit7_7_0_action() {
	modify_field(unit7.data7, buff7.data);
	modify_field(buff7.data, unit6.data7);
}

action bit7_7_1_action() {	
	modify_field(unit7.data7, unit8.data7);
	modify_field(unit8.data7, unit9.data7);
	modify_field(unit9.data7, unit10.data7);
	modify_field(unit10.data7, unit11.data7);
	modify_field(unit11.data7, buff7.data);
	modify_field(buff7.data, unit6.data7);
}

table bit7_7 {
	reads {
		key.code1 mask 0x80000000 :	exact;
	}
	actions {
		bit7_7_0_action;
		bit7_7_1_action;
	}
	default_action: bit7_7_0_action;
}

//////////////////////////////////////////////

action bit0_8_0_action() {
	modify_field(unit8.data0, buff0.data);
	modify_field(buff0.data, unit7.data0);
}

action bit0_8_1_action() {
	modify_field(unit8.data0, unit9.data0);
	modify_field(unit9.data0, unit10.data0);
	modify_field(unit10.data0, unit11.data0);
	modify_field(unit11.data0, buff0.data);
	modify_field(buff0.data, unit7.data0);
}

table bit0_8 {
	reads {
		key.code2 mask 0x00000001 :	exact;
	}
	actions {
		bit0_8_0_action;
		bit0_8_1_action;
	}
	default_action: bit0_8_0_action;
}

action bit1_8_0_action() {
	modify_field(unit8.data1, buff1.data);
	modify_field(buff1.data, unit7.data1);
}

action bit1_8_1_action() {
	modify_field(unit8.data1, unit9.data1);
	modify_field(unit9.data1, unit10.data1);
	modify_field(unit10.data1, unit11.data1);
	modify_field(unit11.data1, buff1.data);
	modify_field(buff1.data, unit7.data1);
}

table bit1_8 {
	reads {
		key.code2 mask 0x00000002 :	exact;
	}
	actions {
		bit1_8_0_action;
		bit1_8_1_action;
	}
	default_action: bit1_8_0_action;
}

action bit2_8_0_action() {
	modify_field(unit8.data2, buff2.data);
	modify_field(buff2.data, unit7.data2);
}

action bit2_8_1_action() {
	modify_field(unit8.data2, unit9.data2);
	modify_field(unit9.data2, unit10.data2);
	modify_field(unit10.data2, unit11.data2);
	modify_field(unit11.data2, buff2.data);
	modify_field(buff2.data, unit7.data2);
}

table bit2_8 {
	reads {
		key.code2 mask 0x00000004 :	exact;
	}
	actions {
		bit2_8_0_action;
		bit2_8_1_action;
	}
	default_action: bit2_8_0_action;
}

action bit3_8_0_action() {
	modify_field(unit8.data3, buff3.data);
	modify_field(buff3.data, unit7.data3);
}

action bit3_8_1_action() {
	modify_field(unit8.data3, unit9.data3);
	modify_field(unit9.data3, unit10.data3);
	modify_field(unit10.data3, unit11.data3);
	modify_field(unit11.data3, buff3.data);
	modify_field(buff3.data, unit7.data3);
}

table bit3_8 {
	reads {
		key.code2 mask 0x00000008 :	exact;
	}
	actions {
		bit3_8_0_action;
		bit3_8_1_action;
	}
	default_action: bit3_8_0_action;
}

action bit4_8_0_action() {
	modify_field(unit8.data4, buff4.data);
	modify_field(buff4.data, unit7.data4);
}

action bit4_8_1_action() {
	modify_field(unit8.data4, unit9.data4);
	modify_field(unit9.data4, unit10.data4);
	modify_field(unit10.data4, unit11.data4);
	modify_field(unit11.data4, buff4.data);
	modify_field(buff4.data, unit7.data4);
}

table bit4_8 {
	reads {
		key.code2 mask 0x00000010 :	exact;
	}
	actions {
		bit4_8_0_action;
		bit4_8_1_action;
	}
	default_action: bit4_8_0_action;
}

action bit5_8_0_action() {
	modify_field(unit8.data5, buff5.data);
	modify_field(buff5.data, unit7.data5);
}

action bit5_8_1_action() {
	modify_field(unit8.data5, unit9.data5);
	modify_field(unit9.data5, unit10.data5);
	modify_field(unit10.data5, unit11.data5);
	modify_field(unit11.data5, buff5.data);
	modify_field(buff5.data, unit7.data5);
}

table bit5_8 {
	reads {
		key.code2 mask 0x00000020 :	exact;
	}
	actions {
		bit5_8_0_action;
		bit5_8_1_action;
	}
	default_action: bit5_8_0_action;
}

action bit6_8_0_action() {
	modify_field(unit8.data6, buff6.data);
	modify_field(buff6.data, unit7.data6);
}

action bit6_8_1_action() {
	modify_field(unit8.data6, unit9.data6);
	modify_field(unit9.data6, unit10.data6);
	modify_field(unit10.data6, unit11.data6);
	modify_field(unit11.data6, buff6.data);
	modify_field(buff6.data, unit7.data6);
}

table bit6_8 {
	reads {
		key.code2 mask 0x00000040 :	exact;
	}
	actions {
		bit6_8_0_action;
		bit6_8_1_action;
	}
	default_action: bit6_8_0_action;
}

action bit7_8_0_action() {
	modify_field(unit8.data7, buff7.data);
	modify_field(buff7.data, unit7.data7);
}

action bit7_8_1_action() {
	modify_field(unit8.data7, unit9.data7);
	modify_field(unit9.data7, unit10.data7);
	modify_field(unit10.data7, unit11.data7);
	modify_field(unit11.data7, buff7.data);
	modify_field(buff7.data, unit7.data7);
}

table bit7_8 {
	reads {
		key.code2 mask 0x00000080 :	exact;
	}
	actions {
		bit7_8_0_action;
		bit7_8_1_action;
	}
	default_action: bit7_8_0_action;
}

//////////////////////////////////////////////

action bit0_9_0_action() {
	modify_field(unit9.data0, buff0.data);
	modify_field(buff0.data, unit8.data0);
}

action bit0_9_1_action() {
	modify_field(unit9.data0, unit10.data0);
	modify_field(unit10.data0, unit11.data0);
	modify_field(unit11.data0, buff0.data);
	modify_field(buff0.data, unit8.data0);
}

table bit0_9 {
	reads {
		key.code2 mask 0x00000100 :	exact;
	}
	actions {
		bit0_9_0_action;
		bit0_9_1_action;
	}
	default_action: bit0_9_0_action;
}

action bit1_9_0_action() {
	modify_field(unit9.data1, buff1.data);
	modify_field(buff1.data, unit8.data1);
}

action bit1_9_1_action() {
	modify_field(unit9.data1, unit10.data1);
	modify_field(unit10.data1, unit11.data1);
	modify_field(unit11.data1, buff1.data);
	modify_field(buff1.data, unit8.data1);
}

table bit1_9 {
	reads {
		key.code2 mask 0x00000200 :	exact;
	}
	actions {
		bit1_9_0_action;
		bit1_9_1_action;
	}
	default_action: bit1_9_0_action;
}

action bit2_9_0_action() {
	modify_field(unit9.data2, buff2.data);
	modify_field(buff2.data, unit8.data2);
}

action bit2_9_1_action() {
	modify_field(unit9.data2, unit10.data2);
	modify_field(unit10.data2, unit11.data2);
	modify_field(unit11.data2, buff2.data);
	modify_field(buff2.data, unit8.data2);
}

table bit2_9 {
	reads {
		key.code2 mask 0x00000400 :	exact;
	}
	actions {
		bit2_9_0_action;
		bit2_9_1_action;
	}
	default_action: bit2_9_0_action;
}

action bit3_9_0_action() {
	modify_field(unit9.data3, buff3.data);
	modify_field(buff3.data, unit8.data3);
}

action bit3_9_1_action() {
	modify_field(unit9.data3, unit10.data3);
	modify_field(unit10.data3, unit11.data3);
	modify_field(unit11.data3, buff3.data);
	modify_field(buff3.data, unit8.data3);
}

table bit3_9 {
	reads {
		key.code2 mask 0x00000800 :	exact;
	}
	actions {
		bit3_9_0_action;
		bit3_9_1_action;
	}
	default_action: bit3_9_0_action;
}

action bit4_9_0_action() {
	modify_field(unit9.data4, buff4.data);
	modify_field(buff4.data, unit8.data4);
}

action bit4_9_1_action() {
	modify_field(unit9.data4, unit10.data4);
	modify_field(unit10.data4, unit11.data4);
	modify_field(unit11.data4, buff4.data);
	modify_field(buff4.data, unit8.data4);
}

table bit4_9 {
	reads {
		key.code2 mask 0x00001000 :	exact;
	}
	actions {
		bit4_9_0_action;
		bit4_9_1_action;
	}
	default_action: bit4_9_0_action;
}

action bit5_9_0_action() {
	modify_field(unit9.data5, buff5.data);
	modify_field(buff5.data, unit8.data5);
}

action bit5_9_1_action() {
	modify_field(unit9.data5, unit10.data5);
	modify_field(unit10.data5, unit11.data5);
	modify_field(unit11.data5, buff5.data);
	modify_field(buff5.data, unit8.data5);
}

table bit5_9 {
	reads {
		key.code2 mask 0x00002000 :	exact;
	}
	actions {
		bit5_9_0_action;
		bit5_9_1_action;
	}
	default_action: bit5_9_0_action;
}

action bit6_9_0_action() {
	modify_field(unit9.data6, buff6.data);
	modify_field(buff6.data, unit8.data6);
}

action bit6_9_1_action() {
	modify_field(unit9.data6, unit10.data6);
	modify_field(unit10.data6, unit11.data6);
	modify_field(unit11.data6, buff6.data);
	modify_field(buff6.data, unit8.data6);
}

table bit6_9 {
	reads {
		key.code2 mask 0x00004000 :	exact;
	}
	actions {
		bit6_9_0_action;
		bit6_9_1_action;
	}
	default_action: bit6_9_0_action;
}

action bit7_9_0_action() {
	modify_field(unit9.data7, buff7.data);
	modify_field(buff7.data, unit8.data7);
}

action bit7_9_1_action() {
	modify_field(unit9.data7, unit10.data7);
	modify_field(unit10.data7, unit11.data7);
	modify_field(unit11.data7, buff7.data);
	modify_field(buff7.data, unit8.data7);
}

table bit7_9 {
	reads {
		key.code2 mask 0x00008000 :	exact;
	}
	actions {
		bit7_9_0_action;
		bit7_9_1_action;
	}
	default_action: bit7_9_0_action;
}

//////////////////////////////////////////////

action bit0_10_0_action() {
	modify_field(buff0.data, unit9.data0);
}

action bit0_10_1_action() {
	swap(unit11.data0, unit10.data0);
	modify_field(buff0.data, unit9.data0);
}

table bit0_10 {
	reads {
		key.code2 mask 0x00010000 :	exact;
	}
	actions {
		bit0_10_0_action;
		bit0_10_1_action;
	}
	default_action: bit0_10_0_action;
}

action bit1_10_0_action() {
	modify_field(buff1.data, unit9.data1);
}

action bit1_10_1_action() {
	swap(unit11.data1, unit10.data1);
	modify_field(buff1.data, unit9.data1);
}

table bit1_10 {
	reads {
		key.code2 mask 0x00020000 :	exact;
	}
	actions {
		bit1_10_0_action;
		bit1_10_1_action;
	}
	default_action: bit1_10_0_action;
}

action bit2_10_0_action() {
	modify_field(buff2.data, unit9.data2);
}

action bit2_10_1_action() {
	swap(unit11.data2, unit10.data2);
	modify_field(buff2.data, unit9.data2);
}

table bit2_10 {
	reads {
		key.code2 mask 0x00040000 :	exact;
	}
	actions {
		bit2_10_0_action;
		bit2_10_1_action;
	}
	default_action: bit2_10_0_action;
}

action bit3_10_0_action() {
	modify_field(buff3.data, unit9.data3);
}

action bit3_10_1_action() {
	swap(unit11.data3, unit10.data3);
	modify_field(buff3.data, unit9.data3);
}

table bit3_10 {
	reads {
		key.code2 mask 0x00080000 :	exact;
	}
	actions {
		bit3_10_0_action;
		bit3_10_1_action;
	}
	default_action: bit3_10_0_action;
}

action bit4_10_0_action() {
	modify_field(buff4.data, unit9.data4);

}

action bit4_10_1_action() {
	swap(unit11.data4, unit10.data4);
	modify_field(buff4.data, unit9.data4);
}

table bit4_10 {
	reads {
		key.code2 mask 0x00100000 :	exact;
	}
	actions {
		bit4_10_0_action;
		bit4_10_1_action;
	}
	default_action: bit4_10_0_action;
}

action bit5_10_0_action() {
	modify_field(buff5.data, unit9.data5);
}

action bit5_10_1_action() {
	swap(unit11.data5, unit10.data5);
	modify_field(buff5.data, unit9.data5);
}

table bit5_10 {
	reads {
		key.code2 mask 0x00200000 :	exact;
	}
	actions {
		bit5_10_0_action;
		bit5_10_1_action;
	}
	default_action: bit5_10_0_action;
}

action bit6_10_0_action() {
	modify_field(buff6.data, unit9.data6);
}

action bit6_10_1_action() {
	swap(unit11.data6, unit10.data6);
	modify_field(buff6.data, unit9.data6);
}

table bit6_10 {
	reads {
		key.code2 mask 0x00400000 :	exact;
	}
	actions {
		bit6_10_0_action;
		bit6_10_1_action;
	}
	default_action: bit6_10_0_action;
}

action bit7_10_0_action() {
	modify_field(buff7.data, unit9.data7);
}

action bit7_10_1_action() {
	swap(unit11.data7, unit10.data7);
	modify_field(buff7.data, unit9.data7);
}

table bit7_10 {
	reads {
		key.code2 mask 0x00800000 :	exact;
	}
	actions {
		bit7_10_0_action;
		bit7_10_1_action;
	}
	default_action: bit7_10_0_action;
}

////////////////////////////////////////////////////

action remove_tag_action() {
	remove_header(tag);
	add_to_field(ipv4.totalLen, -4);
}

table remove_tag {
	actions {
		remove_tag_action;
	}
	default_action: remove_tag_action;
}

action read_key0_action() {
	salu_get_box00.execute_stateful_alu(0);
}

table read_key0 {
	actions {
		read_key0_action;
	}
	default_action: read_key0_action;
}

action read_key1_action() {
	salu_get_box01.execute_stateful_alu(0);
}

table read_key1 {
	actions {
		read_key1_action;
	}
	default_action: read_key1_action;
}

action read_key2_action() {
	salu_get_box02.execute_stateful_alu(0);
}

table read_key2 {
	actions {
		read_key2_action;
	}
	default_action: read_key2_action;
}
/*
action place_keybit0_action() {
	modify_field_with_shift(keybit.code0, key.code0, 0, 0x01);
	modify_field_with_shift(keybit.code1, key.code0, 10, 0x01);
	modify_field_with_shift(keybit.code2, key.code0, 20, 0x01);
	modify_field_with_shift(keybit.code3, key.code0, 30, 0x01);
	modify_field_with_shift(keybit.code4, key.code1, 8, 0x01);
	modify_field_with_shift(keybit.code5, key.code1, 18, 0x01);
	modify_field_with_shift(keybit.code6, key.code1, 28, 0x01);
	modify_field_with_shift(keybit.code7, key.code2, 6, 0x01);
}

table place_keybit0 {
	actions {
		place_keybit0_action;
	}
	default_action: place_keybit0_action;
}
*/

///////////////////////////////
control ingress {
	apply(read_key0);
	apply(read_key1);
	apply(read_key2);
	apply(forward);
	//apply(place_keybit0);/////////////////////

	apply(bit0_10);
	apply(bit1_10);
	apply(bit2_10);
	apply(bit3_10);
	apply(bit4_10);
	apply(bit5_10);
	apply(bit6_10);
	apply(bit7_10);

	apply(bit0_9);
	apply(bit1_9);
	apply(bit2_9);
	apply(bit3_9);
	apply(bit4_9);
	apply(bit5_9);
	apply(bit6_9);
	apply(bit7_9);

	apply(bit0_8);
	apply(bit1_8);
	apply(bit2_8);
	apply(bit3_8);
	apply(bit4_8);
	apply(bit5_8);
	apply(bit6_8);
	apply(bit7_8);

	apply(bit0_7);
	apply(bit1_7);
	apply(bit2_7);
	apply(bit3_7);
	apply(bit4_7);
	apply(bit5_7);
	apply(bit6_7);
	apply(bit7_7);

	apply(bit0_6);
	apply(bit1_6);
	apply(bit2_6);
	apply(bit3_6);
	apply(bit4_6);
	apply(bit5_6);
	apply(bit6_6);
	apply(bit7_6);

	apply(bit0_5);
	apply(bit1_5);
	apply(bit2_5);
	apply(bit3_5);
	apply(bit4_5);
	apply(bit5_5);
	apply(bit6_5);
	apply(bit7_5);

	apply(bit0_4);
	apply(bit1_4);
	apply(bit2_4);
	apply(bit3_4);
	apply(bit4_4);
	apply(bit5_4);
	apply(bit6_4);
	apply(bit7_4);

	apply(bit0_3);
	apply(bit1_3);
	apply(bit2_3);
	apply(bit3_3);
	apply(bit4_3);
	apply(bit5_3);
	apply(bit6_3);
	apply(bit7_3);

	apply(bit0_2);
	apply(bit1_2);
	apply(bit2_2);
	apply(bit3_2);
	apply(bit4_2);
	apply(bit5_2);
	apply(bit6_2);
	apply(bit7_2);

	apply(bit0_1);
	apply(bit1_1);
	apply(bit2_1);
	apply(bit3_1);
	apply(bit4_1);
	apply(bit5_1);
	apply(bit6_1);
	apply(bit7_1);

	apply(bit0_0);
	apply(bit1_0);
	apply(bit2_0);
	apply(bit3_0);
	apply(bit4_0);
	apply(bit5_0);
	apply(bit6_0);
	apply(bit7_0);

	//apply(forward);
	//apply(remove_tag);
	

	
}

control egress {
	
}
