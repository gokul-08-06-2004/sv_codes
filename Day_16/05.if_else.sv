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
