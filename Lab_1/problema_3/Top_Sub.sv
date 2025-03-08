module Top_Sub
     #(parameter N=6)
     (
     input logic [N-1:0] a,
     input logic reset,  // Reset asincrónico
     input logic dec_btn,  // Botón de decremento asincrónico
     output logic [7:0] seg1, seg0
     );
 
     logic [N-1:0] value;  
 
     // Invertir los botones
     wire reset_n = ~reset;
     wire dec_btn_n_active = ~dec_btn;
 
     always @(reset_n or dec_btn_n_active) begin
         if (reset_n) 
             value <= a;  
         else if (dec_btn_n_active) 
             value <= value - 1'b1;  // Decrementar en 1 
     end
 
     
     TopDecoder topdec(
         .a(value),
         .seg0(seg0),
         .seg1(seg1)
     );
 
 endmodule