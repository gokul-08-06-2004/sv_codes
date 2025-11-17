module void_function__typedef;
  
  typedef struct{
    logic [7:0]a;
    logic [7:0]b;
    logic [7:0]y;
  }packet;
  
  packet p;
  
  function void add(input logic[7:0]a,b,output packet data_out);
    data_out.a=a;
    data_out.b=b;
    data_out.y=a+b;
    $display("a=%0d b=%0d y=%0d",data_out.a,data_out.b,data_out.y);
  endfunction
  
  initial begin
    add(2,4,p);
  end
endmodule
-----------------------------------------------------------------------------
module void_function;
  function  void compare(input int a,b);
    
    if(a>b)
      $display("a=%0d is greater than b=%0d",a,b);
    else if(a<b)
      $display("a=%0d is less than b=%0d",a,b);
    else
      $display("a=%0d is equal to b=%0d",a,b);
  endfunction
  
  initial begin
    compare(2,2);
    compare(10,2);
    compare(2,10);
  end
endmodule

