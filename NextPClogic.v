module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch); 
   input [63:0] CurrentPC, SignExtImm64;    // state your input at 64 bits for currentPC and sign extender
   input 	Branch, ALUZero, Uncondbranch;   // state your inputs for the Branch, ALU, and unconditional branch
   output reg [63:0] NextPC;                 // register output for NextPC as 64 bits

   

   /* write your code here */ 
   always@(*) begin
      if((Branch == 1'b1) && (ALUZero == 1'b1)) begin   // check that Branch and ALU are 1 or ON
         NextPC = CurrentPC + (SignExtImm64 <<< 2);                   // shift NextPC with sign extender by 2 to the left
      end else if(Uncondbranch == 1'b1) begin           // otherwise Undonditional branch is ON
         NextPC = CurrentPC + (SignExtImm64 <<< 2);                   // complete the sign extend shift left by 2   
      end else begin
         NextPC = CurrentPC + 4;                        // otherwise it can only set the NextPC to the next one from CurrentPC
      end

   end                                                  // end the loop


endmodule                                               // endmodule  
