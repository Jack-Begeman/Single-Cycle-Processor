module RegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);
    output [63:0] BusA;        // set the BusA output to 64 bits
    output [63:0] BusB;        // set the BusB output to 64 bits
    input [63:0] BusW;         // set the BusW output to 64 bits
    input [4:0] RW, RA, RB;    // set RW, RA, and RB inputs to 5 bits
    input RegWr;               // set input register write
    input Clk;                  // set input for clock
    reg [63:0] registers [31:0];   // set register of a 32-64 bit registers
     
    assign #2 BusA = (RA == 5'd31) ? 0 : registers[RA]; // assignment of BusA to register RA after waiting 2 time units
    assign #2 BusB = (RB == 5'd31) ? 0 : registers[RB]; // assignment of BusB to register RB after waiting 2 time units
    //initial registers[31] = 64'h0;  // initiliaze register 31 as 0
     
     /*
    always@(Clk)begin
        registers[31] <= #4 64'h0;
    end
    */
    always @ (negedge Clk) begin      // negative edge of clock to initiaite loop
        if(RegWr)                     // Check RegisterWrite is occuring
            registers[RW] <= #3 BusW;  // Access register RW and waits 3 time units, then writes BusW 
            //registers[31] <= #4 64'h0; // Ensure X31 is always 0 and waits 4 time units
    end                                // end the loop
endmodule                               // end the module
