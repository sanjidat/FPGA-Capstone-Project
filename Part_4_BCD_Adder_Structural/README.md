# Part IV – BCD Adder (0–19) with Display and Error Detection

### 🔧 Task

### ➤ Objective:

In Part II we discussed the conversion of binary numbers into decimal digits. For this part you are to design a circuit that has two decimal digits, X and Y, as inputs. Each decimal digit is represented as a 4-bit number. In technical literature this is referred to as the binary coded decimal (BCD) representation. You
are to design a circuit that adds the two BCD digits. The inputs to your circuit are the numbers X and Y, plus a carry-in, cin. When these inputs are added, the result will be a 5-bit binary number. But this result is to be displayed on 7-segment displays as a two-digit BCD sum S1S0. For a sum equal to zero you would
display S1S0 = 00, for a sum of one S1S0 = 01, for nine S1S0 = 09, for ten S1S0 = 10, and so on. Note that the inputs X and Y are assumed to be decimal digits, which means that the largest sum that needs to be handled by this circuit is S1S0 = 9 + 9 + 1 = 19. 

Use switches SW7-4 and SW3-0 for the inputs X and Y, respectively, and use SW8 for the carry-in. Connect the four-bit sum and carry-out produced by the operation X + Y to the red lights LEDR. Display the BCD values of X and Y on the 7-segment displays HEX5 and HEX3, and display the result S1S0 on HEX1 and HEX0. 

Since your circuit handles only BCD digits, check for the cases when the input X or Y is greater than nine. If this occurs, indicate an error by turning on the red light LEDR9. 

Include the necessary pin assignments for your DE-series board using the board template as before, compile the circuit, and download it into the FPGA chip. 

Test your circuit by trying different values for numbers X, Y, and cin. From the Compiler Report in Quartus, estimate the number of Logic Cells and % utilization of FPGA logic.


---

**Author**      : Sanjida Orin Tawhid  
**Project**     : C4M1P4  
**Board**       : DE10-Lite  
**Quartus**     : 16.1 Lite Edition  


## 🔍 Overview

Adds two 4-bit BCD digits X and Y with optional carry-in. Displays the result as two decimal digits (0–19) using HEX1:HEX0. If either input is >9 (invalid BCD), displays are blank and LEDR9 signals error.


## 🔧 Signal Map

| Switch  | Purpose            |
|---------|--------------------|
| SW[3:0] | X (BCD)           |
| SW[7:4] | Y (BCD)           |
| SW[8]   | Carry-in          |

| Output   | Description          |
|----------|----------------------|
| LEDR[3:0]| 4-bit sum            |
| LEDR[4]  | Carry-out            |
| LEDR[9]  | Error (invalid BCD)  |
| HEX0     | Ones digit of result |
| HEX1     | Tens digit of result |
| HEX5     | X display            |
| HEX3     | Y display            |

---

## 🔁 Internal Logic

- Uses Full Adder chain from Part III
- `comparator_5_bit` triggers correction if Sum > 9
- `circuitA` subtracts 10
- `MUX_2_to_1` selects the corrected value
- Blank display when X or Y > 9

---

## 🗂 Files

- `BCD_Adder.vhd`
- `Full_Adder.vhd`
- `comparator_5_bit.vhd`
- `circuitA.vhd`
- `MUX_2_to_1.vhd`

---

## 🧪 Test Examples

| X | Y | Cin | Expected | HEX1 HEX0  |
|---|---|-----|----------|------------|
| 0 | 0 | 0   | 0        | 0     0    |
| 9 | 9 | 1   | 19       | 1     9    |
| 3 | 10| 1   | Invalid  | Blank      |

---

## 🛠 How to Run

1. Open `C4M1P4.qpf` in Quartus.
2. Compile the project.
3. Program DE10-Lite.
4. Test with valid and invalid BCD inputs.

---

## 📊 Resource Utilization (from Quartus)
| Resource       | Used | %     |
| -------------- | ---- | ----- |
| Logic Elements | 100  | < 1 % |
| Registers      | 0    | 0 %   |
| Pins           | 164  | 46 %  |
| Memory bits    | 0    | 0 %   |
| Embedded mults | 0    | 0 %   |
| PLLs           | 0    | 0 %   |

Only 100 LEs are used to implement the BCD Display. This is extremely efficient — less than 1% of the chip’s total capacity. Most usage comes from I/O pins, not from logic or memory. This includes all I/O used (e.g., switches, HEX displays, LEDs). High usage (46%) is due to the DE10-Lite board using many output pins for 7-segment displays and switches.

## 📈 Fmax Estimation
Reported as “No paths to report” → because the design contains no clocked logic (no flip-flops or timing paths).

## Notes

- Fully structural, no conditional statements used.
- Proper BCD behavior, including overflow and input error detection.
