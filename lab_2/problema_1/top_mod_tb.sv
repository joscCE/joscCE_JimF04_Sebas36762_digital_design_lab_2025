`timescale 1ns/1ps

module top_mod_tb;

    logic [3:0] a, b;
    logic [3:0] remainder;
    logic error;

    // Instancia del módulo bajo prueba (DUT - Device Under Test)
    top_mod #(.N(4)) dut (
        .dividend(a),
        .divisor(b),
        .remainder(remainder),
        .error(error)
    );

    //prueba

        // Caso 1: Módulo normal (8 % 2)
        a = 4'b1000;  // 8
        b = 4'b0010;  // 2
        #10;
        $display("a = %d, b = %d -> remainder = %d, error = %b", a, b, remainder, error);

        // Caso 2: Módulo exacto (6 % 3)
        a = 4'b0110;  // 6
        b = 4'b0011;  // 3
        #10;
        $display("a = %d, b = %d -> remainder = %d, error = %b", a, b, remainder, error);

        // Caso 3: Módulo con residuo (7 % 3)
        a = 4'b0111;  // 7
        b = 4'b0011;  // 3
        #10;
        $display("a = %d, b = %d -> remainder = %d, error = %b", a, b, remainder, error);

        // Caso 4: Módulo de 0 (0 % 5)
        a = 4'b0000;  // 0
        b = 4'b0101;  // 5
        #10;
        $display("a = %d, b = %d -> remainder = %d, error = %b", a, b, remainder, error);

        // Caso 5: Módulo por 0 (Error esperado)
        a = 4'b0110;  // 6
        b = 4'b0000;  // 0
        #10;
        $display("a = %d, b = %d -> remainder = %d, error = %b", a, b, remainder, error);

        $stop;
    end

endmodule
