# 📄 Project Documentation – Part I: Display Switch Values on 7-Segment Displays

**Author**      : Sanjida Orin Tawhid 
**Project**     : C4M1P1  
**Board**       : DE10-Lite (MAX10 10M50DAF484C7G)  
**Quartus**     : 16.1 Lite Edition  

---
## 🧾 Project Title:
**Target FPGA Board**: Intel **DE10-Lite** (MAX10 family)

## 🔍 Overview

This project displays two 4-bit binary numbers (SW[7:0]) as their decimal equivalents on HEX1 and HEX0. It uses a simple ROM lookup (`seg_array`) for 7-segment digit decoding.

---

## 🔍 Objective
- To design and implement a VHDL circuit that reads the values of 8 input switches (SW7–SW0) and displays them on two 7-segment displays (HEX1 and HEX0). The goal is to:
- Display SW[7:4] as a decimal digit on HEX1
- Display SW[3:0] as a decimal digit on HEX0
- Treat binary values 1010 (10) to 1111 (15) as don’t-cares (i.e., blank or undefined)

## 🧠 Concept & Explanation
- Each 7-segment display shows 1 hexadecimal digit.
- 4 bits from the switches represent one digit:
- SW[3:0] → HEX0
- SW[7:4] → HEX1
- The 7-segment displays are controlled using Boolean logic or lookup mappings.
- Values from 0 to 9 (binary 0000 to 1001) are valid and shown.
- Values 1010 to 1111 (10 to 15 in decimal) are treated as don’t-care conditions — no segments are lit for these values.

## 💾 VHDL Module – C4M1P1.vhd
This module:
- Accepts an 8-bit input vector from switches.
- Splits into two 4-bit inputs (D0, D1).
- Outputs two 7-bit signals to drive HEX0 and HEX1.

## Ports:
➤ Signal	Direction	Description

➤ SW	in	8 switches (SW[7:0])

➤ HEX0	out	7-segment output for SW[3:0]

➤ HEX1	out	7-segment output for SW[7:4]

## Code Summary:
- Uses case statements to map each 4-bit input (D0, D1) to the 7-segment LED encoding.
- Don’t-care values are assigned as "1111111" (all segments off).

## 🔧 Switch & Display Map

| Switch | Purpose            |
|--------|--------------------|
| SW[3:0] | Lower nibble (D0) |
| SW[7:4] | Upper nibble (D1) |

| Display | Shows            |
|---------|------------------|
| HEX0    | Decimal value of SW[3:0] |
| HEX1    | Decimal value of SW[7:4] |

---

## 🧪 Testing Procedure
1. Set switch values (SW7–0)
2. Observe HEX1 (shows SW[7:4]) and HEX0 (shows SW[3:0])
3. Valid digits (0–9) light up appropriately.
4. Inputs from 1010 to 1111 result in blank displays.

## 📊 Resource Utilization (from Quartus)
| Resource       | Usage (Example)          |
| -------------- | ------------------------ |
| Logic Elements | 15              |
| Flip-Flops     | 0 (purely combinational) |
| I/O Pins       | 185                      |

Only 15 LEs are used to implement the ROM-based digit decoder. This is extremely efficient — less than 1% of the chip’s total capacity. Most usage comes from I/O pins, not from logic or memory. This includes all I/O used (e.g., switches, HEX displays, LEDs). High usage (51%) is due to the DE10-Lite board using many output pins for 7-segment displays and switches.

## 📈 Fmax Estimation
Reported as “No paths to report” → because the design contains no clocked logic (no flip-flops or timing paths).

## ✅ Result & Observation
- The design correctly displays decimal digits on HEX0 and HEX1.
- Inputs above 9 are ignored, as expected.
- All pin connections match the DE10-Lite board specification.


🙋‍♀️ Author Developed by Sanjida Orin Tawhid


