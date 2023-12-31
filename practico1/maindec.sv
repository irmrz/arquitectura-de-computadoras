module maindec (input logic [10:0] Op,
					 output logic Reg2Loc,
					 output logic ALUSrc,
					 output logic MemtoReg,
					 output logic RegWrite,
					 output logic MemRead,
					 output logic MemWrite,
					 output logic Branch,
					 output logic [1:0] ALUOp);
	
	logic [8:0] R_format, LDUR, STUR, CBZ;
	assign R_format = 	9'b000100010;
	assign LDUR = 		9'b011110000;
	assign STUR =		9'b110001000;
	assign CBZ = 		9'b100000101;
	 	
	always_comb
		begin
			casez (Op)
				11'b111_1100_0010 : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = LDUR;
				11'b111_1100_0000 : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = STUR;
				11'b101_1010_0??? : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = CBZ;
				11'b100_0101_1000, 11'b110_0101_1000, 11'b100_0101_0000, 11'b101_0101_0000 : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = R_format;
				default : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 9'b0;
			endcase
		end
					 
endmodule					 