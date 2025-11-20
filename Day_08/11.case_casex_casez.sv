// Code your testbench here
// or browse Examples
module case_casex_casez;
  logic [7:0]a,b,op,op_x,op_z;
  logic [1:0]sel;
  
  always@(*)begin
    case(sel)
      2'b00:op=a+b;
      2'b01:op=a-b;
      default:op=8'd0;
    endcase
    $display("op=%0d",op);
  end
  
  always@(*)begin
    casex(sel)
      2'b00:op_x=a+b;
      2'b01:op_x=a-b;
      default:op_x=8'd0;
    endcase
    $display("op_x=%0d",op_x);
  end
  
  always@(*)begin
    casez(sel)
      2'b00:op_z=a+b;
      2'b01:op_z=a-b;
      default:op_z=8'd0;
    endcase
    $display("op_z=%0d \n",op_z);
  end
  
  initial begin
    
    a=8'd20;
    b=8'd10;
    
    sel=2'b00;
    $display("sel=%b",sel);
    #10;
    sel=2'b01;
    $display("sel=%b",sel);
    #10;
    sel=2'b10;
    $display("sel=%b",sel);
    #10;
    sel=2'bxx;
    $display("sel=%b",sel);
    #10;
    sel=2'bzz;
    $display("sel=%b",sel);
    
  end
endmodule
