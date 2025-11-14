// Code your testbench here
// or browse Examples

package p1;

int a=10;
function  number();
  $display("number=%0d",a);
endfunction

function int name(input int b);
name=b;
endfunction

typedef struct {
  string name;
  int id ;
  int roll_no;
}proof;
endpackage

import p1::*;
module m1;
  int c;
  proof stu[3]='{'{"gokul",23,3},'{"vijay",34,2},'{"rio",77,9}};
  initial begin
    number();
    c=name(4);
    $display("name=%0d",c);
    
    foreach(stu[i])
      $display("name[%0d]=%s\n id[%0d]=%0d\n roll_no[%0d]=%0d",i,stu[i].name,i,stu[i].id,i,stu[i].roll_no);
    
  end
endmodule
