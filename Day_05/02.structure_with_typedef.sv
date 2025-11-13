module structure_with_typedef;
  typedef struct{
    string name;
    int employee_no;
    bit [7:0] door_no;
    byte bus_no;
    byte rank;
  }employee;
  employee emp[2];//employee is type and emp is 2 variable.
  
  initial begin
    emp='{'{"gokul",'d34,'d3,'d2,'d1},'{"arul",'d54,'d4,'d2,'d1}};
    
    foreach(emp[i])begin
      $display("emp[%0d]\n name=%s \n employee=%0d \n door_no=%0d \n bus_no=%0d \n rank=%0d",i,emp[i].name,emp[i].employee_no,emp[i].door_no,emp[i].bus_no,emp[i].rank);
    end
  end
endmodule
