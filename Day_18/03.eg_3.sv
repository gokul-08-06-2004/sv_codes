//memory n equal partition:

class mem;
  
  rand int mem_part;
  rand int mem_part_size;
  rand int mem_start;
  rand int mem_end;
  rand int mem_start_addr[];

  constraint memory{mem_start==0;
                    mem_end==(2**11)-1;}//2048
  constraint partition_memory{mem_part>=2;mem_part<=8;}
  constraint partition_size{mem_part_size==mem_end/mem_part+1;}
  
  constraint partition{
    mem_start_addr.size()==mem_part;
    foreach(mem_start_addr[i])
      if(i)
        mem_start_addr[i]==mem_start_addr[i-1]+mem_part_size;
    else
      mem_start_addr[i]==mem_start; 
  }
  function void display();
    $display("mem_start=%0d \nmem_end=%0d \nmem_partition_size=%0d \nno_of_partition=%0d",mem_start,mem_end,mem_part_size,mem_part);
    
    foreach(mem_start_addr[i])
      if(i==mem_part-1)
        $display("partition=%0d from %0d to %0d",i+1,mem_start_addr[i],mem_end);
      else 
        $display("partition=%0d from %0d to %0d",i+1,mem_start_addr[i],mem_start_addr[i+1]-1);
  endfunction
endclass

module memory;
  mem m1;
  initial begin
    m1=new();
    for(int i=0;i<5;i++)begin
    void'(m1.randomize());
    void'(m1.display());
    $display("---------------------------------------");
    end
  end
endmodule 
  
  
// # mem_start=0 
// # mem_end=2047 
// # mem_partition_size=683 
// # no_of_partition=3
// # partition=1 from 0 to 682
// # partition=2 from 683 to 1365
// # partition=3 from 1366 to 2047
// # ---------------------------------------
// # mem_start=0 
// # mem_end=2047 
// # mem_partition_size=410 
// # no_of_partition=5
// # partition=1 from 0 to 409
// # partition=2 from 410 to 819
// # partition=3 from 820 to 1229
// # partition=4 from 1230 to 1639
// # partition=5 from 1640 to 2047
// # ---------------------------------------
// # mem_start=0 
// # mem_end=2047 
// # mem_partition_size=256 
// # no_of_partition=8
// # partition=1 from 0 to 255
// # partition=2 from 256 to 511
// # partition=3 from 512 to 767
// # partition=4 from 768 to 1023
// # partition=5 from 1024 to 1279
// # partition=6 from 1280 to 1535
// # partition=7 from 1536 to 1791
// # partition=8 from 1792 to 2047
// # ---------------------------------------
// # mem_start=0 
// # mem_end=2047 
// # mem_partition_size=293 
// # no_of_partition=7
// # partition=1 from 0 to 292
// # partition=2 from 293 to 585
// # partition=3 from 586 to 878
// # partition=4 from 879 to 1171
// # partition=5 from 1172 to 1464
// # partition=6 from 1465 to 1757
// # partition=7 from 1758 to 2047
// # ---------------------------------------
// # mem_start=0 
// # mem_end=2047 
// # mem_partition_size=293 
// # no_of_partition=7
// # partition=1 from 0 to 292
// # partition=2 from 293 to 585
// # partition=3 from 586 to 878
// # partition=4 from 879 to 1171
// # partition=5 from 1172 to 1464
// # partition=6 from 1465 to 1757
// # partition=7 from 1758 to 2047
// # ---------------------------------------
