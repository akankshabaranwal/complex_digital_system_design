package claTb;



import claIF::*;
import cla::*;


Cin notestinputs = 6;

(* synthesize *)
module mkclaTb (Empty);

   Reg#(int) cycle <- mkReg(0);
   Reg#(Cin) x    <- mkReg(12);
   Reg#(Cin) y    <- mkReg(13);
   
   // The dut
   ClaIFC dut <- mkcla;
   
   // RULES ----------------
   rule cyclecount;
   	$display("------Cycle %0d------", cycle);
   	cycle <= cycle + 1;
   endrule 
   
   rule rule_tb_1 ( (x-12) < notestinputs);
      $display("Rule tb1 fired");
      $display ("Test Input: x = %0d, y = %0d", x, y);
      let z = dut.cladder (x, y);
      $display("  %0d + %0d   = %0d ", x,y,z);
      
      x <= x + 1;
      y <= y + 1;
   endrule

   rule stop ((x-12) >= notestinputs);
       $display("\t finish");
       $finish(0);
   endrule
      
   
endmodule 

endpackage