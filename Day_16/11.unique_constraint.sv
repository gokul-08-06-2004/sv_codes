//unique constraint:

class unique_constraint;
  rand int addr;
  
  constraint c1{
    addr inside {[0:100]};
    addr%2==0;
    unique{addr};
                }
endclass

module m1;
  unique_constraint u1;
  initial begin
    u1=new();
    
    for(int i=0;i<5;i++)begin
      if(u1.randomize())
        $display("addr=%0d",u1.addr);
      else
        $display("randomization is failed");
    end
  end
// # addr=68
// # addr=58
// # addr=8
// # addr=24
// # addr=84
