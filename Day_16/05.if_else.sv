//if else operator or implcation operator:

class if_else_operator;
  
  randc bit num;
  rand bit[7:0]data;
  rand bit[7:0]addr;
  
  constraint range{if(num==1){
                   data<=9;addr<=9;}
    else {
      data<=7;addr<=7;}}
endclass

module m1;
  if_else_operator i1;
  initial begin
    i1=new();
    for(int i=0;i<5;i++)begin
      if(i1.randomize())
        $display("num=%0d data=%0d addr=%0d",i1.num,i1.data,i1.addr);
      else
        $display("randomization is failed");
    end
  end
endmodule

// # num=0 data=7 addr=0
// # num=1 data=6 addr=9
// # num=1 data=2 addr=8
// # num=0 data=2 addr=0
// # num=0 data=5 addr=4


                   
// if else operator:
class if_else_operator;
  randc bit data;
  rand bit[7:0]addr;
  rand bit[7:0]src;
  
  constraint range{if(data==1)
  {
    addr<9;
    src<6;
  }
    else{
    addr<9;
      src<8;}}
endclass

module m1;
  if_else_operator i1;
  initial begin
    i1=new();
    for(int i=0;i<6;i++)begin
    if(i1.randomize())
      $display("data=%0d addr=%0d src=%0d",i1.data,i1.addr,i1.src);
    else
      $display("randomization is failed");
    end
  end
endmodule
                   
// // # data=1 addr=4 src=1
// // # data=0 addr=7 src=7
// // # data=0 addr=5 src=3
// // # data=1 addr=4 src=3
// // # data=1 addr=0 src=2
// // # data=0 addr=5 src=7                   
                   
// //  Multiple randc variables… only the first will behave cyclic
// // Meaning:
// // data → true cyclic (0 → 1 → 0 → 1…
// // addr & src → WILL NOT behave cyclic, they act like normal rand
// // This is expected SystemVerilog behavior.
