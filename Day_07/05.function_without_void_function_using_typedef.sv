module without_void_function;
  typedef struct{
    byte a;
    byte b;
    byte y;
  }packet;
   packet result;

  function packet add(input byte a,b);
    add.a=a;
    add.b=b;
    add.y=a+b;
    return add;
  endfunction
  initial begin
    result=add(4,3);
    $display("a=%0d b=%0d result=%0d",result.a,result.b,result.y);
  end
endmodule
---------------------------------------------------------------
module with_out_void_function;
  typedef struct{
    byte a;
    byte b;
    byte y;
  }sum;
  
  sum add;
  function byte add_sum(input logic[7:0]a,b);
    
    add.a=a;
    add.b=b;
    add.y=a+b;
    return add.y;
    
  endfunction
  
  initial begin
    byte out;
    out=add_sum(4,3);
    $display("out=%0d",out);
  end
endmodule
