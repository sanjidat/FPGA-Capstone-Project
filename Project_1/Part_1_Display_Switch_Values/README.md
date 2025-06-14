# 📄 Project Documentation – Part I: Display Switch Values on 7-Segment Displays

🧾 Project Title:
C4M1P1 – Display Switch Values on HEX Displays (DE10-Lite FPGA)

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

## 📍 Pin Assignment
Performed using Quartus Pin Planner. Example assignments:

| Signal    | FPGA Pin | Function       |
| --------- | -------- | -------------- |
| `SW[0]`   | A10      | Slide Switch 0 |
| `SW[1]`   | B10      | Slide Switch 1 |
| `...`     | ...      | ...            |
| `HEX0[0]` | N16      | HEX0 segment a |
| `HEX0[1]` | P15      | HEX0 segment b |
| `...`     | ...      | ...            |


## 🧪 Testing Procedure
1. Set switch values (SW7–0)
2. Observe HEX1 (shows SW[7:4]) and HEX0 (shows SW[3:0])
3. Valid digits (0–9) light up appropriately.
4. Inputs from 1010 to 1111 result in blank displays.

## 📊 Resource Utilization (from Quartus)
| Resource       | Usage (Example)          |
| -------------- | ------------------------ |
| Logic Elements | (e.g., 34)               |
| Flip-Flops     | 0 (purely combinational) |
| I/O Pins       | 22                       |


## 📈 Fmax Estimation
Reported as “No paths to report” → because the design contains no clocked logic (no flip-flops or timing paths).

## ✅ Result & Observation
- The design correctly displays decimal digits on HEX0 and HEX1.
- Inputs above 9 are ignored, as expected.
- All pin connections match the DE10-Lite board specification.


🙋‍♀️ Author Developed by Sanjida Orin Tawhid


