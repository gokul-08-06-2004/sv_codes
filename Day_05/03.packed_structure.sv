module packed_structure;
  struct packed{
    bit [7:0]intr;
    logic [23:0]addr;
  }num;
  
  initial begin
    num.intr='hff;
    $display("intr=%h",num.intr);
    
    num='h00ff00ff;
    $display("addr=%h",num);
    
    num=0;
    num=num+'h12;
    $display("addr=%h",num);
  end
endmodule

