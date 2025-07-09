# Part V / Project “BCD Adder (0 – 19)”

DE10‑Lite FPGA · VHDL

Author: Sanjida Orin Tawhid
Date: 05 Jul 2025
Quartus: 16.1 Lite
Board: Terasic DE10‑Lite (MAX 10 10M50DAF484C7G)


### ➤ Objective:

Adds two BCD digits X and Y (SW 7‑4, SW 3‑0) plus an optional carry‑in Cin (SW 8) and displays the two‑digit decimal result 0‑19 on HEX1 (tens) and HEX0 (ones).
If either input digit is > 9 the design blanks all HEX displays and turns on LEDR 9 as an error flag.

Algorithm implemented (pseudo‑code from the lab):

<pre>
  T0 = A + B + Cin
if T0 > 9 then
    S0 = T0 – 10   -- ones digit
    S1 = 1         -- tens digit
else
    S0 = T0
    S1 = 0
end if

</pre>

## Switch / LED / HEX map

| Switch     | Function          |
| ---------- | ----------------- |
| **SW 3‑0** | X (BCD digit 0‑9) |
| **SW 7‑4** | Y (BCD digit 0‑9) |
| **SW 8**   | Cin (carry‑in)    |

| Output       | Purpose                            |
| ------------ | ---------------------------------- |
| **HEX0**     | Ones digit (0‑9)                   |
| **HEX1**     | Tens digit (0 or 1)                |
| **HEX3**     | Echo X (blank if X > 9)            |
| **HEX5**     | Echo Y (blank if Y > 9)            |
| **LEDR 4‑0** | Raw 5‑bit binary sum for debugging |
| **LEDR 9**   | Error flag (1 when X or Y > 9)     |

### 🛠 How to Run

1. Open C4M1P4.qpf in Quartus.
2. Compile the project.
3. Program DE10-Lite.
4. Test with valid and invalid BCD inputs.

### 📊 Resource Utilization (from Quartus)

| Resource       | Used | %     |
| -------------- | ---- | ----- |
| Logic Elements | 46   | < 1 % |
| Registers      | 0    | 0 %   |
| Pins           | 164  | 46 %  |
| Memory bits    | 0    | 0 %   |
| Embedded mults | 0    | 0 %   |
| PLLs           | 0    | 0 %   |

Only 46 LEs are used to implement the BCD Adder. This is extremely efficient — less than 1% of the chip’s total capacity. Most usage comes from I/O pins, not from logic or memory. This includes all I/O used (e.g., switches, HEX displays, LEDs). High usage (46%) is due to the DE10-Lite board using many output pins for 7-segment displays and switches.

| X  | Y | Cin | Expected | HEX1 HEX0 | LEDR 9 |
| -- | - | --- | -------- | --------- | ------ |
| 9  | 9 | 1   | 19       | 1    9    | 0      |
| 11 | 9 | 1   | --       | -    -    | 1      |
| 8  | 5 | 1   | 14       | 1    4    | 0      |
| 15 | 10| 0   | --       | -    -    | 1      |

### 📈 Fmax Estimation
Reported as “No paths to report” → because the design contains no clocked logic (no flip-flops or timing paths).


### Notes

- Behavioral, conditional statements used.
- Proper BCD behavior, including overflow and input error detection.


