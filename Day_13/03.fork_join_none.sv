// fork_join_none:

class tasks;
  int addr;
  int data;
  
  task simple();
    $display("time=%0t task starting",$time);
    $display("time=%0t task processes",$time);
    
    fork
      begin 
        for(int i=0;i<2;i++)begin
          data=10;
          $display("time=%0t task A finished data=%0d",$time,data);
          #i;
          $display("time=%0t task A1 finished data=%0d",$time,data);
        end
      end
      
      begin 
        for(int i=2;i<4;i++)begin
          addr=20;
          $display("time=%0t task B finished addr=%0d",$time,addr);
          #i;
          $display("time=%0t task B1 finished addr=%0d",$time,addr);
        end
      end
      
      begin
        for(int i=4;i<6;i++)begin
          data=30;data=50;
          $display("time=%0t task c finished data=%0d addr=%0d",$time,data,addr);
          #i;
          $display("time=%0t task c1 finished data=%0d addr=%0d",$time,data,addr);
        end
      end
      
    join_none
    $display("main thread continued");
    $display("another main thread continued");
    
  endtask
endclass

module m1;
  tasks t1;
  initial begin
    t1=new();
    t1.simple();
  end
endmodule

// first output:
// # time=0 task starting
// # time=0 task processes
// # time=0 task A finished
// # time=0 task B finished
// # time=0 task c finished
// # time=0 task A1 finished
// # time=0 task A finished
// # time=1 task A1 finished
// # time=2 task B1 finished
// # time=2 task B finished
// # time=4 task c1 finished
// # time=4 task c finished
// # time=5 task B1 finished
// # time=9 task c1 finished
    
//second output:// normal fork join
// # time=0 task starting
// # time=0 task processes
// # time=0 task A finished data=10
// # time=0 task B finished addr=20
// # time=0 task c finished data=50 addr=20
// # time=0 task A1 finished data=50
// # time=0 task A finished data=10
// # time=1 task A1 finished data=10
// # time=2 task B1 finished addr=20
// # time=2 task B finished addr=20
// # time=4 task c1 finished data=10 addr=20
// # time=4 task c finished data=50 addr=20
// # time=5 task B1 finished addr=20
// # time=9 task c1 finished data=50 addr=20

//thread a
// for (int i = 0; i < 2; i++) begin
//   data = 10;
//   $display("time=%0t task A finished data=%0d", $time, data);
//   #i;
//   $display("time=%0t task A1 finished data=%0d", $time, data);
// end
// Iteration breakdown:
// Iteration 0
// i = 0

// First print → at time 0

// Delay → #0 → no delay

// Second print → still time 0

// Iteration 1
// i = 1

// First print → still at time 0
// (Because assignments and prints happen instantly)

// Delay → #1 → advances to time 1

// Second print → at time 1

// ✔ Final times for A1:
// sql
// Copy code
// A1 at time 0 (from i = 0)
// A1 at time 1 (from i = 1)



//thread 2
// for (int i = 2; i < 4; i++) begin
//   addr = 20;
//   $display("time=%0t task B finished addr=%0d", $time, addr);
//   #i;
//   $display("time=%0t task B1 finished addr=%0d", $time, addr);
// end
// Iteration breakdown:
// Iteration 0
// i = 2

// First print → time 0

// Delay → #2 → advances to time 2

// Second print → time 2

// Iteration 1
// i = 3

// After previous delay, time = 2

// First print → at time 2

// Delay → #3 → moves to time 5

// Second print → time 5

// ✔ Final times for B1:
// sql
// Copy code
// B1 at time 2 (from i = 2)
// B1 at time 5 (from i = 3)


// thread 3
// for (int i = 4; i < 6; i++) begin
//   data = 30; 
//   data = 50;
//   $display("time=%0t task c finished data=%0d addr=%0d", $time, data, addr);
//   #i;
//   $display("time=%0t task c1 finished data=%0d addr=%0d", $time, data, addr);
// end
// Iteration breakdown:
// Iteration 0
// i = 4

// First print → time 0

// Delay → #4 → moves to time 4

// Second print → time 4

// Iteration 1
// i = 5

// After last delay → time = 4

// First print → time 4

// Delay → #5 → moves to time 9

// Second print → time 9

// ✔ Final times for C1:
// sql
// Copy code
// C1 at time 4 (from i = 4)
// C1 at time 9 (from i = 5)

//fork join_none:
// # time=0 task starting
// # time=0 task processes
// # main thread continued
// # another main thread continued
// # time=0 task A finished data=10
// # time=0 task B finished addr=20
// # time=0 task c finished data=50 addr=20
// # time=0 task A1 finished data=50
// # time=0 task A finished data=10
// # time=1 task A1 finished data=10
// # time=2 task B1 finished addr=20
// # time=2 task B finished addr=20
// # time=4 task c1 finished data=10 addr=20
// # time=4 task c finished data=50 addr=20
// # time=5 task B1 finished addr=20
// # time=9 task c1 finished data=50 addr=20
