header_type ethernet_t {
	fields {
		dstAddr		: 48;
		srcAddr		: 48;
		ethertype	: 16;
	}
}

header_type ipv4_t {
	fields {
		version		: 4;
		ihl			: 4;
		diffserv	: 8;
		totalLen	: 16;
		identification:16;
		flags		: 3;
		fragOffset	: 13;
		ttl 		: 8;
		protocol	: 8;
		hdrChecksum	: 16;
		srcAddr		: 32;
		dstAddr		: 32;
	}
}

header_type udp_t {
	fields {
		src_port	: 16;
		dst_port	: 16;
		len 		: 16;
		checksum 	: 16;
	}
}

header_type flag_t {
	fields {
		code0_0 	: 1;
		code0_1 	: 1;
		code0_2 	: 1;
		code0_3 	: 1;
		code0_4 	: 1;
		code0_5 	: 1;
		code0_6 	: 1;
		code0_7 	: 1;
		code0_8		: 1;
		code0_9		: 1;
		code1_0 	: 1;
		code1_1 	: 1;
		code1_2 	: 1;
		code1_3 	: 1;
		code1_4 	: 1;
		code1_5 	: 1;
		code1_6 	: 1;
		code1_7 	: 1;
		code1_8		: 1;
		code1_9		: 1;
		code2_0 	: 1;
		code2_1 	: 1;
		code2_2 	: 1;
		code2_3 	: 1;
		code2_4 	: 1;
		code2_5 	: 1;
		code2_6 	: 1;
		code2_7 	: 1;
		code2_8		: 1;
		code2_9		: 1;
		code3_0 	: 1;
		code3_1 	: 1;
		code3_2 	: 1;
		code3_3 	: 1;
		code3_4 	: 1;
		code3_5 	: 1;
		code3_6 	: 1;
		code3_7 	: 1;
		code3_8		: 1;
		code3_9		: 1;
		code4_0 	: 1;
		code4_1 	: 1;
		code4_2 	: 1;
		code4_3 	: 1;
		code4_4 	: 1;
		code4_5 	: 1;
		code4_6 	: 1;
		code4_7 	: 1;
		code4_8		: 1;
		code4_9		: 1;
		code5_0 	: 1;
		code5_1 	: 1;
		code5_2 	: 1;
		code5_3 	: 1;
		code5_4 	: 1;
		code5_5 	: 1;
		code5_6 	: 1;
		code5_7 	: 1;
		code5_8		: 1;
		code5_9		: 1;
		code6_0 	: 1;
		code6_1 	: 1;
		code6_2 	: 1;
		code6_3 	: 1;
		code6_4 	: 1;
		code6_5 	: 1;
		code6_6 	: 1;
		code6_7 	: 1;
		code6_8		: 1;
		code6_9		: 1;
		code7_0 	: 1;
		code7_1 	: 1;
		code7_2 	: 1;
		code7_3 	: 1;
		code7_4 	: 1;
		code7_5 	: 1;
		code7_6 	: 1;
		code7_7 	: 1;
		code7_8		: 1;
		code7_9		: 1;
	}
}

header_type tag_t {
	fields {
		padding		: 16;
		code_i		: 8;
		code_e		: 8;
	}
}

header_type unit16_t {
	fields {
		data0 		: 16;
		data1		: 16;
		data2		: 16;
		data3		: 16;
		data4		: 16;
		data5		: 16;
		data6		: 16;
		data7		: 16;
		data8		: 16;
		data9		: 16;
		data10		: 16;

	}
}

header_type unit16b_t {
	fields {
		data 		: 16;
	}
}

header_type unit32_t {
	fields {
		data0 		: 32;
		data1		: 32;
		data2		: 32;
		data3		: 32;
		data4		: 32;
		data5		: 32;
		data6		: 32;
		data7		: 32;
		data8		: 32;
		data9		: 32;
		data10		: 32;
	}
}

header_type unit32b_t {
	fields {
		data 		: 32;
	}
}

header_type unit8_t {
	fields {
		data0 		: 8;
		data1		: 8;
		data2		: 8;
		data3		: 8;
		data4		: 8;
		data5		: 8;
		data6		: 8;
		data7		: 8;
		data8		: 8;
		data9		: 8;
		data10		: 8;
	}
}

header_type unit8b_t {
	fields {
		data 		: 8;
	}
}

header_type routing_metadata_t {
	fields {
		nhop_ipv4	: 32;
	}
}

header_type unit_mix {
	fields {
		data0 		: 16;
		data1		: 16;
		data2		: 16;
		data3		: 16;
		data4		: 16;
		data5		: 16;
		data6		: 32;
		data7		: 32;
	}
}

header_type keybuf_t {
	fields {
		code0 		: 32;
		code1 		: 32;
		code2 		: 32;
	}
}

header_type keybit_t {
	fields {
		code0 		: 32;
		code1 		: 32;
		code2 		: 32;
		code3 		: 32;
		code4 		: 32;
		code5 		: 32;
		code6		: 32;
		code7 		: 32;
	}
}
