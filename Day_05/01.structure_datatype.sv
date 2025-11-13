module structure_datatype;
  struct{
    string name;
    int phone_number;
    bit [7:0] address;
    shortint bus_number;
    logic [7:0] rank;
    
  }student;

  initial begin
  student.name="gokul";
  student.phone_number='d123456789;
  student.address='d123;
  student.bus_number='d2;
  student.rank='d1;;
  
  $display("student_detial=%p",student);
    
    $display("student_name is %0d",student.name);
    $display("student_phone_number is %0d",student.phone_number);
    $display("student_address is %0d",student.address);
    $display("student_bus_number is %0d",student.bus_number);
    $display("student_rank is %0d",student.rank);
    
  
  end
endmodule
