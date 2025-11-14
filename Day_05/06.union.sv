// module union_datatype;
//   union {
//     bit [7:0] id;
//     int salary;
//   }employee[2];
  
//   initial begin
  
//     employee[0].id=123;
//     $display("employee[0]=%0d",employee[0].id);
//     employee[1].salary=230000;
//     $display("employee[1]=%0d",employee[1].salary);
//   end
//     endmodule
  
module tagged_union_using_typedef;
  integer x;
  typedef union{
    int id;
    bit[7:0] phone_number;
    shortint door_no;
    int aaddhar_no;
  }d1;
  
  d1 a;
  initial begin 
    a.id='ha;
    x=a.phone_number;
    $display("person_id=%h",x);
    
    a.phone_number='h12335678;
    x=a.door_no;
    $display("person_phone_number=%h",x);
    
    a.door_no='h123333333;
    x=a.door_no;
    $display("person_door_number=%h",x);
    
    a.aaddhar_no='h23444444;
    x=a.aaddhar_no;
    $display("person_aaddhar_no=%h",x);
  end
endmodule
