module onebit_comp
    (
        input wire a,b,
        output wire out
    );

    assign out = a ~^ b;

endmodule
