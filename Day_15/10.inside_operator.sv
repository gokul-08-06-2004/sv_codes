//using inside operator:

class inside_constraint;
  rand bit[7:0]start_addr;
  rand bit[7:0]end_addr;
  rand bit[7:0]addr; 

  constraint range{start_addr>2;start_addr<8;}
  constraint range1{end_addr>3;end_addr<6;}
  constraint range2{addr inside {[start_addr:end_addr]};}
  
endclass

module m1;
  inside_constraint i1;
  initial begin
    i1=new();
    for(int i=0;i<5;i++)begin
      if(i1.randomize())
      $display("start_addr = %0d end_Addr=%0d addr=%0d",i1.start_addr,i1.end_addr,i1.addr);
      else
        $display("randomization is failed");
    end
    
  end
endmodule

// # start_addr = 3 end_Addr=4 addr=3
// # start_addr = 4 end_Addr=4 addr=4
// # start_addr = 5 end_Addr=5 addr=5
// # start_addr = 3 end_Addr=4 addr=4
// # start_addr = 4 end_Addr=5 addr=5
