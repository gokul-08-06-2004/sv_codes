class car;
  rand bit[7:0]data;
  rand bit[7:0]addr;
endclass
module m1;
  car c1;
  initial begin
    c1=new();
    for(int i=0;i<5;i++)begin
      if(c1.randomize())begin
        $display("data=%0d | addr=%0d",c1.data,c1.addr);
      end
      else begin
        $display("randomized can be failed");
      end
    end
  end
endmodule

// What is void' casting?
// In SystemVerilog, randomize() returns an int:
// 1 → randomization success
// 0 → randomization failed

// But in your code, you are not using this return value.
// If you simply write:
// randc_handle.randomize();

// many simulators give a warning:
// “function return value is ignored”

// So we tell the compiler:
// 👉 “I know this returns a value… but I want to ignore it”
// That is done using void cast:
// void'(randc_handle.randomize());

// This means:
// run randomize()
// discard its return value
// do not show warning
// treat it like a task (no return)
// 🎯 Simple Meaning
// void' = ignore the return value safely

// Example USING return (NO void cast needed)
// Here we check randomize() return value, so we don’t use void'.

class bike;
  rand bit[7:0]duke;
  rand bit[7:0]r15;
endclass

module m1;
  bike b1;
  initial begin
    b1=new();
    b1.randomize();
    $display("duke=%0d r15=%0d",b1.duke,b1.r15);
  end
endmodule

// 2️⃣ Example IGNORING return value (must use void')
// Here we do not check success/failure.
// So we MUST use void cast to suppress warning.

class truck;
  rand bit [7:0]lambogini;
  rand bit [7:0]tata;
  rand bit [7:0]ashok;
  function void post_randomize();
    $display("lambo=%0d tata=%0d ashok=%0d",lambogini,tata,ashok);
  endfunction
endclass

module m1;
  truck t1;
  initial begin
    t1=new();
    for(int i=0;i<4;i++)begin 
    void'(t1.randomize());
    end
  end
endmodule

// # lambo=235 tata=183 ashok=106
// # lambo=161 tata=98 ashok=91
// # lambo=140 tata=34 ashok=179
// # lambo=37 tata=70 ashok=11



randc 

class section;
  randc bit[3:0]a;
  randc bit[3:0]b;
endclass

module m1;
  section s1;
  initial begin
    s1=new();
    for(int i=0;i<20;i++)begin 
     s1.randomize();
     $display("a=%0d b=%0d",s1.a,s1.b);
    end
  end
endmodule
// # a=3 b=4
// # a=8 b=13
// # a=7 b=10
// # a=10 b=1
// # a=5 b=9
// # a=14 b=14
// # a=6 b=6
// # a=2 b=11
// # a=0 b=12
// # a=13 b=15
// # a=4 b=3
// # a=15 b=0
// # a=12 b=8
// # a=11 b=7
// # a=1 b=5
// # a=9 b=2
// # a=7 b=8
// # a=12 b=11
// # a=4 b=0
// # a=11 b=3
