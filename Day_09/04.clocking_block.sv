module multiplier(inf.DUT mul);
  
  always@(posedge mul.clk or posedge mul.reset)begin
    if(mul.reset)begin
      mul.out<=0;
      mul.ack<=0;
    end
    else if (mul.en)begin
      mul.out<=mul.a*mul.b;
      mul.ack<=1;
    end
    else 
      mul.ack<=0;
  end
endmodule



interface inf(input logic clk,reset);
  logic [7:0] a,b;
  logic en;
  logic [7:0]out;
  logic ack;
  
  clocking cb@(posedge clk);
    default input #1 output #2;
    input  out,ack;
    output a,b,en;
  endclocking
  
  modport TB(clocking cb,input clk,reset);
    modport DUT(input clk,reset,a,b,en,output out,ack);
    endinterface
    
    
    module testbench;
      bit clk,reset;
      
      inf tb(clk,reset);
      multiplier m1(tb.DUT);
      
      initial begin
        clk=0;
        forever #2 clk=~clk;
      end
      
      always@(posedge clk)
         $display("Time=%0t  a=%0d b=%0d out=%0d ack=%0d",$time,tb.a,tb.b,tb.out,tb.ack);
        
      initial begin
//         $monitor("Time=%0t  a=%0d b=%0d out=%0d ack=%0d",$time,tb.a,tb.b,tb.out,tb.ack);
        
        reset=1;
        @(posedge clk);
        reset=0;
        @(posedge clk);
      
        tb.TB.cb.a<='d5;tb.TB.cb.b<='d4;
          tb.TB.cb.en<=1;
        @(posedge clk);
        tb.TB.cb.en<=0;
        @(posedge clk);
        
        
        tb.TB.cb.en<=1;
        tb.TB.cb.a<=2;tb.TB.cb.b<=4;
        @(posedge clk);
        tb.TB.cb.en<=0;
        @(posedge clk);
        $finish;
      end
    endmodule
