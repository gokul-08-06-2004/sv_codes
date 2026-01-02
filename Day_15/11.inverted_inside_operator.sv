//inverted inside operator:

class inverted_inside;
  
  rand bit[7:0]arun_weight;
  rand bit[7:0]ram_weight;
  randc bit[7:0]total_weight;
  
  constraint range{!(arun_weight inside {1,[3:20],[23:30],32,33,[40:255]});}
  constraint range1{!(ram_weight inside {[2:10]});}
  extern constraint range2;
endclass

constraint inverted_inside::range2{total_weight==arun_weight+ram_weight;}

module m1;
  inverted_inside i1;
  initial begin
    i1=new();
    
    for(int i=0;i<3;i++)begin
      if(i1.randomize())begin
        $display("arun_weight=%0d \nram_weight=%0d total_weight=%0d+%0d=%0d",i1.arun_weight,i1.ram_weight,i1.arun_weight,i1.ram_weight,i1.total_weight); 
      $display("------------------------------------------------------");
      end
      else
        $display("raandomization is failed");
    end
  end
endmodule

// x takes any values described in the constraint_block :
// • x is: 3,5,9,10,11,12,13,14,15,24,25,26,27,28,29,30,31,32
// • x is: 3,5,9,10,11,12,13,14,15,24,25,26,27,28,29,30,31,32, between y and 2y, z

class inside_constraint;
  rand bit[7:0]x;
  rand bit[7:0]y;
  rand bit[7:0]z;
//   constraint c1{!(z inside {[3:20]});}
//   constraint c2{y inside {1,[3:10]};}
//   constraint c3{x inside {3,5,9,[10:15],[24:32],[y:2*y],z};}
  constraint c1{z==23;}
  constraint c2{y==10;}
    constraint c3{x inside {[y:2*y],z};}
endclass
                  
module m1;
  inside_constraint i1;
  initial begin
    i1=new();
    
    for(int i=0;i<3;i++)begin
      if(i1.randomize())
        $display(" {[y=%0d:y*2=%0d],z=%0d} x=%0d",i1.y,i1.y*2,i1.z,i1.x);
      else
        $display("randomizationis failed");
    end
  end
endmodule
// #  {[y=10:y*2=20],z=23} x=13
// #  {[y=10:y*2=20],z=23} x=17
// #  {[y=10:y*2=20],z=23} x=11
