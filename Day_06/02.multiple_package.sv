// Code your testbench here
// or browse Examples
package pkgA;
 int a=10;
  int b=20;
function void fun();
  $display("a=%0d b=%0d",a,b);
endfunction
endpackage


package pkgB;
import pkgA::*;
  int a=20;
  int b=10;
  
function void fun();
 
  pkgA::fun();
  $display("a=%0d b=%0d",a,b);
  
endfunction
endpackage 

package  pkgC;
  import pkgB::*;
  int a=30;
  int b=40;
function void fun();
  pkgB::fun();
  $display("a=%0d b=%0d",a,b);
endfunction
endpackage

module m1;
 //import pkgC::*;
initial begin
  
  pkgA::fun();
  $display("\0n");
  pkgB::fun();
  $display("\0n");
  pkgC::fun();
  
end
endmodule
