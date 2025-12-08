//extern method:

class calculation;
  string grade;
  extern function score(int mark);
endclass
    
    function calculation::score(int mark);
      if(mark>=35 && mark<=60)begin
        grade="C";
        $display("mark=%0d grade=%s",mark,grade);
      end
      
      else if(mark>=61 && mark<=80)begin
        grade="B";
        $display("mark=%0d grade=%s",mark,grade);
      end
      
      else if(mark>=81 && mark<=105)begin
        grade="A";
        $display("mark=%0d grade=%s",mark,grade);
      end
      
      else 
        $display("mark=%0d<35 fail",mark);
    endfunction
    
    module m1;
      calculation c1[4];
      initial begin
        for(int i=0;i<4;i++)begin
          c1[i]=new();
          c1[i].score(i*35);
        end
      end
    endmodule
    
//     # mark=0<35 fail
// # mark=35 grade=C
// # mark=70 grade=B
// # mark=105 grade=A
