#include <core.p4>
#if __TARGET_TOFINO__ == 2
#include <t2na.p4>
#else
#include <tna.p4>
#endif

#include "common/headers.p4"
#include "common/util.p4"

parser SwitchIngressParser(
        packet_in pkt,
        out header_t hdr,
        out metadata_t ig_md,
        out ingress_intrinsic_metadata_t ig_intr_md) {

    TofinoIngressParser() tofino_parser;

    state start {
        tofino_parser.apply(pkt, ig_intr_md);
        transition parse_ethernet;
    }

    state parse_ethernet {
        pkt.extract(hdr.ethernet);
        transition parse_ipv4;
    }

    state parse_ipv4 {
        pkt.extract(hdr.ipv4);
        transition parse_udp;
    }

    state parse_udp {
        pkt.extract(hdr.udp);
        transition parse_group_0;
    }

    state parse_group_0 {
        pkt.extract(hdr.group0);
        transition parse_group_1;
    }

    state parse_group_1 {
        pkt.extract(hdr.group1);
        transition parse_group_2;
    }

    state parse_group_2 {
        pkt.extract(hdr.group2);
        transition parse_group_3;
    }

    state parse_group_3 {
        pkt.extract(hdr.group3);
        transition parse_group_4;
    }

    state parse_group_4 {
        pkt.extract(hdr.group4);
        transition parse_group_5;
    }

    state parse_group_5 {
        pkt.extract(hdr.group5);
        transition parse_group_6;
    }

    state parse_group_6 {
        pkt.extract(hdr.group6);
        transition parse_group_7;
    }

    state parse_group_7 {
        pkt.extract(hdr.group7);
        transition parse_group_8;
    }

    state parse_group_8 {
        pkt.extract(hdr.group8);
        transition parse_group_9;
    }

    state parse_group_9 {
        pkt.extract(hdr.group9);
        transition parse_group_10;
    }

    state parse_group_10 {
        pkt.extract(hdr.group10);
        transition parse_group_11;
    }

    state parse_group_11 {
        pkt.extract(hdr.group11);
        transition parse_group_12;
    }

    state parse_group_12 {
        pkt.extract(hdr.group12);
        transition parse_group_13;
    }

    state parse_group_13 {
        pkt.extract(hdr.group13);
        transition parse_group_14;
    }

    state parse_group_14 {
        pkt.extract(hdr.group14);
        transition parse_group_15;
    }

    state parse_group_15 {
        pkt.extract(hdr.group15);
        transition accept;
    }
}

control SwitchIngressDeparser(
        packet_out pkt,
        inout header_t hdr,
        in metadata_t ig_md,
        in ingress_intrinsic_metadata_for_deparser_t ig_dprsr_md) {

    apply {
        pkt.emit(hdr);
    }
}

control SwitchIngress(
        inout header_t hdr,
        inout metadata_t ig_md,
        in ingress_intrinsic_metadata_t ig_intr_md,
        in ingress_intrinsic_metadata_from_parser_t ig_prsr_md,
        inout ingress_intrinsic_metadata_for_deparser_t ig_dprsr_md,
        inout ingress_intrinsic_metadata_for_tm_t ig_tm_md) {

    //-------------------- start of register part

    Register<bit<32>, bit<32>>(32w1, 32w0) key_reg_0;
    Register<bit<32>, bit<32>>(32w1, 32w0) key_reg_1;
    Register<bit<32>, bit<32>>(32w1, 32w0) key_reg_2;

    RegisterAction<bit<32>, bit<1>, bit<32>>(key_reg_0) read_key_0_ra = {
        void apply(inout bit<32> val, out bit<32> ret) {
            ret = val;
        }
    };

    RegisterAction<bit<32>, bit<1>, bit<32>>(key_reg_1) read_key_1_ra = {
        void apply(inout bit<32> val, out bit<32> ret) {
            ret = val;
        }
    };

    RegisterAction<bit<32>, bit<1>, bit<32>>(key_reg_2) read_key_2_ra = {
        void apply(inout bit<32> val, out bit<32> ret) {
            ret = val;
        }
    };

    //-------------------- end of register part

    //-------------------- start of forwarding part

    action set_egr(PortId_t port) {
        ig_tm_md.ucast_egress_port = port;
    }

    action set_drop(bit<3> drop) {
        ig_dprsr_md.drop_ctl = drop;
    }

    table forward {
        key = {
            hdr.ethernet.dstAddr : exact;
        }
        actions = {
            set_egr;
            set_drop;
        }
        const default_action = set_egr(132);
        size = 1024;
    }

    //-------------------- end of forwarding part

    //-------------------- start of permutation part

    action cluster0_bit0_0_action() {
        bit<32> tmp = hdr.group0.data0;
        hdr.group0.data0 = hdr.group1.data0;
        hdr.group1.data0 = hdr.group2.data0;
        hdr.group2.data0 = hdr.group3.data0;
        hdr.group3.data0 = hdr.group4.data0;
        hdr.group4.data0 = hdr.group5.data0;
        hdr.group5.data0 = hdr.group6.data0;
        hdr.group6.data0 = hdr.group7.data0;
        hdr.group7.data0 = hdr.group8.data0;
        hdr.group8.data0 = hdr.group9.data0;
        hdr.group9.data0 = hdr.group10.data0;
        hdr.group10.data0 = hdr.group11.data0;
        hdr.group11.data0 = hdr.group12.data0;
        hdr.group12.data0 = hdr.group13.data0;
        hdr.group13.data0 = hdr.group14.data0;
        hdr.group14.data0 = hdr.group15.data0;
        hdr.group15.data0 = tmp;
    }

    action cluster0_bit0_1_action() {
        bit<32> tmp = hdr.group15.data0;
        hdr.group15.data0 = hdr.group14.data0;
        hdr.group14.data0 = hdr.group13.data0;
        hdr.group13.data0 = hdr.group12.data0;
        hdr.group12.data0 = hdr.group11.data0;
        hdr.group11.data0 = hdr.group10.data0;
        hdr.group10.data0 = hdr.group9.data0;
        hdr.group9.data0 = hdr.group8.data0;
        hdr.group8.data0 = hdr.group7.data0;
        hdr.group7.data0 = hdr.group6.data0;
        hdr.group6.data0 = hdr.group5.data0;
        hdr.group5.data0 = hdr.group4.data0;
        hdr.group4.data0 = hdr.group3.data0;
        hdr.group3.data0 = hdr.group2.data0;
        hdr.group2.data0 = hdr.group1.data0;
        hdr.group1.data0 = hdr.group0.data0;
        hdr.group0.data0 = tmp;
    }

    table cluster0_bit0 {
        key = {
            ig_md.key.code0 : ternary;
        }

        actions = {
            cluster0_bit0_0_action;
            cluster0_bit0_1_action;
        }
        const default_action = cluster0_bit0_0_action;
        const entries = {
            32w0 &&& 0x00000001 : cluster0_bit0_0_action();
            32w1 &&& 0x00000001 : cluster0_bit0_1_action();
        }
        size = 2;
    }

    action cluster1_bit0_0_action() {
        bit<32> tmp = hdr.group0.data1;
        hdr.group0.data1 = hdr.group1.data1;
        hdr.group1.data1 = hdr.group2.data1;
        hdr.group2.data1 = hdr.group3.data1;
        hdr.group3.data1 = hdr.group4.data1;
        hdr.group4.data1 = hdr.group5.data1;
        hdr.group5.data1 = hdr.group6.data1;
        hdr.group6.data1 = hdr.group7.data1;
        hdr.group7.data1 = hdr.group8.data1;
        hdr.group8.data1 = hdr.group9.data1;
        hdr.group9.data1 = hdr.group10.data1;
        hdr.group10.data1 = hdr.group11.data1;
        hdr.group11.data1 = hdr.group12.data1;
        hdr.group12.data1 = hdr.group13.data1;
        hdr.group13.data1 = hdr.group14.data1;
        hdr.group14.data1 = hdr.group15.data1;
        hdr.group15.data1 = tmp;
    }

    action cluster1_bit0_1_action() {
        bit<32> tmp = hdr.group15.data1;
        hdr.group15.data1 = hdr.group14.data1;
        hdr.group14.data1 = hdr.group13.data1;
        hdr.group13.data1 = hdr.group12.data1;
        hdr.group12.data1 = hdr.group11.data1;
        hdr.group11.data1 = hdr.group10.data1;
        hdr.group10.data1 = hdr.group9.data1;
        hdr.group9.data1 = hdr.group8.data1;
        hdr.group8.data1 = hdr.group7.data1;
        hdr.group7.data1 = hdr.group6.data1;
        hdr.group6.data1 = hdr.group5.data1;
        hdr.group5.data1 = hdr.group4.data1;
        hdr.group4.data1 = hdr.group3.data1;
        hdr.group3.data1 = hdr.group2.data1;
        hdr.group2.data1 = hdr.group1.data1;
        hdr.group1.data1 = hdr.group0.data1;
        hdr.group0.data1 = tmp;
    }

    table cluster1_bit0 {
        key = {
            ig_md.key.code0 : ternary;
        }

        actions = {
            cluster1_bit0_0_action;
            cluster1_bit0_1_action;
        }
        const default_action = cluster1_bit0_0_action;
        const entries = {
            32w0 &&& 0x00000002 : cluster1_bit0_0_action();
            32w1 &&& 0x00000002 : cluster1_bit0_1_action();
        }
        size = 2;
    }    

    action cluster2_bit0_0_action() {
        bit<32> tmp = hdr.group0.data2;
        hdr.group0.data2 = hdr.group1.data2;
        hdr.group1.data2 = hdr.group2.data2;
        hdr.group2.data2 = hdr.group3.data2;
        hdr.group3.data2 = hdr.group4.data2;
        hdr.group4.data2 = hdr.group5.data2;
        hdr.group5.data2 = hdr.group6.data2;
        hdr.group6.data2 = hdr.group7.data2;
        hdr.group7.data2 = hdr.group8.data2;
        hdr.group8.data2 = hdr.group9.data2;
        hdr.group9.data2 = hdr.group10.data2;
        hdr.group10.data2 = hdr.group11.data2;
        hdr.group11.data2 = hdr.group12.data2;
        hdr.group12.data2 = hdr.group13.data2;
        hdr.group13.data2 = hdr.group14.data2;
        hdr.group14.data2 = hdr.group15.data2;
        hdr.group15.data2 = tmp;
    }

    action cluster2_bit0_1_action() {
        bit<32> tmp = hdr.group15.data2;
        hdr.group15.data2 = hdr.group14.data2;
        hdr.group14.data2 = hdr.group13.data2;
        hdr.group13.data2 = hdr.group12.data2;
        hdr.group12.data2 = hdr.group11.data2;
        hdr.group11.data2 = hdr.group10.data2;
        hdr.group10.data2 = hdr.group9.data2;
        hdr.group9.data2 = hdr.group8.data2;
        hdr.group8.data2 = hdr.group7.data2;
        hdr.group7.data2 = hdr.group6.data2;
        hdr.group6.data2 = hdr.group5.data2;
        hdr.group5.data2 = hdr.group4.data2;
        hdr.group4.data2 = hdr.group3.data2;
        hdr.group3.data2 = hdr.group2.data2;
        hdr.group2.data2 = hdr.group1.data2;
        hdr.group1.data2 = hdr.group0.data2;
        hdr.group0.data2 = tmp;
    }

    table cluster2_bit0 {
        key = {
            ig_md.key.code0 : ternary;
        }

        actions = {
            cluster2_bit0_0_action;
            cluster2_bit0_1_action;
        }
        const default_action = cluster2_bit0_0_action;
        const entries = {
            32w0 &&& 0x00000004 : cluster2_bit0_0_action();
            32w1 &&& 0x00000004 : cluster2_bit0_1_action();
        }
        size = 2;
    }    

    action cluster3_bit0_0_action() {
        bit<32> tmp = hdr.group0.data3;
        hdr.group0.data3 = hdr.group1.data3;
        hdr.group1.data3 = hdr.group2.data3;
        hdr.group2.data3 = hdr.group3.data3;
        hdr.group3.data3 = hdr.group4.data3;
        hdr.group4.data3 = hdr.group5.data3;
        hdr.group5.data3 = hdr.group6.data3;
        hdr.group6.data3 = hdr.group7.data3;
        hdr.group7.data3 = hdr.group8.data3;
        hdr.group8.data3 = hdr.group9.data3;
        hdr.group9.data3 = hdr.group10.data3;
        hdr.group10.data3 = hdr.group11.data3;
        hdr.group11.data3 = hdr.group12.data3;
        hdr.group12.data3 = hdr.group13.data3;
        hdr.group13.data3 = hdr.group14.data3;
        hdr.group14.data3 = hdr.group15.data3;
        hdr.group15.data3 = tmp;
    }

    action cluster3_bit0_1_action() {
        bit<32> tmp = hdr.group15.data3;
        hdr.group15.data3 = hdr.group14.data3;
        hdr.group14.data3 = hdr.group13.data3;
        hdr.group13.data3 = hdr.group12.data3;
        hdr.group12.data3 = hdr.group11.data3;
        hdr.group11.data3 = hdr.group10.data3;
        hdr.group10.data3 = hdr.group9.data3;
        hdr.group9.data3 = hdr.group8.data3;
        hdr.group8.data3 = hdr.group7.data3;
        hdr.group7.data3 = hdr.group6.data3;
        hdr.group6.data3 = hdr.group5.data3;
        hdr.group5.data3 = hdr.group4.data3;
        hdr.group4.data3 = hdr.group3.data3;
        hdr.group3.data3 = hdr.group2.data3;
        hdr.group2.data3 = hdr.group1.data3;
        hdr.group1.data3 = hdr.group0.data3;
        hdr.group0.data3 = tmp;
    }

    table cluster3_bit0 {
        key = {
            ig_md.key.code0 : ternary;
        }

        actions = {
            cluster3_bit0_0_action;
            cluster3_bit0_1_action;
        }
        const default_action = cluster3_bit0_0_action;
        const entries = {
            32w0 &&& 0x00000008 : cluster3_bit0_0_action();
            32w1 &&& 0x00000008 : cluster3_bit0_1_action();
        }
        size = 2;
    }

    action cluster4_bit0_0_action() {
        bit<32> tmp = hdr.group0.data4;
        hdr.group0.data4 = hdr.group1.data4;
        hdr.group1.data4 = hdr.group2.data4;
        hdr.group2.data4 = hdr.group3.data4;
        hdr.group3.data4 = hdr.group4.data4;
        hdr.group4.data4 = hdr.group5.data4;
        hdr.group5.data4 = hdr.group6.data4;
        hdr.group6.data4 = hdr.group7.data4;
        hdr.group7.data4 = hdr.group8.data4;
        hdr.group8.data4 = hdr.group9.data4;
        hdr.group9.data4 = hdr.group10.data4;
        hdr.group10.data4 = hdr.group11.data4;
        hdr.group11.data4 = hdr.group12.data4;
        hdr.group12.data4 = hdr.group13.data4;
        hdr.group13.data4 = hdr.group14.data4;
        hdr.group14.data4 = hdr.group15.data4;
        hdr.group15.data4 = tmp;
    }

    action cluster4_bit0_1_action() {
        bit<32> tmp = hdr.group15.data4;
        hdr.group15.data4 = hdr.group14.data4;
        hdr.group14.data4 = hdr.group13.data4;
        hdr.group13.data4 = hdr.group12.data4;
        hdr.group12.data4 = hdr.group11.data4;
        hdr.group11.data4 = hdr.group10.data4;
        hdr.group10.data4 = hdr.group9.data4;
        hdr.group9.data4 = hdr.group8.data4;
        hdr.group8.data4 = hdr.group7.data4;
        hdr.group7.data4 = hdr.group6.data4;
        hdr.group6.data4 = hdr.group5.data4;
        hdr.group5.data4 = hdr.group4.data4;
        hdr.group4.data4 = hdr.group3.data4;
        hdr.group3.data4 = hdr.group2.data4;
        hdr.group2.data4 = hdr.group1.data4;
        hdr.group1.data4 = hdr.group0.data4;
        hdr.group0.data4 = tmp;
    }

    table cluster4_bit0 {
        key = {
            ig_md.key.code0 : ternary;
        }

        actions = {
            cluster4_bit0_0_action;
            cluster4_bit0_1_action;
        }
        const default_action = cluster4_bit0_0_action;
        const entries = {
            32w0 &&& 0x00000010 : cluster4_bit0_0_action();
            32w1 &&& 0x00000010 : cluster4_bit0_1_action();
        }
        size = 2;
    }

    action cluster5_bit0_0_action() {
        bit<32> tmp = hdr.group0.data5;
        hdr.group0.data5 = hdr.group1.data5;
        hdr.group1.data5 = hdr.group2.data5;
        hdr.group2.data5 = hdr.group3.data5;
        hdr.group3.data5 = hdr.group4.data5;
        hdr.group4.data5 = hdr.group5.data5;
        hdr.group5.data5 = hdr.group6.data5;
        hdr.group6.data5 = hdr.group7.data5;
        hdr.group7.data5 = hdr.group8.data5;
        hdr.group8.data5 = hdr.group9.data5;
        hdr.group9.data5 = hdr.group10.data5;
        hdr.group10.data5 = hdr.group11.data5;
        hdr.group11.data5 = hdr.group12.data5;
        hdr.group12.data5 = hdr.group13.data5;
        hdr.group13.data5 = hdr.group14.data5;
        hdr.group14.data5 = hdr.group15.data5;
        hdr.group15.data5 = tmp;
    }

    action cluster5_bit0_1_action() {
        bit<32> tmp = hdr.group15.data5;
        hdr.group15.data5 = hdr.group14.data5;
        hdr.group14.data5 = hdr.group13.data5;
        hdr.group13.data5 = hdr.group12.data5;
        hdr.group12.data5 = hdr.group11.data5;
        hdr.group11.data5 = hdr.group10.data5;
        hdr.group10.data5 = hdr.group9.data5;
        hdr.group9.data5 = hdr.group8.data5;
        hdr.group8.data5 = hdr.group7.data5;
        hdr.group7.data5 = hdr.group6.data5;
        hdr.group6.data5 = hdr.group5.data5;
        hdr.group5.data5 = hdr.group4.data5;
        hdr.group4.data5 = hdr.group3.data5;
        hdr.group3.data5 = hdr.group2.data5;
        hdr.group2.data5 = hdr.group1.data5;
        hdr.group1.data5 = hdr.group0.data5;
        hdr.group0.data5 = tmp;
    }

    table cluster5_bit0 {
        key = {
            ig_md.key.code0 : ternary;
        }

        actions = {
            cluster5_bit0_0_action;
            cluster5_bit0_1_action;
        }
        const default_action = cluster5_bit0_0_action;
        const entries = {
            32w0 &&& 0x00000020 : cluster5_bit0_0_action();
            32w1 &&& 0x00000020 : cluster5_bit0_1_action();
        }
        size = 2;
    }

    action cluster6_bit0_0_action() {
        bit<32> tmp = hdr.group0.data6;
        hdr.group0.data6 = hdr.group1.data6;
        hdr.group1.data6 = hdr.group2.data6;
        hdr.group2.data6 = hdr.group3.data6;
        hdr.group3.data6 = hdr.group4.data6;
        hdr.group4.data6 = hdr.group5.data6;
        hdr.group5.data6 = hdr.group6.data6;
        hdr.group6.data6 = hdr.group7.data6;
        hdr.group7.data6 = hdr.group8.data6;
        hdr.group8.data6 = hdr.group9.data6;
        hdr.group9.data6 = hdr.group10.data6;
        hdr.group10.data6 = hdr.group11.data6;
        hdr.group11.data6 = hdr.group12.data6;
        hdr.group12.data6 = hdr.group13.data6;
        hdr.group13.data6 = hdr.group14.data6;
        hdr.group14.data6 = hdr.group15.data6;
        hdr.group15.data6 = tmp;
    }

    action cluster6_bit0_1_action() {
        bit<32> tmp = hdr.group15.data6;
        hdr.group15.data6 = hdr.group14.data6;
        hdr.group14.data6 = hdr.group13.data6;
        hdr.group13.data6 = hdr.group12.data6;
        hdr.group12.data6 = hdr.group11.data6;
        hdr.group11.data6 = hdr.group10.data6;
        hdr.group10.data6 = hdr.group9.data6;
        hdr.group9.data6 = hdr.group8.data6;
        hdr.group8.data6 = hdr.group7.data6;
        hdr.group7.data6 = hdr.group6.data6;
        hdr.group6.data6 = hdr.group5.data6;
        hdr.group5.data6 = hdr.group4.data6;
        hdr.group4.data6 = hdr.group3.data6;
        hdr.group3.data6 = hdr.group2.data6;
        hdr.group2.data6 = hdr.group1.data6;
        hdr.group1.data6 = hdr.group0.data6;
        hdr.group0.data6 = tmp;
    }

    table cluster6_bit0 {
        key = {
            ig_md.key.code0 : ternary;
        }

        actions = {
            cluster6_bit0_0_action;
            cluster6_bit0_1_action;
        }
        const default_action = cluster6_bit0_0_action;
        const entries = {
            32w0 &&& 0x00000040 : cluster6_bit0_0_action();
            32w1 &&& 0x00000040 : cluster6_bit0_1_action();
        }
        size = 2;
    }

    action cluster7_bit0_0_action() {
        bit<32> tmp = hdr.group0.data7;
        hdr.group0.data7 = hdr.group1.data7;
        hdr.group1.data7 = hdr.group2.data7;
        hdr.group2.data7 = hdr.group3.data7;
        hdr.group3.data7 = hdr.group4.data7;
        hdr.group4.data7 = hdr.group5.data7;
        hdr.group5.data7 = hdr.group6.data7;
        hdr.group6.data7 = hdr.group7.data7;
        hdr.group7.data7 = hdr.group8.data7;
        hdr.group8.data7 = hdr.group9.data7;
        hdr.group9.data7 = hdr.group10.data7;
        hdr.group10.data7 = hdr.group11.data7;
        hdr.group11.data7 = hdr.group12.data7;
        hdr.group12.data7 = hdr.group13.data7;
        hdr.group13.data7 = hdr.group14.data7;
        hdr.group14.data7 = hdr.group15.data7;
        hdr.group15.data7 = tmp;
    }

    action cluster7_bit0_1_action() {
        bit<32> tmp = hdr.group15.data7;
        hdr.group15.data7 = hdr.group14.data7;
        hdr.group14.data7 = hdr.group13.data7;
        hdr.group13.data7 = hdr.group12.data7;
        hdr.group12.data7 = hdr.group11.data7;
        hdr.group11.data7 = hdr.group10.data7;
        hdr.group10.data7 = hdr.group9.data7;
        hdr.group9.data7 = hdr.group8.data7;
        hdr.group8.data7 = hdr.group7.data7;
        hdr.group7.data7 = hdr.group6.data7;
        hdr.group6.data7 = hdr.group5.data7;
        hdr.group5.data7 = hdr.group4.data7;
        hdr.group4.data7 = hdr.group3.data7;
        hdr.group3.data7 = hdr.group2.data7;
        hdr.group2.data7 = hdr.group1.data7;
        hdr.group1.data7 = hdr.group0.data7;
        hdr.group0.data7 = tmp;
    }

    table cluster7_bit0 {
        key = {
            ig_md.key.code0 : ternary;
        }

        actions = {
            cluster7_bit0_0_action;
            cluster7_bit0_1_action;
        }
        const default_action = cluster7_bit0_00_action;
        const entries = {
            32w1 &&& 0x00000180 : cluster7_bit0_0_action();
            32w2 &&& 0x00000180 : cluster7_bit0_1_action();
        }
        size = 2;
    }

    apply {
        //---stage 0
        ig_md.key.code0 = read_key_0_ra.execute(0);
        ig_md.key.code1 = read_key_1_ra.execute(0);
        ig_md.key.code2 = read_key_2_ra.execute(0);
        forward.apply();
        //---stage 1
        cluster0_bit0.apply();
        cluster1_bit0.apply();
        cluster2_bit0.apply();
        cluster3_bit0.apply();
        cluster4_bit0.apply();
        cluster5_bit0.apply();
        cluster6_bit0.apply();
        cluster7_bit0.apply();
    }


}

Pipeline(SwitchIngressParser(),
         SwitchIngress(),
         SwitchIngressDeparser(),
         EmptyEgressParser(),
         EmptyEgress(),
         EmptyEgressDeparser()) pipe;

Switch(pipe) main;
