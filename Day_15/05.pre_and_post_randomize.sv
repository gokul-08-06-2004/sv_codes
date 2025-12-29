// pre_randomize and post randomize:

// 🔄 Simple Timeline Example (repeat 4)
// Assume randc sequence: 0 → 1 → 0 → 1
// Iteration	tmp_wr_rd before	addr.rand_mode	wr_rd generated	tmp_wr_rd updated
// 1	0	enabled	0	0
// 2	0	enabled	1	1
// 3	1	disabled	0	0
// 4	0	enabled	1	1
// So yes — previous value is always 0 or 1, and that is intentional 👍

class frame;
  rand bit[7:0]data;
  randc bit addr;
  bit src;
  
  function void pre_randoomize();
    if(src==1)
      data.rand_mode(0);
    else
      data.rand_mode(1);
  endfunction
  
  function void post_randomize();
    src=addr;
    $display("data=%0d addr=%0d",data,addr);
  endfunction
endclass

module m1;
  frame f1;
  initial begin
    f1=new();
    
    repeat(3)begin
      f1.randomize();
    end
  end
endmodule
  
// # data=96 addr=0
// # data=33 addr=1
// # data=33 addr=0
// # data=207 addr=1
