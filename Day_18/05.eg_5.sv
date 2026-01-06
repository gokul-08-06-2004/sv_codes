// Code your testbench here
// or browse Examples
//memory partition space in between:

class partition_space;
  
  rand int mem_start,mem_end;
  rand int mem_part;
  rand int mem_part_size[];
  rand int mem_space[];
  rand int mem_part_start[];
  
  constraint c1{mem_start==0;
                mem_end==9215;}
  constraint c2{mem_part>=2;
                mem_part<=8;}
  constraint c3{mem_part_size.size()==mem_part;
                mem_space.size()==mem_part-1;
                mem_part_size.sum()+mem_space.sum()==mem_end+1;
                foreach(mem_part_size[i])
                  mem_part_size[i] inside {512,1024,2048,4096};
                foreach(mem_space[i])
                   mem_space[i] inside {64,128,256,1024};}
  
  constraint c4{mem_part_start.size()==mem_part;
                foreach(mem_part_start[i])
                  if(i)
                    mem_part_start[i]==mem_part_start[i-1]+mem_part_size[i-1];
                else
                  mem_part_start[i]==mem_start;
               }
  function void display();
      
    $display("mem_start=%0d \nmem_end=%0d \nmem_part=%0d",mem_start,mem_end,mem_part);
    
    foreach(mem_part_start[i])begin
      if(i==mem_part-1)
         $display("Partition : %0d with size :%0d from %0d to %0d",i,mem_part_size[i],mem_part_start[i]+mem_space[i-1],mem_end);
                  else if(i==0)
     $display("Partition : %0d with size:%0d from %0d to %0d\npartition_space=%0d",i,mem_part_size[i],mem_part_start[i],mem_part_start[i+1]-1,mem_space[i]);
                  else
                    $display("Partition : %0d with size :%0d from %0d to %0d \npartition_space=%0d",i,mem_part_size[i],mem_part_start[i-1]+mem_space[i-1],mem_part_start[i+1]-1,mem_space[i]);
                                    end
                                    endfunction
                                    endclass
                                    
                                    
module m1;
  partition_space p1;
  initial begin
    
    p1=new();
    for(int i=0;i<5;i++)begin
    void'( p1.randomize());
    void' (p1.display());
      $display("-------------------------------");
    end
  end
endmodule 

// # mem_start=0 
// # mem_end=9215 
// # mem_part=3
// # Partition : 0 with size:4096 from 0 to 4095
// # partition_space=1024
// # Partition : 1 with size :2048 from 1024 to 6143 
// # partition_space=1024
// # Partition : 2 with size :1024 from 7168 to 9215
// # -------------------------------
// # mem_start=0 
// # mem_end=9215 
// # mem_part=8
// # Partition : 0 with size:512 from 0 to 511
// # partition_space=128
// # Partition : 1 with size :512 from 128 to 1023 
// # partition_space=256
// # Partition : 2 with size :512 from 768 to 1535 
// # partition_space=1024
// # Partition : 3 with size :512 from 2048 to 2047 
// # partition_space=256
// # Partition : 4 with size :512 from 1792 to 2559 
// # partition_space=128
// # Partition : 5 with size :512 from 2176 to 3071 
// # partition_space=1024
// # Partition : 6 with size :2048 from 3584 to 5119 
// # partition_space=256
// # Partition : 7 with size :1024 from 5376 to 9215
// # -------------------------------
// # mem_start=0 
// # mem_end=9215 
// # mem_part=4
// # Partition : 0 with size:1024 from 0 to 1023
// # partition_space=1024
// # Partition : 1 with size :512 from 1024 to 1535 
// # partition_space=256
// # Partition : 2 with size :4096 from 1280 to 5631 
// # partition_space=256
// # Partition : 3 with size :2048 from 5888 to 9215
// # -------------------------------
// # mem_start=0 
// # mem_end=9215 
// # mem_part=7
// # Partition : 0 with size:2048 from 0 to 2047
// # partition_space=256
// # Partition : 1 with size :1024 from 256 to 3071 
// # partition_space=64
// # Partition : 2 with size :1024 from 2112 to 4095 
// # partition_space=64
// # Partition : 3 with size :2048 from 3136 to 6143 
// # partition_space=256
// # Partition : 4 with size :1024 from 4352 to 7167 
// # partition_space=256
// # Partition : 5 with size :512 from 6400 to 7679 
// # partition_space=128
// # Partition : 6 with size :512 from 7808 to 9215
// # -------------------------------
// # mem_start=0 
// # mem_end=9215 
// # mem_part=2
// # Partition : 0 with size:4096 from 0 to 4095
// # partition_space=1024
// # Partition : 1 with size :4096 from 5120 to 9215
// # -------------------------------
