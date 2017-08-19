LABNAME = Design and analysis of single cycle, multi-cyle and pipelined multiplier circuits.
SHORTNAME = Mult 
SMOKENAME = Mult 

## Default simulator is iverilog
VSIM = -vsim iverilog

.PHONY: help
help:
	@echo "Lab: $(LABNAME)"
	@echo "Useful targets:"
	@echo "single -- Builds the single cycle circuit."
	@echo "multi -- Builds the multi cycle circuit."
	@echo "pipe -- Builds the pipelined circuit."
	@echo "  clean          --  remove intermediate files"
	@echo "  help           --  display this message"

#.PHONY: single
cla: claIF.bsv cla.bsv claTb.bsv
	@echo "Compiling into verilog files"
	bsc -verilog -u claTb.bsv	
	@echo "Generting the simulation object"
	bsc -verilog -e  mkclaTb -o claTb.bsim


.PHONY: clean
clean:
	@rm -f *.bi *.bo *.ba mk*.c mk*.h mk*.o mk*.v *_c *_v *.vcd *~ *.fsdb *.log *.bsim