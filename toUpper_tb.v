`timescale 1ns / 1ps

module toUpper_tb;

    reg  [7:0] in_char;
    wire [7:0] out_char;

    toUpper uut (
        .in_char(in_char),
        .out_char(out_char)
    );

    initial begin
        $dumpfile("toUpper.vcd");
        $dumpvars(0, toUpper_tb);

        $display("Time(ns) |Input(bin)| In(dec) | Output(bin)|Out(dec)");
        $monitor("%6t   | %08b | %3d     | %08b | %3d", $time, in_char, in_char, out_char, out_char);

        // Stress Test
        in_char = 8'd40;   #26;
        in_char = 8'd72;   #26;
        in_char = 8'd183;  #26;
        in_char = 8'd131;  #26;
        in_char = 8'd124;  #26;
        in_char = 8'd20;   #26;
        in_char = 8'd235;  #26;
        in_char = 8'd97;   #26;
        in_char = 8'd65;   #26;
        in_char = 8'd122;  #26;
        in_char = 8'd71;   #26;
        in_char = 8'd109;  #26;
        in_char = 8'd146;  #26;
        in_char = 8'd48;   #26;
        in_char = 8'd207;  #26;
        in_char = 8'd58;   #26;
        in_char = 8'd123;  #26;
        in_char = 8'd148;  #26;
        in_char = 8'd127;  #26;

        #0 $finish;
    end

endmodule
