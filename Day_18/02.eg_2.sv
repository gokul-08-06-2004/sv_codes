//Memory partition using constraints
// Assume that you have a memory of size 2048 i.e., 2KB in design to store some data, then if we need some block of that 2KB memory for some purpose, for partitioning that memory we can use constraints.

class mem;
  
  rand int mem_ram_start;
  rand int mem_ram_end;
  rand int mem_start_addr;
  rand int mem_end_addr;
  rand int mem_size;
  
  constraint c1{mem_ram_start==0;
                mem_ram_end==2048;}
  constraint c2{mem_start_addr>=mem_ram_start;
                mem_start_addr<mem_ram_end;
                mem_start_addr%4==0;
                mem_end_addr==mem_start_addr+mem_size-1;}
  constraint c3{mem_size inside {32,64};}
  
  function void display();
    $display("mem_size=%0d",mem_size);
    $display("mem_ram_start=%0d",mem_ram_start);
    $display("mem_ram_end=%0d",mem_ram_end);
    $display("mem_start_addr=%0d",mem_start_addr);
    $display("mem_end_addr=%0d",mem_end_addr);
  endfunction
endclass

module memory;
  mem m1;
  initial begin
    m1=new();
    
    for(int i=0;i<5;i++)begin
      if(m1.randomize())begin
        $display("PASS:mem_size=%0d \nmem_ram_start=%0d \nmem_ram_end=%0d \nmem_start_addr=%0d \nmem_end_addr=%0d",m1.mem_size,m1.mem_ram_start,m1.mem_ram_end,m1.mem_start_addr,m1.mem_end_addr);
        $display("-----------------------------------------------------------------");
      end
    else
      $display("FAIL:mem_size=%0d mem_ram_start=%0d mem_ram_end=%0d mem_start_addr=%0d mem_end_addr=%0d",m1.mem_size,m1.mem_ram_start,m1.mem_ram_end,m1.mem_start_addr,m1.mem_end_addr);
    end
  end
endmodule 
   
// # PASS:mem_size=32 
// # mem_ram_start=0 
// # mem_ram_end=2048 
// # mem_start_addr=816 
// # mem_end_addr=847
// # -----------------------------------------------------------------
// # PASS:mem_size=64 
// # mem_ram_start=0 
// # mem_ram_end=2048 
// # mem_start_addr=1416 
// # mem_end_addr=1479
// # -----------------------------------------------------------------
// # PASS:mem_size=64 
// # mem_ram_start=0 
// # mem_ram_end=2048 
// # mem_start_addr=332 
// # mem_end_addr=395
// # -----------------------------------------------------------------
// # PASS:mem_size=32 
// # mem_ram_start=0 
// # mem_ram_end=2048 
// # mem_start_addr=64 
// # mem_end_addr=95
// # -----------------------------------------------------------------
// # PASS:mem_size=32 
// # mem_ram_start=0 
// # mem_ram_end=2048 
// # mem_start_addr=288 
// # mem_end_addr=319
// # -----------------------------------------------------------------
