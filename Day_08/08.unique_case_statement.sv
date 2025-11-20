// normal case
module normal_case;//
  logic [1:0]sel;
  bit [7:0]y;
       
       initial begin
         
         for(int i=0;i<4;i++)begin
           sel=i[1:0];
           case(sel)
             2'b00:y=8'ha0;
             2'b01:y=8'hbb;
             2'b10:y=8'haa;
             2'b11:y=8'hbc;
             default:y=8'h00;
           endcase
           $display("sel=%b y=%h",sel,y);
         end
       end
       endmodule

//non of condition is true
module unique_case;
  logic [1:0]sel;
  bit [7:0]y;
  
  initial begin
    
    for(int i=0;i<4;i++)begin
      sel=i[1:0];
      unique case(sel)
//             2'b00:y=8'ha0;
             2'b01:y=8'hbb;
             2'bx1:y=8'h23;
             2'b10:y=8'haa;//** Warning: (vsim-8315) No condition is true in the unique/priority if/case statement.
//              2'b11:y=8'hbc;
           //  default:y=8'h00;
           endcase
           $display("sel=%b y=%h",sel,y);
         end
       end
       endmodule

//unique0 

module unique0_case;
  logic [1:0]sel;
  bit [7:0]y;
  
  initial begin
    
    for(int i=0;i<4;i++)begin
      sel=i[1:0];
      unique0 case(sel)
//             2'b00:y=8'ha0;
             2'b01:y=8'hbb;
             2'bx1:y=8'h23;
             2'b10:y=8'haa;// no  warning the run time warning is observed
//              2'b11:y=8'hbc;
           //  default:y=8'h00;
           endcase
           $display("sel=%b y=%h",sel,y);
         end
       end
       endmodule
