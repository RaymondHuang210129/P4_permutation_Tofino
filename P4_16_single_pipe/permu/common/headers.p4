#ifndef _HEADERS_
#define _HEADERS_

typedef bit<48> mac_addr_t;
typedef bit<32> ipv4_addr_t;

header ethernet_h {
    mac_addr_t dstAddr;
    mac_addr_t srcAddr;
    bit<16> ethertype;
}

header ipv4_h {
    bit<4> version;
    bit<4> ihl;
    bit<8> diffserv;
    bit<16> totalLen;
    bit<16> identification;
    bit<3> flags;
    bit<13> fragOffset;
    bit<8> ttl;
    bit<8> protocol;
    bit<16> hdrChecksum;
    ipv4_addr_t srcAddr;
    ipv4_addr_t dstAddr;
}

header udp_h {
    bit<16> src_port;
    bit<16> dst_port;
    bit<16> len;
    bit<16> checksum;
}

header data_group_h {
    bit<16> data0;
    bit<16> data1;
    bit<16> data2;
    bit<16> data3;
    bit<16> data4;
    bit<16> data5;
    bit<32> data6;
    bit<32> data7;
}

header key_buf_h {
    bit<32> code0;
    bit<32> code1;
    bit<32> code2;
}

header data_buf_h {
    bit<16> data0;
    bit<16> data1;
    bit<16> data2;
    bit<16> data3;
    bit<16> data4;
    bit<16> data5;
    bit<32> data6;
    bit<32> data7;
}

struct header_t {
    ethernet_h ethernet;
    ipv4_h ipv4;
    udp_h udp;
    data_group_h group0;
    data_group_h group1;
    data_group_h group2;
    data_group_h group3;
    data_group_h group4;
    data_group_h group5;
    data_group_h group6;
    data_group_h group7;
    data_group_h group8;
    data_group_h group9;
    data_group_h group10;
    data_group_h group11;
}

struct metadata_t {
    key_buf_h key;
    data_buf_h buff;
}

struct empty_header_t {}

struct empty_metadata_t {}

#endif /* _HEADERS_ */
