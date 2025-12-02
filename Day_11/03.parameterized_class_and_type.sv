class FIFO #(parameter 	WIDTH=4);
  int mem[WIDTH];
  
  function void display();
    $display("mem[%0d]",WIDTH);
  endfunction
endclass

module m1;
 FIFO f1=new();
   FIFO #(8) f2=new();
  initial begin
    f1.display();
    f2.display();
    $display("\n");
  end
endmodule

//override the type and size
class FIFO #(parameter type T=int,parameter int WIDTH=7);
  bit [WIDTH:0]addr;
  T data;
  
  function new(bit [WIDTH:0]addr,T data);
   this.addr=addr;
   this.data=data;
  endfunction
  function void display();
    $display("addr=%0d data=%0d",this.addr,this.data);
  endfunction
endclass

module m1;
  FIFO f1=new(34,35);
  FIFO #(bit[7:0]) f2=new(34,36);
  initial begin
    f1.display();
    f2.display();
  end
endmodule


