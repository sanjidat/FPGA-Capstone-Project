### 🔧 Task

➤ Objective:

In Part II we discussed the conversion of binary numbers into decimal digits. For this part you are to design a circuit that has two decimal digits, X and Y, as inputs. Each decimal digit is represented as a 4-bit number. In technical literature this is referred to as the binary coded decimal (BCD) representation. You are to design a circuit that adds the two BCD digits. The inputs to your circuit are the numbers X and Y, plus a carry-in, cin. When these inputs are added, the result will be a 5-bit binary number. But this result is to be displayed on 7-segment displays as a two-digit BCD sum S1S0. For a sum equal to zero you would display S1S0 = 00, for a sum of one S1S0 = 01, for nine S1S0 = 09, for ten S1S0 = 10, and so on. Note that the inputs X and Y are assumed to be decimal digits, which means that the largest sum that needs to be handled by this circuit is S1S0 = 9 + 9 + 1 = 19. Use switches SW7-4 and SW3-0 for the inputs X and Y, respectively, and use SW8 for the carry-in.
Connect the four-bit sum and carry-out produced by the operation X + Y to the red lights LEDR.
Display the BCD values of X and Y on the 7-segment displays HEX5 and HEX3, and display the
result S1S0 on HEX1 and HEX0.
3. Since your circuit handles only BCD digits, check for the cases when the input X or Y is greater
than nine. If this occurs, indicate an error by turning on the red light LEDR9.
4. Include the necessary pin assignments for your DE-series board using the board template as
before, compile the circuit, and download it into the FPGA chip.
5. Test your circuit by trying different values for numbers X, Y, and cin. From the Compiler Report in
Quartus, estimate the number of Logic Cells and % utilization of FPGA logic.
