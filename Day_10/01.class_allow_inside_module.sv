// Code your testbench here
// or browse Examples
module tb;
  
  class data;
    // class properties
    string name;
    int roll_no;
    //methods
    function new();
      name="gokul";
      roll_no=23;
    endfunction
  endclass
  
  data d1;
  initial begin
    d1=new();
    $display("name=%s roll_no=%0d",d1.name,d1.roll_no)
  end
endmodule
