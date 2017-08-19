package cla;

import claIF::*;

(* synthesize *)
module mkcla ( ClaIFC );
	function Bit#(TAdd#(w,1)) addN(Bit#(w) val1,Bit#(w) val2);
		Bit#(1) c0=0;
		Bit#(w) sum;
		Bit#(w) p;
		Bit#(w) g;
		Bit#(1) c1;
		Bit#(1) tempP;
		Bit#(1) tempG;
		let valw = valueOf(w);
		for(Integer i=0;i<valw;i=i+1)
			begin
			p[i]=val1[i]^val2[i];
			g[i]=val1[i]&val2[i];
			end

		for(Integer i=0;i<valw;i=i+1)
			begin
			tempG=0;
			for(Integer k=0;k<=i-1;k=k+1)
				begin
				tempP=1;
				for(Integer j=k+1;j<=i-1;j=j+1)
					begin
					tempP=tempP&p[j];
					end
				tempP=tempP&g[k];
				tempG=tempG|tempP;
				end
			tempP=1;	
			for(Integer j=0;j<=i-1;j=j+1)
				begin
				tempP=tempP&p[j];
				end				
			tempP=tempP&c0;
			sum[i]=val1[i]^val2[i]^(tempG|tempP);
			end
			c1=tempG|tempP;
			return {c1,sum};
	endfunction

	function Cout add4(Cin num1, Cin num2)=addN( num1, num2);
	method Cout cladder(Cin num1,Cin num2);
		return add4(num1,num2);
	endmethod
endmodule
endpackage