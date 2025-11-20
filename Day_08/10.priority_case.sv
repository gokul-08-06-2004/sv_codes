module priority_case;
  
  logic [1:0]sel;
  logic [7:0]y;
  initial begin
    
    for(int i=0; i<4;i++)begin
      sel=i[1:0];
      priority case(sel)
        2'b00:y=8'h10;
        2'b01:y=8'h20;
        2'b10:y=8'h30;
        2'b11:y=8'h40;
        default:y=8'h00;
      endcase
      $display("sel=%b y=%h",sel,y);
    end
  end
endmodule
// normal case
// # sel=00 y=10
// # sel=01 y=20
// # sel=10 y=30
// # sel=11 y=40

        
module priority_case;
  
  logic [1:0]sel;
  logic [7:0]y;
  initial begin
    
    for(int i=0; i<4;i++)begin
      sel=i[1:0];
      priority case(sel)
        2'b00:y=8'h10;
        2'b01:y=8'h20;
        2'b10:y=8'h30;
//         2'b11:y=8'h40;// ** Warning: (vsim-8315) No condition is true in the unique/priority if/case statement.
//         default:y=8'h00;// because all possible choices are not declared and no default
      endcase
      $display("sel=%b y=%h",sel,y);
    end
  end
endmodule
