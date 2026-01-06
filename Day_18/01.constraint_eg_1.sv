//Memory partition using constraints
// Assume that you have a memory of size 2048 i.e., 2KB in design to store some data, then if we need some block of that 2KB memory for some purpose, for partitioning that memory we can use constraints.

class mem;
  
  rand int mem_ram_start;
  rand int mem_ram_end;
  
  rand int mem_start_addr;
  rand int mem_end_addr;
  
  rand int mem_size;
  
  constraint c1{mem_ram_start==0;
                mem_ram_end==2047;}
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
    void'(m1.randomize());
    m1.display();
  end
endmodule 
   
// # mem_size=32
// # mem_ram_start=0
// # mem_ram_end=2047
// # mem_start_addr=816
// # mem_end_addr=847
