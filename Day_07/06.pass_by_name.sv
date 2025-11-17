module pass_by_name_typedef;
  
  typedef struct{
    logic [7:0]a;
    logic [7:0]b;
    logic [7:0]y;
  }packet;
  
  packet result;
  function packet mul(input logic[7:0]a,b);
    mul.a=a;
    mul.b=b;
    mul.y=a*b;
    return mul;
    
  endfunction
  initial begin
    result.a=10;
    result.b=2;
    result=mul(.a(result.a),.b(result.b));
    $display("a=%0d b=%0d result=%0d",result.a,result.b,result.y);
  end
endmodule

-------------------------------------------------------------------------
module pass_by_name;
  function int out(input int a,b);
    out = a*b;
    return out;
  endfunction
  
  initial begin
    int result;
    int a=2;
    int b=3;
    result=out(.a(a),.b(b));
    $display("a=%0d b=%0d result=%0d",a,b,result);
    a=3;b=10;
    result=out(.a(a),.b(b));
     $display("a=%0d b=%0d result=%0d",a,b,result);
  end
endmodule
