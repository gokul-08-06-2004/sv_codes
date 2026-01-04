// Code your testbench here
// or browse Examples
//inline constriant:

class inline_constraint;
  rand bit[7:0]addr;
  rand bit[7:0]data;
endclass

module m1;
  inline_constraint i1;
  initial begin
    i1=new();
    
    for(int i=0;i<5;i++)begin
      void'(i1.randomize()with{addr inside {[0:5]};
                               data>2;data<10;});
      $display("addr[%0d]=%0d data[%0d]=%0d",i,i1.addr,i,i1.data);
    end
  end
endmodule

// # addr[0]=1 data[0]=3
// # addr[1]=5 data[1]=4
// # addr[2]=5 data[2]=8
// # addr[3]=2 data[3]=9
// # addr[4]=2 data[4]=5

//inline constraint along with class constraint

class inline_constraint;
  rand int src;
  rand int dst;
  
  constraint c1{src>2;src<20;
                dst dist{2:=40,3:=15,[4:6]:=80};}
endclass

module m1;
  inline_constraint i1;
  initial begin
    i1=new();
    
    for(int i=0;i<4;i++)begin
      void'(i1.randomize()with{src inside {[0:5]};
                               dst inside {[0:5]};});
      $display("src=%0d dst=%0d",i1.src,i1.dst);
    end
  end
endmodule
// # src=4 dst=5
// # src=4 dst=4
// # src=5 dst=3
// # src=5 dst=4

//inline conflict:
class inline_constraint;
  rand int src;
  rand int dst;
  
  constraint c1{src>2;src<20;
                dst dist{2:=40,3:=15,[4:6]:=80};}
endclass

module m1;
  inline_constraint i1;
  int check;
  initial begin
    i1=new();
    
    for(int i=0;i<5;i++)begin
      check=i1.randomize() with {src<2;src>20;
                                 dst dist{2:/40,3:/15,[4:6]:/80};};
      
      if(check)
        $display("src=%0d dst=%0d",i1.src,i1.dst);
      else
        $display("randomization is failed due to conflict src=%0d dst=%0d",i1.src,i1.dst);
    end
  end
endmodule

//# randomization is failed due to conflict src=0 dst=0


//iteration inline constriant:

class inline_constraint;
  rand bit[4:0]addr;
  rand bit[4:0]data;
  
  constraint c1{addr<10;
                data<20;}
endclass

module m1;
  inline_constraint i1;
  initial begin
    i1=new();
    
    for(int i=0;i<30;i++)begin
      if(i<=24)begin
        i1.randomize();
      end
      else begin
        i1.c1.constraint_mode(0);
        i1.randomize()with{addr inside {[11:20]};
                            data inside {[21:30]};};
        i1.c1.constraint_mode(1);
      end
      $display("addr[%0d]=%0d data[%0d]=%0d",i,i1.addr,i,i1.data);
    end
  end
endmodule

// Why This Fails?
// Look at the numeric ranges.
// For addr
// Class constraint says → 0 to 9
// Inline constraint says → 11 to 20
// These sets do not overlap.
// 0–9   ❌ no common values ❌   11–20
// So no value exists that satisfies both.
// Same for data  What the Solver Does Internally
// The constraint solver tries something like
// Find a value X such that:
// X < 10  AND  X ∈ [11..20]
// It mathematically checks:
// Is there ANY number that is less than 10 AND between 11 and 20?
// Answer → No
// So solver stops and reports failure.
// 0–19  ❌ no common values ❌  21–30
// No common solution → UNSATISFIABLE constraint set
//     What the Solver Does Internally
// The constraint solver tres something like:
// Find a value X such that:
// X < 10  AND  X ∈ [11..20]
// It mathematically checks:
// Is there ANY number that is less than 10 AND between 11 and 20?

// Answer → No
// So solver stops and reports failure.
