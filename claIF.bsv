package claIF;

typedef Bit#(4) Cin;
typedef Bit#(5) Cout;

interface ClaIFC;
	method Cout cladder(Cin num1,Cin num2);
endinterface

endpackage