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

// ✅ Iteration Table (Very Clear)
// Iter	num before	if(num)?	rand_mode	data randomized?	addr (randc)	post_randomize → num = addr	Printed
// 1	0	FALSE → else	rand_mode(1)	YES → say 50	0	num = 0	data=50 addr=0
// 2	0	FALSE → else	rand_mode(1)	YES → say 77	1	num = 1	data=77 addr=1
// 3	1	TRUE → if	rand_mode(0)	NO (keeps 77)	0	num = 0	data=77 addr=0
// 4	0	FALSE → else	rand_mode(1)	YES → say 120	1	num = 1	data=120 addr=1
// 5	1	TRUE → if	rand_mode(0)	NO (keeps 120)	0	num = 0	data=120 addr=0
