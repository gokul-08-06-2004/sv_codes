class bike;
  //string name;
  rand int data;
  randc bit addr;
   bit num;
 
  function void pre_randomize();
    if(num)
    data.rand_mode(0);
    else 
    data.rand_mode(1);
  endfunction
  
  function void post_randomize();
    num=addr;
    $display("data=%0d addr=%0d",data,num);
  endfunction
endclass

module m1;
  bike b1;
  initial begin
    b1=new();
    repeat(5)begin
    b1.randomize();
    end
    //$display("name=%s num=%0d addr=%0d data=%0d",name,num,addr,data);
  end
endmodule
// # data=-703950114 addr=0
// # data=-1752409002 addr=1
// # data=-1752409002 addr=0
// # data=-4315301 addr=1
// # data=-4315301 addr=1

// This function rns before randomization happens.
// if(num==1)
// If pevious operation was WRITE (addr=1)
// Then:
// data.rand_mode(0)
// ➜ Means disable randomization of addr
// ➜ addr will keep previous value
// else
// If previous operation was READ (addr==0)
// Then:
// data.rand_mode(1);
// ➜ Enable addr randomization normally 
// Simple Meaning
// Previous addr	Action now
// 1 (Write)	Do NOT randomize data
// 0 (Read)	Randomize data
