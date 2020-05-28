#include <core.p4>
#if __TARGET_TOFINO__ == 2
#include <t2na.p4>
#else
#include <tna.p4>
#endif

#include "pipe1.p4"
#include "pipe2.p4"
#include "pipe3.p4"
#include "pipe4.p4"

#include "common/headers.p4"
#include "common/util.p4"



Pipeline(Pipe1SwitchIngressParser(),
         Pipe1SwitchIngress(),
         Pipe1SwitchIngressDeparser(),
         EmptyEgressParser(),
         EmptyEgress(),
         EmptyEgressDeparser()) pipe1;

Pipeline(Pipe2SwitchIngressParser(),
         Pipe2SwitchIngress(),
         Pipe2SwitchIngressDeparser(),
         EmptyEgressParser(),
         EmptyEgress(),
         EmptyEgressDeparser()) pipe2;

Pipeline(Pipe3SwitchIngressParser(),
         Pipe3SwitchIngress(),
         Pipe3SwitchIngressDeparser(),
         EmptyEgressParser(),
         EmptyEgress(),
         EmptyEgressDeparser()) pipe3;

Pipeline(Pipe4SwitchIngressParser(),
         Pipe4SwitchIngress(),
         Pipe4SwitchIngressDeparser(),
         EmptyEgressParser(),
         EmptyEgress(),
         EmptyEgressDeparser()) pipe4;

Switch(pipe1, pipe2, pipe3, pipe4) main;
