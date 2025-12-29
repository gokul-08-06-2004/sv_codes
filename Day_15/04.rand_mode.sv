class packet;
  rand bit[7:0]data;
  rand bit[7:0]addr;
  rand bit[7:0]src;
  bit parity;
  
  
  function void pre_randomize();
  $display("data=%0d addr=%0d src=%0d parity=%0d",data,addr,src,parity);
  endfunction
  
  function  void post_randomize();
    parity=^data;
    $display("data=%0d addr=%0d src=%0d parity=%0d",data,addr,src,parity);
  endfunction
endclass

module m1;
  packet p1;
  initial begin
    p1=new();
    
    repeat(5)begin
      p1.randomize();
    end
    
    $display("-----------------------------------------");
    p1.data=8;
    p1.data.rand_mode(0);
    p1.randomize();
    $display("-----------------------------------------");
    p1.data=8;
    p1.data.rand_mode(1);
    p1.randomize();
    
  end
endmodule

class packet;
  rand bit [7:0]data;
  rand bit [7:0]addr;
endclass

class frame;
  rand bit [7:0]data[10];
  rand bit [7:0]addr[10];
  
//   function void pre_randomize();
//     packet p1=new();
    
//     foreach(data[i])begin
//       p1.randomize();
//       data[i]=p1.data;
//       $display("data[%0d]=%0d ",i,data[i]);
//     end
    
//     foreach(addr[i])begin
//       p1.randomize();
//       addr[i]=p1.addr;
//       $display("addr[%0d]=%0d ",i,addr[i]);
//     end
  function void pre_randomize();
    packet p1=new();
    
    foreach(data[i])begin
      p1.randomize();
      data[i]=p1.data;
      addr[i]=p1.addr;
      $display("data[%0d]=%0d addr[%0d]=%0d",i,data[i],i,addr[i]);
    end
  endfunction
endclass

module m1;
  frame f1;
  initial begin
    f1=new();
    assert(f1.randomize())
   // f1.randomize();
      //$display("randomization process started ");
    else 
      $display("randomize failed");
  end
endmodule
