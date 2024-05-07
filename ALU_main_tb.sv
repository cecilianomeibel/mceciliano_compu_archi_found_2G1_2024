module ALU_main_tb;

    // Inputs
    logic [3:0] A_num_tb;
    logic [3:0] B_num_tb;
    logic [1:0] ALUControl_tb;

    // Outputs
    logic [3:0] result_tb;

    // Instantiate the ALU_main module
    ALU_main ALU_inst (
        .A_num(A_num_tb),
        .B_num(B_num_tb),
        .ALUControl(ALUControl_tb),
        .result(result_tb)
    );

    // Define test vectors
    initial begin
        // Test case 1: ALUControl = 00 (AND operation)
        A_num_tb = 4'b1011; // 10 in binary
        B_num_tb = 4'b0010; // 6 in binary
        ALUControl_tb = 2'b00;
        #10; // Delay for propagation


        // Test case 2: ALUControl = 01 (OR operation)
        A_num_tb = 4'b1000; // 10 in binary
        B_num_tb = 4'b0100; // 6 in binary
        ALUControl_tb = 2'b01;
        #10; // Delay for propagation


        // Test case 3: ALUControl = 10 (addition)
        A_num_tb = 4'b1110; // 10 in binary
        B_num_tb = 4'b1110; // 6 in binary
        ALUControl_tb = 2'b10;
        #10; // Delay for propagation


        // Test case 4: ALUControl = 11 (subtract, B_num is negated)
        A_num_tb = 4'b1111; // 10 in binary
        B_num_tb = 4'b0111; // 6 in binary
        ALUControl_tb = 2'b11;
        #10; // Delay for propagation


        // Additional test cases can be added here
    end

endmodule
