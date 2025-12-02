class classA #(parameter type T=bit[2:0],parameter int WIDTH=2);
  bit[WIDTH:0]addr;
  T data;
  
  function new(bit[WIDTH:0]addr,T data);
    this.addr=addr;
    this.data=data;
  endfunction
endclass

class classB#(parameter type T=bit[2:0],parameter int WIDTH=2);
  bit[WIDTH:0]s_addr;
  T s_data;
  classA #(bit[7:0],7)ad_r;//override paramter for classA
  
  function new(bit[WIDTH:0]s_addr,T s_data);
    this.s_addr=s_addr;
    this.s_data=s_data;
    this.ad_r=new(34,35);
  endfunction
  
  function void display();
    $display("addr=%0d \ndata=%0d \ns_addr=%0d \ns_data=%0d",this.ad_r.addr,this.ad_r.data,this.s_addr,this.s_data);
    $display("\n");
    endfunction
endclass

module parameterized_class_and_type_in_shallow_copy;
  classB #(bit[7:0],7) c1,c2;//override parameter for classB 
  
  initial begin
    c1=new(34,35);
    
    c1.display();
    c2=new c1;
    c2.display();
    c2.s_addr=20;
    c2.ad_r.addr=40;
    c2.ad_r.data=50;
     c1.display();
     c2.display();
  end
endmodule
//   # addr=34 
// # data=35 
// # s_addr=34 
// # s_data=35
// # 
// # 
// # addr=34 
// # data=35 
// # s_addr=34 
// # s_data=35
// # 
// # 
// # addr=40 
// # data=50 
// # s_addr=34 
// # s_data=35
// # 
// # 
