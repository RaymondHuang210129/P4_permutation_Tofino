#include <core.p4>
#if __TARGET_TOFINO__ == 2
#include <t2na.p4>
#else
#include <tna.p4>
#endif

#include "common/headers.p4"
#include "common/util.p4"

parser Pipe1SwitchIngressParser(
        packet_in pkt,
        out pipe2_header_t hdr,
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

control Pipe1SwitchIngressDeparser(
        packet_out pkt,
        inout pipe1_header_t hdr,
        in metadata_t ig_md,
        in ingress_intrinsic_metadata_for_deparser_t ig_dprsr_md) {

    apply {
        pkt.emit(hdr);
    }
}

control Pipe1SwitchIngress(
        inout pipe1_header_t hdr,
        inout metadata_t ig_md,
        in ingress_intrinsic_metadata_t ig_intr_md,
        in ingress_intrinsic_metadata_from_parser_t ig_prsr_md,
        inout ingress_intrinsic_metadata_for_deparser_t ig_dprsr_md,
        inout ingress_intrinsic_metadata_for_tm_t ig_tm_md) {

    //-------------------- start of register part

    Register<bit<32>, bit<32>>(32w1, 32w0) key_reg_0;
    Register<bit<32>, bit<32>>(32w1, 32w0) key_reg_1;
    Register<bit<32>, bit<32>>(32w1, 32w0) key_reg_2;
    Register<bit<32>, bit<32>>(32w1, 32w0) key_reg_3;
    Register<bit<32>, bit<32>>(32w1, 32w0) key_reg_4;

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

    RegisterAction<bit<32>, bit<1>, bit<32>>(key_reg_3) read_key_3_ra = {
        void apply(inout bit<32> val, out bit<32> ret) {
            ret = val;
        }
    };

    RegisterAction<bit<32>, bit<1>, bit<32>>(key_reg_4) read_key_4_ra = {
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
        const default_action = set_egr(0);
        size = 1024;
    }

    //-------------------- end of forwarding part

    //-------------------- start of permutation part

    ////------ bit 0

    #define _ACTION_BIT0_000(clst) action cluster## clst ##_bit0_000_action() {}
    _ACTION_BIT0_000(0)
    _ACTION_BIT0_000(1)
    _ACTION_BIT0_000(2)
    _ACTION_BIT0_000(3)
    _ACTION_BIT0_000(4)
    _ACTION_BIT0_000(5)
    _ACTION_BIT0_000(6)
    _ACTION_BIT0_000(7)

    #define _ACTION_BIT0_001(clst) action cluster## clst ##_bit0_001_action() { \
            cluster## clst ##_t tmp = hdr.group0.data## clst ;                  \
            hdr.group0.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group8.data## clst ;                   \
            hdr.group8.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = hdr.group5.data## clst ;                   \
            hdr.group5.data## clst = hdr.group4.data## clst ;                   \
            hdr.group4.data## clst = hdr.group3.data## clst ;                   \
            hdr.group3.data## clst = hdr.group2.data## clst ;                   \
            hdr.group2.data## clst = hdr.group1.data## clst ;                   \
            hdr.group1.data## clst = tmp;                                       \
        }
    _ACTION_BIT0_001(0)
    _ACTION_BIT0_001(1)
    _ACTION_BIT0_001(2)
    _ACTION_BIT0_001(3)
    _ACTION_BIT0_001(4)
    _ACTION_BIT0_001(5)
    _ACTION_BIT0_001(6)
    _ACTION_BIT0_001(7)

    #define _ACTION_BIT0_010(clst) action cluster## clst ##_bit0_010_action() { \
            cluster## clst ##_t tmp = hdr.group1.data## clst ;                  \
            hdr.group1.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group8.data## clst ;                   \
            hdr.group8.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = hdr.group5.data## clst ;                   \
            hdr.group5.data## clst = hdr.group4.data## clst ;                   \
            hdr.group4.data## clst = hdr.group3.data## clst ;                   \
            hdr.group3.data## clst = hdr.group2.data## clst ;                   \
            hdr.group2.data## clst = tmp;                                       \
        }
    _ACTION_BIT0_010(0)
    _ACTION_BIT0_010(1)
    _ACTION_BIT0_010(2)
    _ACTION_BIT0_010(3)
    _ACTION_BIT0_010(4)
    _ACTION_BIT0_010(5)
    _ACTION_BIT0_010(6)
    _ACTION_BIT0_010(7)

    #define _ACTION_BIT0_011(clst) action cluster## clst ##_bit0_011_action() { \
            cluster## clst ##_t tmp = hdr.group0.data## clst ;                  \
            hdr.group0.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = hdr.group5.data## clst ;                   \
            hdr.group5.data## clst = hdr.group3.data## clst ;                   \
            hdr.group3.data## clst = hdr.group1.data## clst ;                   \
            hdr.group1.data## clst = hdr.group14.data## clst ;                  \
            hdr.group14.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group8.data## clst ;                  \
            hdr.group8.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = hdr.group4.data## clst ;                   \
            hdr.group4.data## clst = hdr.group2.data## clst ;                   \
            hdr.group2.data## clst = tmp;                                       \
        }
    _ACTION_BIT0_011(0)
    _ACTION_BIT0_011(1)
    _ACTION_BIT0_011(2)
    _ACTION_BIT0_011(3)
    _ACTION_BIT0_011(4)
    _ACTION_BIT0_011(5)
    _ACTION_BIT0_011(6)
    _ACTION_BIT0_011(7)

    #define _ACTION_BIT0_100(clst) action cluster## clst ##_bit0_100_action() { \
            cluster## clst ##_t tmp = hdr.group2.data## clst ;                  \
            hdr.group2.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group8.data## clst ;                   \
            hdr.group8.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = hdr.group5.data## clst ;                   \
            hdr.group5.data## clst = hdr.group4.data## clst ;                   \
            hdr.group4.data## clst = hdr.group3.data## clst ;                   \
            hdr.group3.data## clst = tmp;                                       \
        }
    _ACTION_BIT0_100(0)
    _ACTION_BIT0_100(1)
    _ACTION_BIT0_100(2)
    _ACTION_BIT0_100(3)
    _ACTION_BIT0_100(4)
    _ACTION_BIT0_100(5)
    _ACTION_BIT0_100(6)
    _ACTION_BIT0_100(7)

    #define _ACTION_BIT0_101(clst) action cluster## clst ##_bit0_101_action() { \
            cluster## clst ##_t tmp = hdr.group0.data## clst ;                  \
            hdr.group0.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = hdr.group5.data## clst ;                   \
            hdr.group5.data## clst = hdr.group3.data## clst ;                   \
            hdr.group3.data## clst = hdr.group1.data## clst ;                   \
            hdr.group1.data## clst = tmp;                                       \
            cluster## clst ##_t tmp2 = hdr.group2.data## clst ;                 \
            hdr.group2.data## clst = hdr.group14.data## clst ;                  \
            hdr.group14.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group8.data## clst ;                  \
            hdr.group8.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = hdr.group4.data## clst ;                   \
            hdr.group4.data## clst = tmp2;                                      \
        }
    _ACTION_BIT0_101(0)
    _ACTION_BIT0_101(1)
    _ACTION_BIT0_101(2)
    _ACTION_BIT0_101(3)
    _ACTION_BIT0_101(4)
    _ACTION_BIT0_101(5)
    _ACTION_BIT0_101(6)
    _ACTION_BIT0_101(7)

    #define _ACTION_BIT0_110(clst) action cluster## clst ##_bit0_110_action() { \
            cluster## clst ##_t tmp = hdr.group1.data## clst ;                  \
            hdr.group1.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = hdr.group5.data## clst ;                   \
            hdr.group5.data## clst = hdr.group3.data## clst ;                   \
            hdr.group3.data## clst = tmp;                                       \
            cluster## clst ##_t tmp2 = hdr.group2.data## clst ;                 \
            hdr.group2.data## clst = hdr.group14.data## clst ;                  \
            hdr.group14.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group8.data## clst ;                  \
            hdr.group8.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = hdr.group4.data## clst ;                   \
            hdr.group4.data## clst = tmp2;                                      \
        }
    _ACTION_BIT0_110(0)
    _ACTION_BIT0_110(1)
    _ACTION_BIT0_110(2)
    _ACTION_BIT0_110(3)
    _ACTION_BIT0_110(4)
    _ACTION_BIT0_110(5)
    _ACTION_BIT0_110(6)
    _ACTION_BIT0_110(7)

    #define _ACTION_BIT0_111(clst) action cluster## clst ##_bit0_111_action() { \
            cluster## clst ##_t tmp = hdr.group0.data## clst ;                  \
            hdr.group0.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = hdr.group3.data## clst ;                   \
            hdr.group3.data## clst = tmp;                                       \
            cluster## clst ##_t tmp2 = hdr.group1.data## clst ;                 \
            hdr.group1.data## clst = hdr.group14.data## clst ;                  \
            hdr.group14.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group8.data## clst ;                  \
            hdr.group8.data## clst = hdr.group5.data## clst ;                   \
            hdr.group5.data## clst = hdr.group2.data## clst ;                   \
            hdr.group2.data## clst = hdr.group13.data## clst ;                  \
            hdr.group13.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group7.data## clst ;                  \
            hdr.group7.data## clst = hdr.group4.data## clst ;                   \
            hdr.group4.data## clst = tmp2;                                      \
        }
    _ACTION_BIT0_111(0)
    _ACTION_BIT0_111(1)
    _ACTION_BIT0_111(2)
    _ACTION_BIT0_111(3)
    _ACTION_BIT0_111(4)
    _ACTION_BIT0_111(5)
    _ACTION_BIT0_111(6)
    _ACTION_BIT0_111(7)

    #define _ACTION_BIT3_000(clst) action cluster## clst ##_bit3_000_action() {}
    _ACTION_BIT3_000(0)
    _ACTION_BIT3_000(1)
    _ACTION_BIT3_000(2)
    _ACTION_BIT3_000(3)
    _ACTION_BIT3_000(4)
    _ACTION_BIT3_000(5)
    _ACTION_BIT3_000(6)
    _ACTION_BIT3_000(7)

    #define _ACTION_BIT3_001(clst) action cluster## clst ##_bit3_001_action() { \
            cluster## clst ##_t tmp = hdr.group3.data## clst ;                  \
            hdr.group3.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group8.data## clst ;                   \
            hdr.group8.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = hdr.group5.data## clst ;                   \
            hdr.group5.data## clst = hdr.group4.data## clst ;                   \
            hdr.group4.data## clst = tmp;                                       \
        }
    _ACTION_BIT3_001(0)
    _ACTION_BIT3_001(1)
    _ACTION_BIT3_001(2)
    _ACTION_BIT3_001(3)
    _ACTION_BIT3_001(4)
    _ACTION_BIT3_001(5)
    _ACTION_BIT3_001(6)
    _ACTION_BIT3_001(7)

    #define _ACTION_BIT3_010(clst) action cluster## clst ##_bit3_010_action() { \
            cluster## clst ##_t tmp = hdr.group4.data## clst ;                  \
            hdr.group4.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group8.data## clst ;                   \
            hdr.group8.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = hdr.group5.data## clst ;                   \
            hdr.group5.data## clst = tmp;                                       \
        }
    _ACTION_BIT3_010(0)
    _ACTION_BIT3_010(1)
    _ACTION_BIT3_010(2)
    _ACTION_BIT3_010(3)
    _ACTION_BIT3_010(4)
    _ACTION_BIT3_010(5)
    _ACTION_BIT3_010(6)
    _ACTION_BIT3_010(7)

    #define _ACTION_BIT3_011(clst) action cluster## clst ##_bit3_011_action() { \
            cluster## clst ##_t tmp = hdr.group3.data## clst ;                  \
            hdr.group3.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = hdr.group5.data## clst ;                   \
            hdr.group5.data## clst = tmp;                                       \
            cluster## clst ##_t tmp2 = hdr.group4.data## clst ;                 \
            hdr.group4.data## clst = hdr.group14.data## clst ;                  \
            hdr.group14.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group8.data## clst ;                  \
            hdr.group8.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = tmp2;                                      \
        }
    _ACTION_BIT3_011(0)
    _ACTION_BIT3_011(1)
    _ACTION_BIT3_011(2)
    _ACTION_BIT3_011(3)
    _ACTION_BIT3_011(4)
    _ACTION_BIT3_011(5)
    _ACTION_BIT3_011(6)
    _ACTION_BIT3_011(7)

    #define _ACTION_BIT3_100(clst) action cluster## clst ##_bit3_100_action() { \
            cluster## clst ##_t tmp = hdr.group5.data## clst ;                  \
            hdr.group5.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group8.data## clst ;                   \
            hdr.group8.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = tmp;                                       \
        }
    _ACTION_BIT3_100(0)
    _ACTION_BIT3_100(1)
    _ACTION_BIT3_100(2)
    _ACTION_BIT3_100(3)
    _ACTION_BIT3_100(4)
    _ACTION_BIT3_100(5)
    _ACTION_BIT3_100(6)
    _ACTION_BIT3_100(7)

    #define _ACTION_BIT3_101(clst) action cluster## clst ##_bit3_101_action() { \
            cluster## clst ##_t tmp = hdr.group3.data## clst ;                  \
            hdr.group3.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = hdr.group5.data## clst ;                   \
            hdr.group5.data## clst = hdr.group14.data## clst ;                  \
            hdr.group14.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group8.data## clst ;                  \
            hdr.group8.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = hdr.group4.data## clst ;                   \
            hdr.group4.data## clst = tmp;                                       \
        }
    _ACTION_BIT3_101(0)
    _ACTION_BIT3_101(1)
    _ACTION_BIT3_101(2)
    _ACTION_BIT3_101(3)
    _ACTION_BIT3_101(4)
    _ACTION_BIT3_101(5)
    _ACTION_BIT3_101(6)
    _ACTION_BIT3_101(7)

    #define _ACTION_BIT3_110(clst) action cluster## clst ##_bit3_110_action() { \
            cluster## clst ##_t tmp = hdr.group4.data## clst ;                  \
            hdr.group4.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = hdr.group5.data## clst ;                   \
            hdr.group5.data## clst = hdr.group14.data## clst ;                  \
            hdr.group14.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group8.data## clst ;                  \
            hdr.group8.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = tmp;                                       \
        }
    _ACTION_BIT3_110(0)
    _ACTION_BIT3_110(1)
    _ACTION_BIT3_110(2)
    _ACTION_BIT3_110(3)
    _ACTION_BIT3_110(4)
    _ACTION_BIT3_110(5)
    _ACTION_BIT3_110(6)
    _ACTION_BIT3_110(7)

    #define _ACTION_BIT3_111(clst) action cluster## clst ##_bit3_111_action() { \
            cluster## clst ##_t tmp = hdr.group3.data## clst ;                  \
            hdr.group3.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group6.data## clst ;                   \
            hdr.group6.data## clst = tmp;                                       \
            cluster## clst ##_t tmp2 = hdr.group4.data## clst ;                 \
            hdr.group4.data## clst = hdr.group14.data## clst ;                  \
            hdr.group14.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group8.data## clst ;                  \
            hdr.group8.data## clst = hdr.group5.data## clst ;                   \
            hdr.group5.data## clst = hdr.group13.data## clst ;                  \
            hdr.group13.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group7.data## clst ;                  \
            hdr.group7.data## clst = tmp2;                                      \
        }
    _ACTION_BIT3_111(0)
    _ACTION_BIT3_111(1)
    _ACTION_BIT3_111(2)
    _ACTION_BIT3_111(3)
    _ACTION_BIT3_111(4)
    _ACTION_BIT3_111(5)
    _ACTION_BIT3_111(6)
    _ACTION_BIT3_111(7)

    #define _ACTION_BIT6_000(clst) action cluster## clst ##_bit6_000_action() {}
    _ACTION_BIT6_000(0)
    _ACTION_BIT6_000(1)
    _ACTION_BIT6_000(2)
    _ACTION_BIT6_000(3)
    _ACTION_BIT6_000(4)
    _ACTION_BIT6_000(5)
    _ACTION_BIT6_000(6)
    _ACTION_BIT6_000(7)

    #define _ACTION_BIT6_001(clst) action cluster## clst ##_bit6_001_action() { \
            cluster## clst ##_t tmp = hdr.group6.data## clst ;                  \
            hdr.group6.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group8.data## clst ;                   \
            hdr.group8.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = tmp;                                       \
        }
    _ACTION_BIT6_001(0)
    _ACTION_BIT6_001(1)
    _ACTION_BIT6_001(2)
    _ACTION_BIT6_001(3)
    _ACTION_BIT6_001(4)
    _ACTION_BIT6_001(5)
    _ACTION_BIT6_001(6)
    _ACTION_BIT6_001(7)

    #define _ACTION_BIT6_010(clst) action cluster## clst ##_bit6_010_action() { \
            cluster## clst ##_t tmp = hdr.group7.data## clst ;                  \
            hdr.group7.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group8.data## clst ;                   \
            hdr.group8.data## clst = tmp;                                       \
        }
    _ACTION_BIT6_010(0)
    _ACTION_BIT6_010(1)
    _ACTION_BIT6_010(2)
    _ACTION_BIT6_010(3)
    _ACTION_BIT6_010(4)
    _ACTION_BIT6_010(5)
    _ACTION_BIT6_010(6)
    _ACTION_BIT6_010(7)

    #define _ACTION_BIT6_011(clst) action cluster## clst ##_bit6_011_action() { \
            cluster## clst ##_t tmp = hdr.group6.data## clst ;                  \
            hdr.group6.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = hdr.group14.data## clst ;                  \
            hdr.group14.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group8.data## clst ;                  \
            hdr.group8.data## clst = tmp;                                       \
        }
    _ACTION_BIT6_011(0)
    _ACTION_BIT6_011(1)
    _ACTION_BIT6_011(2)
    _ACTION_BIT6_011(3)
    _ACTION_BIT6_011(4)
    _ACTION_BIT6_011(5)
    _ACTION_BIT6_011(6)
    _ACTION_BIT6_011(7)

    #define _ACTION_BIT6_100(clst) action cluster## clst ##_bit6_100_action() { \
            cluster## clst ##_t tmp = hdr.group8.data## clst ;                  \
            hdr.group8.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = tmp;                                       \
        }
    _ACTION_BIT6_100(0)
    _ACTION_BIT6_100(1)
    _ACTION_BIT6_100(2)
    _ACTION_BIT6_100(3)
    _ACTION_BIT6_100(4)
    _ACTION_BIT6_100(5)
    _ACTION_BIT6_100(6)
    _ACTION_BIT6_100(7)

    #define _ACTION_BIT6_101(clst) action cluster## clst ##_bit6_101_action() { \
            cluster## clst ##_t tmp = hdr.group6.data## clst ;                  \
            hdr.group6.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group7.data## clst ;                   \
            hdr.group7.data## clst = tmp;                                       \
            cluster## clst ##_t tmp2 = hdr.group8.data## clst ;                 \
            hdr.group8.data## clst = hdr.group14.data## clst ;                  \
            hdr.group14.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = tmp2;                                     \
        }
    _ACTION_BIT6_101(0)
    _ACTION_BIT6_101(1)
    _ACTION_BIT6_101(2)
    _ACTION_BIT6_101(3)
    _ACTION_BIT6_101(4)
    _ACTION_BIT6_101(5)
    _ACTION_BIT6_101(6)
    _ACTION_BIT6_101(7)

    #define _ACTION_BIT6_110(clst) action cluster## clst ##_bit6_110_action() { \
            cluster## clst ##_t tmp = hdr.group7.data## clst ;                  \
            hdr.group7.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = tmp;                                       \
            cluster## clst ##_t tmp2 = hdr.group8.data## clst ;                 \
            hdr.group8.data## clst = hdr.group14.data## clst ;                  \
            hdr.group14.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = tmp2;                                     \
        }
    _ACTION_BIT6_110(0)
    _ACTION_BIT6_110(1)
    _ACTION_BIT6_110(2)
    _ACTION_BIT6_110(3)
    _ACTION_BIT6_110(4)
    _ACTION_BIT6_110(5)
    _ACTION_BIT6_110(6)
    _ACTION_BIT6_110(7)

    #define _ACTION_BIT6_111(clst) action cluster## clst ##_bit6_111_action() { \
            cluster## clst ##_t tmp = hdr.group6.data## clst ;                  \
            hdr.group6.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = tmp;                                       \
            cluster## clst ##_t tmp2 = hdr.group7.data## clst ;                 \
            hdr.group7.data## clst = hdr.group14.data## clst ;                  \
            hdr.group14.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group8.data## clst ;                  \
            hdr.group8.data## clst = hdr.group13.data## clst ;                  \
            hdr.group13.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = tmp2;                                     \
        }
    _ACTION_BIT6_111(0)
    _ACTION_BIT6_111(1)
    _ACTION_BIT6_111(2)
    _ACTION_BIT6_111(3)
    _ACTION_BIT6_111(4)
    _ACTION_BIT6_111(5)
    _ACTION_BIT6_111(6)
    _ACTION_BIT6_111(7)

    #define _ACTION_BIT9_000(clst) action cluster## clst ##_bit9_000_action() {}
    _ACTION_BIT9_000(0)
    _ACTION_BIT9_000(1)
    _ACTION_BIT9_000(2)
    _ACTION_BIT9_000(3)
    _ACTION_BIT9_000(4)
    _ACTION_BIT9_000(5)
    _ACTION_BIT9_000(6)
    _ACTION_BIT9_000(7)

    #define _ACTION_BIT9_001(clst) action cluster## clst ##_bit9_001_action() { \
            cluster## clst ##_t tmp = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = tmp;                                      \
        }
    _ACTION_BIT9_001(0)
    _ACTION_BIT9_001(1)
    _ACTION_BIT9_001(2)
    _ACTION_BIT9_001(3)
    _ACTION_BIT9_001(4)
    _ACTION_BIT9_001(5)
    _ACTION_BIT9_001(6)
    _ACTION_BIT9_001(7)

    #define _ACTION_BIT9_010(clst) action cluster## clst ##_bit9_010_action() { \
            cluster## clst ##_t tmp = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group15.data## clst ;                 \
            hdr.group15.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = tmp;                                      \
        }
    _ACTION_BIT9_010(0)
    _ACTION_BIT9_010(1)
    _ACTION_BIT9_010(2)
    _ACTION_BIT9_010(3)
    _ACTION_BIT9_010(4)
    _ACTION_BIT9_010(5)
    _ACTION_BIT9_010(6)
    _ACTION_BIT9_010(7)

    #define _ACTION_BIT9_011(clst) action cluster## clst ##_bit9_011_action() { \
            cluster## clst ##_t tmp = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = tmp;                                      \
            cluster## clst ##_t tmp2 = hdr.group10.data## clst ;                \
            hdr.group10.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = tmp2;                                     \
        }
    _ACTION_BIT9_011(0)
    _ACTION_BIT9_011(1)
    _ACTION_BIT9_011(2)
    _ACTION_BIT9_011(3)
    _ACTION_BIT9_011(4)
    _ACTION_BIT9_011(5)
    _ACTION_BIT9_011(6)
    _ACTION_BIT9_011(7)

    #define _ACTION_BIT9_100(clst) action cluster## clst ##_bit9_100_action() { \
            cluster## clst ##_t tmp = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group15.data## clst ;                 \
            hdr.group15.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = tmp;                                      \
        }
    _ACTION_BIT9_100(0)
    _ACTION_BIT9_100(1)
    _ACTION_BIT9_100(2)
    _ACTION_BIT9_100(3)
    _ACTION_BIT9_100(4)
    _ACTION_BIT9_100(5)
    _ACTION_BIT9_100(6)
    _ACTION_BIT9_100(7)

    #define _ACTION_BIT9_101(clst) action cluster## clst ##_bit9_101_action() { \
            cluster## clst ##_t tmp = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = tmp;                                      \
        }
    _ACTION_BIT9_101(0)
    _ACTION_BIT9_101(1)
    _ACTION_BIT9_101(2)
    _ACTION_BIT9_101(3)
    _ACTION_BIT9_101(4)
    _ACTION_BIT9_101(5)
    _ACTION_BIT9_101(6)
    _ACTION_BIT9_101(7)

    #define _ACTION_BIT9_110(clst) action cluster## clst ##_bit9_110_action() { \
            cluster## clst ##_t tmp = hdr.group10.data## clst ;                 \
            hdr.group10.data## clst = hdr.group15.data## clst ;                 \
            hdr.group15.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = tmp;                                      \
        }
    _ACTION_BIT9_110(0)
    _ACTION_BIT9_110(1)
    _ACTION_BIT9_110(2)
    _ACTION_BIT9_110(3)
    _ACTION_BIT9_110(4)
    _ACTION_BIT9_110(5)
    _ACTION_BIT9_110(6)
    _ACTION_BIT9_110(7)

    #define _ACTION_BIT9_111(clst) action cluster## clst ##_bit9_111_action() { \
            cluster## clst ##_t tmp = hdr.group9.data## clst ;                  \
            hdr.group9.data## clst = hdr.group15.data## clst ;                  \
            hdr.group15.data## clst = hdr.group12.data## clst ;                 \
            hdr.group12.data## clst = tmp;                                      \
            cluster## clst ##_t tmp2 = hdr.group10.data## clst ;                \
            hdr.group10.data## clst = hdr.group14.data## clst ;                 \
            hdr.group14.data## clst = hdr.group11.data## clst ;                 \
            hdr.group11.data## clst = hdr.group13.data## clst ;                 \
            hdr.group13.data## clst = tmp2;                                     \
        }
    _ACTION_BIT9_111(0)
    _ACTION_BIT9_111(1)
    _ACTION_BIT9_111(2)
    _ACTION_BIT9_111(3)
    _ACTION_BIT9_111(4)
    _ACTION_BIT9_111(5)
    _ACTION_BIT9_111(6)
    _ACTION_BIT9_111(7)

    #define _ACTION_BIT12_000(clst) action cluster## clst ##_bit12_000_action() {}
    _ACTION_BIT12_000(0)
    _ACTION_BIT12_000(1)
    _ACTION_BIT12_000(2)
    _ACTION_BIT12_000(3)
    _ACTION_BIT12_000(4)
    _ACTION_BIT12_000(5)
    _ACTION_BIT12_000(6)
    _ACTION_BIT12_000(7)

    #define _ACTION_BIT12_001(clst) action cluster## clst ##_bit12_001_action() { \
            cluster## clst ##_t tmp = hdr.group12.data## clst ;                   \
            hdr.group12.data## clst = hdr.group15.data## clst ;                   \
            hdr.group15.data## clst = hdr.group14.data## clst ;                   \
            hdr.group14.data## clst = hdr.group13.data## clst ;                   \
            hdr.group13.data## clst = tmp;                                        \
        }
    _ACTION_BIT12_001(0)
    _ACTION_BIT12_001(1)
    _ACTION_BIT12_001(2)
    _ACTION_BIT12_001(3)
    _ACTION_BIT12_001(4)
    _ACTION_BIT12_001(5)
    _ACTION_BIT12_001(6)
    _ACTION_BIT12_001(7)

    #define _ACTION_BIT12_010(clst) action cluster## clst ##_bit12_010_action() { \
            cluster## clst ##_t tmp = hdr.group13.data## clst ;                   \
            hdr.group13.data## clst = hdr.group15.data## clst ;                   \
            hdr.group15.data## clst = hdr.group14.data## clst ;                   \
            hdr.group14.data## clst = tmp;                                        \
        }
    _ACTION_BIT12_010(0)
    _ACTION_BIT12_010(1)
    _ACTION_BIT12_010(2)
    _ACTION_BIT12_010(3)
    _ACTION_BIT12_010(4)
    _ACTION_BIT12_010(5)
    _ACTION_BIT12_010(6)
    _ACTION_BIT12_010(7)

    #define _ACTION_BIT12_011(clst) action cluster## clst ##_bit12_011_action() { \
            cluster## clst ##_t tmp = hdr.group12.data## clst ;                   \
            hdr.group12.data## clst = hdr.group15.data## clst ;                   \
            hdr.group15.data## clst = hdr.group13.data## clst ;                   \
            hdr.group13.data## clst = hdr.group14.data## clst ;                   \
            hdr.group14.data## clst = tmp;                                        \
        }
    _ACTION_BIT12_011(0)
    _ACTION_BIT12_011(1)
    _ACTION_BIT12_011(2)
    _ACTION_BIT12_011(3)
    _ACTION_BIT12_011(4)
    _ACTION_BIT12_011(5)
    _ACTION_BIT12_011(6)
    _ACTION_BIT12_011(7)

    #define _ACTION_BIT12_100(clst) action cluster## clst ##_bit12_100_action() { \
            cluster## clst ##_t tmp = hdr.group14.data## clst ;                   \
            hdr.group14.data## clst = hdr.group15.data## clst ;                   \
            hdr.group15.data## clst = tmp;                                        \
        }
    _ACTION_BIT12_100(0)
    _ACTION_BIT12_100(1)
    _ACTION_BIT12_100(2)
    _ACTION_BIT12_100(3)
    _ACTION_BIT12_100(4)
    _ACTION_BIT12_100(5)
    _ACTION_BIT12_100(6)
    _ACTION_BIT12_100(7)

    #define _ACTION_BIT12_101(clst) action cluster## clst ##_bit12_101_action() { \
            cluster## clst ##_t tmp = hdr.group12.data## clst ;                   \
            hdr.group12.data## clst = hdr.group15.data## clst ;                   \
            hdr.group15.data## clst = hdr.group13.data## clst ;                   \
            hdr.group13.data## clst = tmp;                                        \
        }
    _ACTION_BIT12_101(0)
    _ACTION_BIT12_101(1)
    _ACTION_BIT12_101(2)
    _ACTION_BIT12_101(3)
    _ACTION_BIT12_101(4)
    _ACTION_BIT12_101(5)
    _ACTION_BIT12_101(6)
    _ACTION_BIT12_101(7)

    #define _ACTION_BIT12_110(clst) action cluster## clst ##_bit12_110_action() { \
            cluster## clst ##_t tmp = hdr.group13.data## clst ;                   \
            hdr.group13.data## clst = hdr.group15.data## clst ;                   \
            hdr.group15.data## clst = tmp;                                        \
        }
    _ACTION_BIT12_110(0)
    _ACTION_BIT12_110(1)
    _ACTION_BIT12_110(2)
    _ACTION_BIT12_110(3)
    _ACTION_BIT12_110(4)
    _ACTION_BIT12_110(5)
    _ACTION_BIT12_110(6)
    _ACTION_BIT12_110(7)

    #define _ACTION_BIT12_111(clst) action cluster## clst ##_bit12_111_action() { \
            cluster## clst ##_t tmp = hdr.group12.data## clst ;                   \
            hdr.group12.data## clst = hdr.group15.data## clst ;                   \
            hdr.group15.data## clst = tmp;                                        \
            cluster## clst ##_t tmp2 = hdr.group13.data## clst ;                  \
            hdr.group13.data## clst = hdr.group14.data## clst ;                   \
            hdr.group14.data## clst = tmp2;                                       \
        }
    _ACTION_BIT12_111(0)
    _ACTION_BIT12_111(1)
    _ACTION_BIT12_111(2)
    _ACTION_BIT12_111(3)
    _ACTION_BIT12_111(4)
    _ACTION_BIT12_111(5)
    _ACTION_BIT12_111(6)
    _ACTION_BIT12_111(7)

    #define _TABLE_MATCH(k_idx, b_idx, clst) table cluster## clst ##_bit## b_idx { \
            key = {                                                                \
                ig_md.key.code## k_idx : ternary;                                  \
            }                                                                      \
            actions = {                                                            \
                cluster## clst ##_bit## b_idx ##_000_action;                       \
                cluster## clst ##_bit## b_idx ##_001_action;                       \
                cluster## clst ##_bit## b_idx ##_010_action;                       \
                cluster## clst ##_bit## b_idx ##_011_action;                       \
                cluster## clst ##_bit## b_idx ##_100_action;                       \
                cluster## clst ##_bit## b_idx ##_101_action;                       \
                cluster## clst ##_bit## b_idx ##_110_action;                       \
                cluster## clst ##_bit## b_idx ##_111_action;                       \
            }                                                                      \
            const default_action = cluster## clst ##_bit## b_idx ##_111_action;    \
            size = 4;                                                              \
        }
    _TABLE_MATCH(0, 0, 0)
    _TABLE_MATCH(0, 0, 1)
    _TABLE_MATCH(0, 0, 2)
    _TABLE_MATCH(0, 0, 3)
    _TABLE_MATCH(0, 0, 4)
    _TABLE_MATCH(0, 0, 5)
    _TABLE_MATCH(0, 0, 6)
    _TABLE_MATCH(0, 0, 7)
    _TABLE_MATCH(1, 3, 0)
    _TABLE_MATCH(1, 3, 1)
    _TABLE_MATCH(1, 3, 2)
    _TABLE_MATCH(1, 3, 3)
    _TABLE_MATCH(1, 3, 4)
    _TABLE_MATCH(1, 3, 5)
    _TABLE_MATCH(1, 3, 6)
    _TABLE_MATCH(1, 3, 7)
    _TABLE_MATCH(2, 6, 0)
    _TABLE_MATCH(2, 6, 1)
    _TABLE_MATCH(2, 6, 2)
    _TABLE_MATCH(2, 6, 3)
    _TABLE_MATCH(2, 6, 4)
    _TABLE_MATCH(2, 6, 5)
    _TABLE_MATCH(2, 6, 6)
    _TABLE_MATCH(2, 6, 7)
    _TABLE_MATCH(3, 9, 0)
    _TABLE_MATCH(3, 9, 1)
    _TABLE_MATCH(3, 9, 2)
    _TABLE_MATCH(3, 9, 3)
    _TABLE_MATCH(3, 9, 4)
    _TABLE_MATCH(3, 9, 5)
    _TABLE_MATCH(3, 9, 6)
    _TABLE_MATCH(3, 9, 7)
    _TABLE_MATCH(4, 12, 0)
    _TABLE_MATCH(4, 12, 1)
    _TABLE_MATCH(4, 12, 2)
    _TABLE_MATCH(4, 12, 3)
    _TABLE_MATCH(4, 12, 4)
    _TABLE_MATCH(4, 12, 5)
    _TABLE_MATCH(4, 12, 6)
    _TABLE_MATCH(4, 12, 7)

    apply {
        //---stage 0
        ig_md.key.code0 = read_key_0_ra.execute(0);
        ig_md.key.code1 = read_key_1_ra.execute(0);
        ig_md.key.code2 = read_key_2_ra.execute(0);
        ig_md.key.code3 = read_key_3_ra.execute(0);
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
        ig_md.key.code4 = read_key_4_ra.execute(0);
        //---stage 2
        cluster0_bit3.apply();
        cluster1_bit3.apply();
        cluster2_bit3.apply();
        cluster3_bit3.apply();
        cluster4_bit3.apply();
        cluster5_bit3.apply();
        cluster6_bit3.apply();
        cluster7_bit3.apply();
        //---stage 3
        cluster0_bit6.apply();
        cluster1_bit6.apply();
        cluster2_bit6.apply();
        cluster3_bit6.apply();
        cluster4_bit6.apply();
        cluster5_bit6.apply();
        cluster6_bit6.apply();
        cluster7_bit6.apply();
        //---stage 4
        cluster0_bit9.apply();
        cluster1_bit9.apply();
        cluster2_bit9.apply();
        cluster3_bit9.apply();
        cluster4_bit9.apply();
        cluster5_bit9.apply();
        cluster6_bit9.apply();
        cluster7_bit9.apply();
        //---stage 5
        cluster0_bit12.apply();
        cluster1_bit12.apply();
        cluster2_bit12.apply();
        cluster3_bit12.apply();
        cluster4_bit12.apply();
        cluster5_bit12.apply();
        cluster6_bit12.apply();
        cluster7_bit12.apply();

        ig_tm_md.bypass_egress = 1w1;
    }
}