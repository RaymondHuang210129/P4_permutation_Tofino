#include <core.p4>
#if __TARGET_TOFINO__ == 2
#include <t2na.p4>
#else
#include <tna.p4>
#endif

#include "pipe1.p4"

#include "common/headers.p4"
#include "common/util.p4"



Pipeline(Pipe1SwitchIngressParser(),
         Pipe1SwitchIngress(),
         Pipe1SwitchIngressDeparser(),
         EmptyEgressParser(),
         EmptyEgress(),
         EmptyEgressDeparser()) pipe1;

Switch(pipe1) main;
