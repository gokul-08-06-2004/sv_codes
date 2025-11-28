// Code your testbench here
// or browse Examples
class sample;
  
  string brand_name;
  int price;
  bit [15:0]model_number;
  logic[3:0] vehicle_number;
  
  function int f1();
  brand_name="ferrai";
    price=12000000;
    model_number=2026;
    vehicle_number='1;
  endfunction
  
  function void display();
    $display("brand_name=%s \nprice=%0d \nmodel_number=%0d \nvehicle_number=TN02AB%b",brand_name,price,model_number,vehicle_number);
  endfunction
endclass

module class_assignment;
  sample s1,s2;
  initial begin
    s1=new();
    s1.f1();
    s1.display();
    $display("copy and overwrite the value of s1 to s2 in same object\n");
    s2=s1;
    s2.brand_name="lambogini";
    s2.model_number=2025;
    s2.vehicle_number='0;
    s2.display();
    
    $display("copy and overwrite the value of s2 to s1 in same object\n");
    s1.brand_name="audi";
    s1.price=10000000;
    s1.model_number=2026;
    s1.display();
    
    $display("copy and overwrite the value of s1 to s2 in same object\n");
    s2.brand_name="benz";
    s2.price=1000000;
    s2.model_number=2023;
    s2.vehicle_number='1;
    $display("brand_name=%s \nprice=%0d \nmodel_number=%0d \nvehicle_number=TN02AB%b",s2.brand_name,s2.price,s2.model_number,s2.vehicle_number);
    
  end
endmodule

// # brand_name=ferrai 
// # price=12000000 
// # model_number=2026 
// # vehicle_number=TN02AB1111
// # copy and overwrite the value of s1 to s2 in same object
// # 
// # brand_name=lambogini 
// # price=12000000 
// # model_number=2025 
// # vehicle_number=TN02AB0000
// # copy and overwrite the value of s2 to s1 in same object
// # 
// # brand_name=audi 
// # price=10000000 
// # model_number=2026 
// # vehicle_number=TN02AB0000
// # copy and overwrite the value of s1 to s2 in same object
// # 
// # brand_name=benz 
// # price=1000000 
// # model_number=2023 
// # vehicle_number=TN02AB1111
