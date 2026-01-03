//weighted distribution:

class dist_operator;
  rand bit[7:0]addr;  
  constraint range{addr dist{2:=4,7:=6,10:=12};}
endclass

module m1;
  dist_operator d1;
  initial begin
    d1=new();
    
    for(int i=0;i<10;i++)begin
      if(d1.randomize())
        $display("addr=%0d",d1.addr);
      else
        $display("randomization is failed");
    end
  end
endmodule

//output:
// # addr=10
// # addr=10
// # addr=10
// # addr=10
// # addr=10
// # addr=7
// # addr=10
// # addr=10
// # addr=7
// # addr=10

class c1;
  rand bit[7:0]addr;
  rand bit[7:0]data;
  constraint range{addr dist{1:=10,[2:5]:=40,6:=50};data dist{2:=10,3:=40,[5:9]:=50};}
  //constraint range2{data dist{2:=10,3:=40,[5:9]:=30};}
endclass

module m1;
  c1 c;
  int i;
  initial begin
    c=new();
    i=0;
    repeat(10)begin
      if(c.randomize())begin
        $display("addr[%0d]=%0d data[%0d]=%0d",i,c.addr,i,c.data);
      i++;
    end
      else
        $display("randomization is failed");
    end
  end
endmodule 
  //output;
// # addr[0]=3 data[0]=3
// # addr[1]=4 data[1]=9
// # addr[2]=3 data[2]=6
// # addr[3]=2 data[3]=8
// # addr[4]=2 data[4]=6
// # addr[5]=4 data[5]=8
// # addr[6]=2 data[6]=5
// # addr[7]=2 data[7]=5
// # addr[8]=6 data[8]=9
// # addr[9]=3 data[9]=3
