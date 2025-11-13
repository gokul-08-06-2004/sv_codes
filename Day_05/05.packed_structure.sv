module packed_structure_array;
  int i;
  typedef struct packed{
    logic[31:0] attendence;
    longint mark;
    bit [7:0] rank;
  }student;// userdefined type
  
  student stu[4];// datatype identifier[element];
  initial begin
    stu[0:1]='{'{'d90,'d490,'d2},'{'d95,'d492,'d1}};
    
    
    for(i=0;i<2;i++)begin
      $display("student[%0d]: \n attendence=%0dperccentage \n mark=%0d/500 \n rank=%0d \n",i,stu[i].attendence,stu[i].mark,stu[i].rank);
    end
    
    stu[2:3]='{'{'d80,'d400,'d5},'{'d85,'d450,'d4}};
    i=2;
    while(i<4)begin
      $display("student[%0d]: \n attendence=%0dpercentage \n mark=%0d/500 \n rank=%0d \n",i,stu[i].attendence,stu[i].mark,stu[i].rank);
      i=i+1;
    end
    
  end
endmodule
