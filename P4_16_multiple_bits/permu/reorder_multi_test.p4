#include <core.p4>
#if __TARGET_TOFINO__ == 2
#include <t2na.p4>
#else
#include <tna.p4>
#endif

#include "pipe_encode.p4"
#include "pipe_pktgen.p4"

#include "common/headers.p4"
#include "common/util.p4"



Pipeline(Pipe1SwitchIngressParser(),
         Pipe1SwitchIngress(),
         Pipe1SwitchIngressDeparser(),
         EmptyEgressParser(),
         EmptyEgress(),
         EmptyEgressDeparser()) pipe_encode;

Pipeline(PktgenSwitchIngressParser(),
         PktgenSwitchIngress(),
         PktgenSwitchIngressDeparser(),
         EmptyEgressParser(),
         EmptyEgress(),
         EmptyEgressDeparser()) pipe_pktgen;

Switch(pipe_encode, pipe_pktgen) main;
