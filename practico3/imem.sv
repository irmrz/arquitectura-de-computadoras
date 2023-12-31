// INSTRUCTION MEMORY

module imem #(parameter N=32)
			 (input logic [6:0] addr,
			  output logic [N-1:0] q);
			  
	/* Program: Registers X0, X1, X2, X29, X30 are reserved
	
		ADD X3, X4, X5
		STUR X3, [X0, #24] 
		SUB X3, X4, X5
		STUR X3, [X0, #32]
		SUB X4, XZR, X10
		STUR X4, [X0, #40]
		ADD X4, X3, X4
		STUR X4, [X0, #48] 
		SUB X5, X1, X3
		STUR X5, [X0, #56] 
		AND X5, X10, XZR
		STUR X5, [X0, #64] 
		AND X5, X10, X3
		STUR X5, [X0, #72] 
		AND X20, X20, X20
		STUR X20, [X0, #80]
		ORR X6, X11, XZR
		INSTRUCCION ROTA
		STUR X6, [X0, #88]
		LDUR X12, [X0, #96]
      STUR X12, [X0, #104]
		ADD x28, x28, x28     
      ADD x28, x28, x24     
      ADD x28, x28, x24     
      ADD x28, x28, x24     
      BR x28
		STUR X1, [X0, #0] 
		STUR X2, [X0, #8] 
		STUR X3, [X16, #0]
		NOP
		NOP
		NOP     
		ADD X13, XZR, XZR
loop: ADD X13, X13, X1       
      STUR X13, [X0, #112]              
      CBZ XZR, loop
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
IRS:  MRS X20, S2_0_C2_C0_0
      SUB X20, X20, X2      
      CBZ X20, Op
      ADD X29, X29, X1
      STUR X29, [X0, #136]
      ERET
Op:   ADD X30, X30, X1
      STUR X30, [X0, #144]
      MRS X21, S2_0_C0_C0_0 
      BR X21
	
	*/
	
	logic [N-1:0] ROM [0:127] = 
	'{32'h8b050083, 32'hf8018003, 32'hcb050083, 32'hf8020003, 32'hcb0a03e4, 32'hf8028004, 32'h8b040064, 32'hf8030004, 	
	  32'hcb030025, 32'hf8038005, 32'h8a1f0145, 32'hf8040005, 32'h8a030145, 32'hf8048005, 32'h8a140294, 32'hf8050014, 	
	  32'haa1f0166, 32'hffffffff, 32'hf8058006, 32'hf846000c, 32'hf806800c, 32'h8b1c039c, 32'h8b18039c, 32'h8b18039c, 	
	  32'h8b18039c, 32'hd61f0380, 32'hf8000001, 32'hf8008002, 32'hf8000203, 32'h00000000, 32'h00000000, 32'h00000000, 	
	  32'h8b1f03ed, 32'h8b0101ad, 32'hf807000d, 32'hb4ffffdf, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
	  32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
	  32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'hd5382014, 32'hcb020294, 
	  32'hb4000094, 32'h8b0103bd, 32'hf808801d, 32'hd69f03e0, 32'h8b0103de, 32'hf809001e, 32'hd5380015, 32'hd61f02a0,
	  32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
	  32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
	  32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
	  32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
	  32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
	  32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
	  32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000,
	  32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000, 32'h00000000};
	
	assign q = ROM[addr];
endmodule
