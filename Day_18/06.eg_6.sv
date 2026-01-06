//Partitions for program and data

class mem;
  
  rand int mem_total;
  rand int mem_num_program;
  rand int mem_num_data;
  rand int mem_num_space;
  
  rand int mem_program_size[];
  rand int mem_data_size[];
  rand int mem_space_size[];
  
  rand int mem_program[];
  rand int mem_data[];
  rand int mem_space[];
  int i;
  
  constraint c1{mem_total inside {2048,4096,8192};}
  
  constraint c2{mem_num_program>=2;
                mem_num_program<=6;
                mem_num_data inside {3,4,5,6};
                mem_num_space inside {3,4,5,6};}
  constraint c3{mem_program_size.size()==mem_num_program;
                mem_data_size.size()==mem_num_data;
                mem_space_size.size()==mem_num_space;
                mem_program_size.sum()+mem_data_size.sum()+mem_space_size.sum()==mem_total;
                
                foreach(mem_program_size[i])
                  mem_program_size[i] inside {32,64,128,256,512};
                foreach(mem_data_size[i])
                  mem_data_size[i] inside {128,256,512,1024,2048};
                foreach(mem_space_size[i])
                  mem_space_size[i] inside {32,64,128,256};
               }
  
  constraint c4{mem_program.size()==mem_num_program;
                mem_data.size()==mem_num_data;
                mem_space.size()==mem_num_space;
               
                foreach(mem_program[i])
                  mem_program[i]==mem_program_size[i];
                foreach(mem_data[i])
                  mem_data[i]==mem_data_size[i];
                foreach(mem_space[i])
                  mem_space[i]==mem_space_size[i];
               }
  
  function void display();
    
   
    $display("mem_total=%0d \nmem_num_program=%0d \nmem_num_data=%0d \nmem_num_space=%0d",mem_total,mem_num_program,mem_num_data,mem_num_space);
    $display("--------------------------------------------");
    
    foreach(mem_program[i])
      $display("mem_program[%0d]=%0d",i,mem_program[i]);
      $display("--------------------------------------------");
    foreach(mem_data[i])
      $display("mem_data[%0d]=%0d",i,mem_data[i]);
      $display("--------------------------------------------");
    foreach(mem_space[i])
      $display("mem_space[%0d]=%0d",i,mem_space[i]);
      $display("--------------------------------------------");

  endfunction
endclass

module m1;
  mem mem1;
  initial begin
    mem1=new();
    
    for(int i=0;i<5;i++)begin
       $display("==================loop_start[%0d]=================",i);
    void'(mem1.randomize());
    void'(mem1.display());
      $display("===================loop_end[%0d]===================",i);
    end
  end
endmodule 


//output:

// # ==================loop_start[0]=================
// # mem_total=8192 
// # mem_num_program=3 
// # mem_num_data=5 
// # mem_num_space=3
// # --------------------------------------------
// # mem_program[0]=128
// # mem_program[1]=128
// # mem_program[2]=512
// # --------------------------------------------
// # mem_data[0]=128
// # mem_data[1]=2048
// # mem_data[2]=1024
// # mem_data[3]=2048
// # mem_data[4]=2048
// # --------------------------------------------
// # mem_space[0]=32
// # mem_space[1]=32
// # mem_space[2]=64
// # --------------------------------------------
// # ===================loop_end[0]===================
// # ==================loop_start[1]=================
// # mem_total=4096 
// # mem_num_program=6 
// # mem_num_data=5 
// # mem_num_space=5
// # --------------------------------------------
// # mem_program[0]=32
// # mem_program[1]=512
// # mem_program[2]=128
// # mem_program[3]=32
// # mem_program[4]=32
// # mem_program[5]=64
// # --------------------------------------------
// # mem_data[0]=2048
// # mem_data[1]=128
// # mem_data[2]=512
// # mem_data[3]=256
// # mem_data[4]=128
// # --------------------------------------------
// # mem_space[0]=32
// # mem_space[1]=64
// # mem_space[2]=64
// # mem_space[3]=32
// # mem_space[4]=32
// # --------------------------------------------
// # ===================loop_end[1]===================
// # ==================loop_start[2]=================
// # mem_total=4096 
// # mem_num_program=4 
// # mem_num_data=5 
// # mem_num_space=4
// # --------------------------------------------
// # mem_program[0]=256
// # mem_program[1]=128
// # mem_program[2]=32
// # mem_program[3]=128
// # --------------------------------------------
// # mem_data[0]=256
// # mem_data[1]=512
// # mem_data[2]=256
// # mem_data[3]=2048
// # mem_data[4]=128
// # --------------------------------------------
// # mem_space[0]=128
// # mem_space[1]=32
// # mem_space[2]=128
// # mem_space[3]=64
// # --------------------------------------------
// # ===================loop_end[2]===================
// # ==================loop_start[3]=================
// # mem_total=2048 
// # mem_num_program=4 
// # mem_num_data=3 
// # mem_num_space=5
// # --------------------------------------------
// # mem_program[0]=128
// # mem_program[1]=32
// # mem_program[2]=512
// # mem_program[3]=64
// # --------------------------------------------
// # mem_data[0]=128
// # mem_data[1]=512
// # mem_data[2]=256
// # --------------------------------------------
// # mem_space[0]=256
// # mem_space[1]=32
// # mem_space[2]=32
// # mem_space[3]=32
// # mem_space[4]=64
// # --------------------------------------------
// # ===================loop_end[3]===================
// # ==================loop_start[4]=================
// # mem_total=4096 
// # mem_num_program=2 
// # mem_num_data=4 
// # mem_num_space=4
// # --------------------------------------------
// # mem_program[0]=64
// # mem_program[1]=64
// # --------------------------------------------
// # mem_data[0]=1024
// # mem_data[1]=1024
// # mem_data[2]=1024
// # mem_data[3]=256
// # --------------------------------------------
// # mem_space[0]=64
// # mem_space[1]=64
// # mem_space[2]=256
// # mem_space[3]=256
// # --------------------------------------------
// # ===================loop_end[4]===================
