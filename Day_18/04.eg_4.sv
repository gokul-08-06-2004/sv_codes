//n variable partition:

class mem;
  
  rand int mem_start;
  rand int mem_end;
  rand int no_of_part;
  rand int part_size[];
  rand int mem_part_size[];   
  constraint c1{mem_start==0;
                mem_end==16383;}
  constraint c2{no_of_part>=2;
               no_of_part<=8;}
  constraint c3{part_size.size()==no_of_part;
                part_size.sum()==mem_end+1;
                foreach(part_size[i])
                  part_size[i] inside {16,32,64,128,256,512,1024,2048,4096};}
  constraint c4{mem_part_size.size()==no_of_part;
                foreach(mem_part_size[i])
                  if(i)
                    mem_part_size[i]==part_size[i-1]+mem_part_size[i-1];
               else
                 mem_part_size[i]==mem_start;}
  
  function void display();
    $display("mem_start=%0d \nmem_end=%0d \nno_of_part=%0d",mem_start,mem_end,no_of_part);
    
    foreach(mem_part_size[i])begin
      if(i==no_of_part-1)
        $display("Partition : %0d with size : %0d from %0d to %0d ", 
                 i, part_size[i], mem_part_size[i], mem_end);
    else
      $display("partition :%0d the size : %0d form %0d to %0d ",i,part_size[i],mem_part_size[i],mem_part_size[i+1]-1);
    end
  endfunction
endclass

module m1;
  mem n1;
  initial begin
    n1=new();
    repeat(6)begin
    void'(n1.randomize());
    void'(n1.display());
      $display("------------------------------------------");
    end
    
  end
endmodule

// # mem_start=0 
// # mem_end=16383 
// # no_of_part=6
// # partition :0 the size : 1024 form 0 to 1023 
// # partition :1 the size : 1024 form 1024 to 2047 
// # partition :2 the size : 2048 form 2048 to 4095 
// # partition :3 the size : 4096 form 4096 to 8191 
// # partition :4 the size : 4096 form 8192 to 12287 
// # Partition : 5 with size : 4096 from 12288 to 16383 
// # ------------------------------------------
// # mem_start=0 
// # mem_end=16383 
// # no_of_part=6
// # partition :0 the size : 4096 form 0 to 4095 
// # partition :1 the size : 2048 form 4096 to 6143 
// # partition :2 the size : 4096 form 6144 to 10239 
// # partition :3 the size : 2048 form 10240 to 12287 
// # partition :4 the size : 2048 form 12288 to 14335 
// # Partition : 5 with size : 2048 from 14336 to 16383 
// # ------------------------------------------
// # mem_start=0 
// # mem_end=16383 
// # no_of_part=7
// # partition :0 the size : 4096 form 0 to 4095 
// # partition :1 the size : 2048 form 4096 to 6143 
// # partition :2 the size : 1024 form 6144 to 7167 
// # partition :3 the size : 512 form 7168 to 7679 
// # partition :4 the size : 512 form 7680 to 8191 
// # partition :5 the size : 4096 form 8192 to 12287 
// # Partition : 6 with size : 4096 from 12288 to 16383 
// # ------------------------------------------
// # mem_start=0 
// # mem_end=16383 
// # no_of_part=4
// # partition :0 the size : 4096 form 0 to 4095 
// # partition :1 the size : 4096 form 4096 to 8191 
// # partition :2 the size : 4096 form 8192 to 12287 
// # Partition : 3 with size : 4096 from 12288 to 16383 
// # ------------------------------------------
// # mem_start=0 
// # mem_end=16383 
// # no_of_part=6
// # partition :0 the size : 2048 form 0 to 2047 
// # partition :1 the size : 4096 form 2048 to 6143 
// # partition :2 the size : 4096 form 6144 to 10239 
// # partition :3 the size : 1024 form 10240 to 11263 
// # partition :4 the size : 1024 form 11264 to 12287 
// # Partition : 5 with size : 4096 from 12288 to 16383 
// # ------------------------------------------
// # mem_start=0 
// # mem_end=16383 
// # no_of_part=4
// # partition :0 the size : 4096 form 0 to 4095 
// # partition :1 the size : 4096 form 4096 to 8191 
// # partition :2 the size : 4096 form 8192 to 12287 
// # Partition : 3 with size : 4096 from 12288 to 16383 
// # ------------------------------------------
