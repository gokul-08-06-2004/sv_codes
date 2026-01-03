// Code your testbench here
// or browse Examples
//constraint probability:

class constraint_probability;
  randc bit addr;
  rand bit[3:0]data;
  
  constraint range{(addr==0)->(data==0);}
endclass

module m1;
 constraint_probability u1;
  initial begin
    u1=new();
    
    repeat(6)begin
      if(u1.randomize())
        $display("addr=%0d data=%0d",u1.addr,u1.data);
      else
        $display("randomization is fialed");
    end
  end
endmodule

// unconstraint probabilty;
class constraint_probability;
  randc bit addr;
  rand bit[2:0]data;
endclass

module m1;
 constraint_probability  u1;
  initial begin
    u1=new();
    
    repeat(15)begin
      if(u1.randomize())
        $display("addr=%0d data=%0d",u1.addr,u1.data);
      else
        $display("randomization is fialed");
    end
  end
endmodule
