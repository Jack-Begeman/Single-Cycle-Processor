module SignExtender(Out64, In26, Ctrl, LSL); 
    output reg [63:0] Out64; 
    input [25:0] In26; 
    input [2:0] Ctrl; 
    input [1:0] LSL;

    reg extBit; 
    //reg [63:0] Out64; 
    //reg [25:0] In26; 
    //reg [1:0] Ctrl; 

/*
    // 00 I-type
    assign extBit = (Ctrl ? 2'b00 : In26[21]);
    assign Out64 = (Ctrl ? 2'b00 : {{52{extBit}}, In26[21:10]});

    // 01 D-type    
    assign extBit = (Ctrl ? 2'b01 : In26[20]);
    assign Out64 = (Ctrl ? 2'b01 : {{55{extBit}}, In26[20:12]});

    // 10 B-type
    assign extBit = (Ctrl ? 2'b10 : In26[25]);
    assign Out64 = (Ctrl ? 2'b10 : {{38{extBit}}, In26[25:0]});

    // 11 CB-type
    assign extBit = (Ctrl ? 2'b11 : In26[23]);
    assign Out64 = (Ctrl ? 2'b11 : {{45{extBit}}, In26[23:5]});
*/
    always@(*) begin
    case(Ctrl) 
        3'b000   :   begin
                        extBit = In26[21];
                        Out64 = {{52{extBit}}, In26[21:10]};
                        end
        3'b001   :   begin
                        extBit = In26[20];
                        Out64 = {{55{extBit}}, In26[20:12]};
                        end
        3'b010   :   begin
                        extBit = In26[25];
                        Out64 = {{38{extBit}}, In26[25:0]};
                        end
        3'b011   :   begin
                        extBit = In26[23];
                        Out64 = {{45{extBit}}, In26[23:5]};
                        end
        3'b100   :   begin
                        extBit = In26[20];
                        case(LSL)
                            2'b00   :   Out64 = {{48'b0}, In26[20:5]};
                            2'b01   :   Out64 = {{32'b0}, In26[20:5], 16'b0};
                            2'b10   :   Out64 = {{16'b0}, In26[20:5], 32'b0};
                            2'b11   :   Out64 = {In26[20:5], 48'b0};
                        endcase
                        end
        
    endcase
    end
 
endmodule
