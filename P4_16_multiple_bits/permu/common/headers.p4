#ifndef _HEADERS_
#define _HEADERS_

typedef bit<48> mac_addr_t;
typedef bit<32> ipv4_addr_t;

typedef bit<32> cluster0_t;
typedef bit<32> cluster1_t;
typedef bit<32> cluster2_t;
typedef bit<16> cluster3_t;
typedef bit<16> cluster4_t;
typedef bit<16> cluster5_t;
typedef bit<16> cluster6_t;
typedef bit<16> cluster7_t;

@pa_container_size("ingress", "ethernet.dstAddr", 8, 8, 8, 8, 8, 8)
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

@pa_container_size("ingress", "group0.data0", 32) @pa_container_size("ingress", "group1.data0", 32) @pa_container_size("ingress", "group2.data0", 32) @pa_container_size("ingress", "group3.data0", 32) @pa_container_size("ingress", "group4.data0", 32) @pa_container_size("ingress", "group5.data0", 32) @pa_container_size("ingress", "group6.data0", 32) @pa_container_size("ingress", "group7.data0", 32) @pa_container_size("ingress", "group8.data0", 32) @pa_container_size("ingress", "group9.data0", 32) @pa_container_size("ingress", "group10.data0", 32) @pa_container_size("ingress", "group11.data0", 32) @pa_container_size("ingress", "group12.data0", 32) @pa_container_size("ingress", "group13.data0", 32) @pa_container_size("ingress", "group14.data0", 32) @pa_container_size("ingress", "group15.data0", 32) @pa_container_size("ingress", "group0.data1", 32) @pa_container_size("ingress", "group1.data1", 32) @pa_container_size("ingress", "group2.data1", 32) @pa_container_size("ingress", "group3.data1", 32) @pa_container_size("ingress", "group4.data1", 32) @pa_container_size("ingress", "group5.data1", 32) @pa_container_size("ingress", "group6.data1", 32) @pa_container_size("ingress", "group7.data1", 32) @pa_container_size("ingress", "group8.data1", 32) @pa_container_size("ingress", "group9.data1", 32) @pa_container_size("ingress", "group10.data1", 32) @pa_container_size("ingress", "group11.data1", 32) @pa_container_size("ingress", "group12.data1", 32) @pa_container_size("ingress", "group13.data1", 32) @pa_container_size("ingress", "group14.data1", 32) @pa_container_size("ingress", "group15.data1", 32) @pa_container_size("ingress", "group0.data2", 32) @pa_container_size("ingress", "group1.data2", 32) @pa_container_size("ingress", "group2.data2", 32) @pa_container_size("ingress", "group3.data2", 32) @pa_container_size("ingress", "group4.data2", 32) @pa_container_size("ingress", "group5.data2", 32) @pa_container_size("ingress", "group6.data2", 32) @pa_container_size("ingress", "group7.data2", 32) @pa_container_size("ingress", "group8.data2", 32) @pa_container_size("ingress", "group9.data2", 32) @pa_container_size("ingress", "group10.data2", 32) @pa_container_size("ingress", "group11.data2", 32) @pa_container_size("ingress", "group12.data2", 32) @pa_container_size("ingress", "group13.data2", 32) @pa_container_size("ingress", "group14.data2", 32) @pa_container_size("ingress", "group15.data2", 32) @pa_container_size("ingress", "group0.data3", 16) @pa_container_size("ingress", "group1.data3", 16) @pa_container_size("ingress", "group2.data3", 16) @pa_container_size("ingress", "group3.data3", 16) @pa_container_size("ingress", "group4.data3", 16) @pa_container_size("ingress", "group5.data3", 16) @pa_container_size("ingress", "group6.data3", 16) @pa_container_size("ingress", "group7.data3", 16) @pa_container_size("ingress", "group8.data3", 16) @pa_container_size("ingress", "group9.data3", 16) @pa_container_size("ingress", "group10.data3", 16) @pa_container_size("ingress", "group11.data3", 16) @pa_container_size("ingress", "group12.data3", 16) @pa_container_size("ingress", "group13.data3", 16) @pa_container_size("ingress", "group14.data3", 16) @pa_container_size("ingress", "group15.data3", 16) @pa_container_size("ingress", "group0.data4", 16) @pa_container_size("ingress", "group1.data4", 16) @pa_container_size("ingress", "group2.data4", 16) @pa_container_size("ingress", "group3.data4", 16) @pa_container_size("ingress", "group4.data4", 16) @pa_container_size("ingress", "group5.data4", 16) @pa_container_size("ingress", "group6.data4", 16) @pa_container_size("ingress", "group7.data4", 16) @pa_container_size("ingress", "group8.data4", 16) @pa_container_size("ingress", "group9.data4", 16) @pa_container_size("ingress", "group10.data4", 16) @pa_container_size("ingress", "group11.data4", 16) @pa_container_size("ingress", "group12.data4", 16) @pa_container_size("ingress", "group13.data4", 16) @pa_container_size("ingress", "group14.data4", 16) @pa_container_size("ingress", "group15.data4", 16) @pa_container_size("ingress", "group0.data5", 16) @pa_container_size("ingress", "group1.data5", 16) @pa_container_size("ingress", "group2.data5", 16) @pa_container_size("ingress", "group3.data5", 16) @pa_container_size("ingress", "group4.data5", 16) @pa_container_size("ingress", "group5.data5", 16) @pa_container_size("ingress", "group6.data5", 16) @pa_container_size("ingress", "group7.data5", 16) @pa_container_size("ingress", "group8.data5", 16) @pa_container_size("ingress", "group9.data5", 16) @pa_container_size("ingress", "group10.data5", 16) @pa_container_size("ingress", "group11.data5", 16) @pa_container_size("ingress", "group12.data5", 16) @pa_container_size("ingress", "group13.data5", 16) @pa_container_size("ingress", "group14.data5", 16) @pa_container_size("ingress", "group15.data5", 16) @pa_container_size("ingress", "group0.data6", 16) @pa_container_size("ingress", "group1.data6", 16) @pa_container_size("ingress", "group2.data6", 16) @pa_container_size("ingress", "group3.data6", 16) @pa_container_size("ingress", "group4.data6", 16) @pa_container_size("ingress", "group5.data6", 16) @pa_container_size("ingress", "group6.data6", 16) @pa_container_size("ingress", "group7.data6", 16) @pa_container_size("ingress", "group8.data6", 16) @pa_container_size("ingress", "group9.data6", 16) @pa_container_size("ingress", "group10.data6", 16) @pa_container_size("ingress", "group11.data6", 16) @pa_container_size("ingress", "group12.data6", 16) @pa_container_size("ingress", "group13.data6", 16) @pa_container_size("ingress", "group14.data6", 16) @pa_container_size("ingress", "group15.data6", 16) @pa_container_size("ingress", "group0.data7", 8, 8) @pa_container_size("ingress", "group1.data7", 8, 8) @pa_container_size("ingress", "group2.data7", 8, 8) @pa_container_size("ingress", "group3.data7", 8, 8) @pa_container_size("ingress", "group4.data7", 8, 8) @pa_container_size("ingress", "group5.data7", 8, 8) @pa_container_size("ingress", "group6.data7", 8, 8) @pa_container_size("ingress", "group7.data7", 8, 8) @pa_container_size("ingress", "group8.data7", 8, 8) @pa_container_size("ingress", "group9.data7", 8, 8) @pa_container_size("ingress", "group10.data7", 8, 8) @pa_container_size("ingress", "group11.data7", 8, 8) @pa_container_size("ingress", "group12.data7", 8, 8) @pa_container_size("ingress", "group13.data7", 8, 8) @pa_container_size("ingress", "group14.data7", 8, 8) @pa_container_size("ingress", "group15.data7", 8, 8) 
header data_group_h {
    cluster0_t data0;
    cluster1_t data1;
    cluster2_t data2;
    cluster3_t data3;
    cluster4_t data4;
    cluster5_t data5;
    cluster6_t data6;
    cluster7_t data7;
}

header key_buf_h {
    bit<32> code0;
    bit<32> code1;
    bit<32> code2;
    bit<32> code3;
    bit<32> code4;
}

struct pipe1_header_t {
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
    data_group_h group12;
    data_group_h group13;
    data_group_h group14;
    data_group_h group15;
}

struct metadata_t {
    key_buf_h key;
}

struct empty_header_t {}

struct empty_metadata_t {}

#endif /* _HEADERS_ */
