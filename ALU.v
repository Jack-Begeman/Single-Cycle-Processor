`define AND   4'b0000
`define OR    4'b0001
`define ADD   4'b0010
`define SUB   4'b0110
`define PassB 4'b0111


module ALU(BusW, BusA, BusB, ALUCtrl, Zero);
    
    output  [63:0] BusW;
    input   [63:0] BusA, BusB;
    input   [3:0] ALUCtrl;
    output  Zero;
    
    reg     [63:0] BusW;
    reg     Zero;
    
    always @(ALUCtrl or BusA or BusB) begin
        case(ALUCtrl)
            `AND: begin
                BusW = BusA & BusB;   
            end
            `OR: begin
                BusW = BusA | BusB;
            end
            `ADD: begin
                BusW = BusA + BusB;
                 //$display("%h + %h = %h",BusA,BusB, BusW);
            end
            `SUB: begin
                BusW = BusA - BusB;
            end
            `PassB: begin
                BusW = BusB;
            end
        endcase
        
        if(BusW == 0) begin
            Zero = 1;
        end else begin
            Zero = 0;
        end
            
    end

endmodule
