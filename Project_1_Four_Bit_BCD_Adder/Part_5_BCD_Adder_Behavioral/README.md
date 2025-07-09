# Part V / Project “BCD Adder (0 – 19)”

➤ Objective:

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
