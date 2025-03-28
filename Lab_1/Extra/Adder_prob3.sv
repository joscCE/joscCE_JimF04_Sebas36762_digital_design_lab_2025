module Adder_prob3 (
    input  logic [3:0] a, b,  // Entradas de 4 bits
    input  logic       cin,   // Carry de entrada
    output logic [7:0] seg0, seg1, // Salida del decodificador
    output logic       cout   // Carry de salida final
);

    // Señales internas para los acarreo entre los bits
    logic [3:0] c;
    logic [3:0] s;
    logic cout_internal;

    // Instancias de fulladderbit para cada bit
    fulladderbit FA0 (.a(a[0]), .b(b[0]), .cin(cin),  .s(s[0]), .cout(c[0]));
    fulladderbit FA1 (.a(a[1]), .b(b[1]), .cin(c[0]), .s(s[1]), .cout(c[1]));
    fulladderbit FA2 (.a(a[2]), .b(b[2]), .cin(c[1]), .s(s[2]), .cout(c[2]));
    fulladderbit FA3 (.a(a[3]), .b(b[3]), .cin(c[2]), .s(s[3]), .cout(cout_internal));

    // Instancia del decodificador
    deco_prob3 decoder_inst (
        .a(s),
        .o(cout_internal),
        .seg0(seg0),
        .seg1(seg1)
    );

    assign cout = cout_internal;

endmodule