//multiple inheritance using super keyword:

class stage_1;
  string name;
  int id;
  function f1(string name,int id);
    this.name=name;
    this.id=id;
  endfunction
endclass

class stage_2 extends stage_1;
  int data;
  
  function f1(string name,int id,int data);
    super.f1(name,id);
    this.data=data;
  endfunction
endclass

class stage_3 extends stage_2;
  int addr;
  function f1(string name,int id,int data,int addr=20);
    super.f1(name,id,data);
  this.addr=addr;
  endfunction
  function void display();
    $display("name=%s \nid=%0d \ndata=%0d \naddr=%0d",this.name,this.id,this.data,this.addr);
  endfunction
endclass

module m1;
  stage_3 s1;
  initial begin
    s1=new();
    s1.f1("zzzz",23,24,25);
    s1.display();
  end
endmodule
