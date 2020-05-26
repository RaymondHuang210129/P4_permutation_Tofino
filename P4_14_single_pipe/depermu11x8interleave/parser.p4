header ethernet_t ethernet;
header ipv4_t ipv4;
header udp_t udp;
header flag_t flag;
header tag_t tag;

/*

header unit16_t unit0;
header unit16_t unit1;
header unit16_t unit2;
header unit16_t unit3;
header unit16_t unit4;
header unit32_t unit5;
header unit32_t unit6;
header unit32_t unit7;

*/

header unit_mix unit0;
header unit_mix unit1;
header unit_mix unit2;
header unit_mix unit3;
header unit_mix unit4;
header unit_mix unit5;
header unit_mix unit6;
header unit_mix unit7;
header unit_mix unit8;
header unit_mix unit9;
header unit_mix unit10;
header unit_mix unit11;

metadata unit16b_t buff0;
metadata unit16b_t buff1;
metadata unit16b_t buff2;
metadata unit16b_t buff3;
metadata unit16b_t buff4;
metadata unit16b_t buff5;
metadata unit32b_t buff6;/////
metadata unit32b_t buff7;/////


metadata keybuf_t key;
metadata keybit_t keybit;


//header flag_t flag2;

//header unit_t unit_i[45];

//@pragma pa_container ingress unit_i[54].data 32

//metadata binary_metadata_t binary_metadata;
metadata routing_metadata_t routing_metadata;




parser start {
	return ethernet;
}

parser ethernet {
	extract(ethernet);
	return select(latest.ethertype) {
		0x800:		ipv4;
		default: ingress;
	}
}

parser ipv4 {
	extract(ipv4);
	return select(latest.protocol) {
		0x11:		udp;
		default:	ingress;
	}
}

parser udp {
	extract(udp);
	return unit0;
}
/*
parser tag {
	extract(tag);
	return select(latest.code_i) {
		0x41:		unit0;
		0x43:		ingress;
		default:	ingress;
	}
}

parser flag {
	extract(flag);
	return unit0;
}
*/
parser unit0 {
	extract(unit0);
	return unit1;
}

parser unit1 {
	extract(unit1);
	return unit2;
}

parser unit2 {
	extract(unit2);
	return unit3;
}

parser unit3 {
	extract(unit3);
	return unit4;
}

parser unit4 {
	extract(unit4);
	return unit5;
}

parser unit5 {
	extract(unit5);
	return unit6;
}

parser unit6 {
	extract(unit6);
	return unit7;
}

parser unit7 {
	extract(unit7);
	return unit8;
}

parser unit8 {
	extract(unit8);
	return unit9;
}
parser unit9 {
	extract(unit9);
	return unit10;
}
parser unit10 {
	extract(unit10);
	return unit11;
}
parser unit11 {
	extract(unit11);
	return ingress;
}
