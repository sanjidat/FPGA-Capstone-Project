# 🔢 Project 1: BCD Adder System (Part 1–5)

Author: Sanjida Orin Tawhid
Course: FPGA Capstone: Building FPGA Projects
Board: Terasic DE10-Lite (MAX 10 FPGA)
Tool: Intel Quartus Prime 16.1 Lite Edition

### 📦 Overview
This project is a multi-stage VHDL design on the DE10-Lite FPGA, where a 4-bit binary number is converted to its BCD equivalent, displayed on 7-segment displays, and finally built up into a full BCD adder system capable of calculating and displaying results from 0–19. The design follows a structured progression:

| Part       | Focus Area                                                                      |
| ---------- | ------------------------------------------------------------------------------- |
| **Part 1** | Binary to 7-segment display (Hex to 7-Seg)                                      |
| **Part 2** | Binary to Decimal (BCD Display)                                                 |
| **Part 3** | 4-bit Full Adder using ripple-carry                                             |
| **Part 4** | BCD Adder for values 0–19 using CircuitA, MUX, Comparator with structural model |
| **Part 5** | Final BCD Adder with behavioral model and error detection                       |


### BCD-Adder-Project/
├── Part1_HexDisplay/
├── Part2_BCDDisplay/
├── Part3_FullAdder/
├── Part4_BCDAdder_Structural/
├── Part5_BCDAdder_Behavioral/
├── README.md
├── ProjectGuide.pdf
└── .gitignore

Each part contains its own:

VHDL source files (.vhd)

Quartus project files

Simulation setup (ModelSim)

Test cases and diagrams


### 🧩 Part Summaries
🟢 Part 1: HEX Display Driver
Takes a 4-bit binary number from SW[3:0]

Displays it on HEX0 using a segment decoder (ROM-style array)

Demonstrates how to control 7-segment displays using combinational logic

✅ Logic Utilization: 15 / 49,760 (0%)


### 🟡 Part 2: BCD Display with Comparator
Converts a 4-bit binary value into two-digit decimal (d1d0)

Uses:

A comparator to detect if value > 9

A MUX to choose between V and A

A circuitA block to remap 1010–1111 to 0000–0101

HEX1 shows tens digit (0 or 1), HEX0 shows units

### 🟠 Part 3: 4-bit Ripple Carry Adder
Builds a full 4-bit binary adder using 1-bit full adder components

Inputs: A = SW[3:0], B = SW[7:4], Cin = SW[8]

Outputs: Sum on LEDR[3:0], carry out on LEDR[4]


### 🔵 Part 4: BCD Adder (Structural)
Adds two 4-bit BCD numbers with Cin and displays result in decimal

Uses:

CircuitA (for subtracting 10 when sum > 9)

MUX to select between actual sum and corrected sum

Comparator to detect if result > 9

Uses segment array to display digits

Handles sums from 0 to 19

### 🟣 Part 5: BCD Adder (Behavioral + Error Detection)
Adds two BCD digits (X and Y) and Cin

Uses behavioral process to perform logic:
<pre>
if Sum > 9 then
  D0 = Sum - 10
  D1 = 1
else
  D0 = Sum
  D1 = 0
</pre>

Adds error detection: if X or Y > 9, LEDR9 turns ON and output is blanked

Ensures safe display by guarding all segment(...) access

### 🧪 Simulation Tips (ModelSim)
To test any module:

tcl
Copy
Edit
force -freeze /DE10_LITE_Golden_Top/SW 000000011 0
run 10 ns
To avoid fatal errors, ensure:

All input signals (SWs) are defined

segment(...) is never accessed with invalid index


### ⚙️ Hardware Mapping

| Input     | Purpose     |
| --------- | ----------- |
| `SW[3:0]` | Input A / X |
| `SW[7:4]` | Input B / Y |
| `SW[8]`   | Carry-in    |

| Output      | Function           |
| ----------- | ------------------ |
| `HEX0`      | Ones digit (BCD)   |
| `HEX1`      | Tens digit (BCD)   |
| `HEX3`      | Echo X             |
| `HEX5`      | Echo Y             |
| `LEDR[3:0]` | Binary sum (debug) |
| `LEDR[4]`   | Carry-out          |
| `LEDR[9]`   | Input Error Flag   |


### 🧠 Lessons Learned
How to convert binary to decimal (BCD) using logic

When and why to use structural vs behavioral modeling

How to protect against simulator crashes due to invalid signal states

Designing reusable components like full adders, muxes, and decoders

Guarding VHDL logic from undefined behavior using checks (if unsigned < 10)


### 📷 Screenshots & Diagrams
✔️ Block diagram of the BCD Adder system

✔️ Simulation waveform from ModelSim

✔️ DE10-Lite board photos with display output

(see /images folder)


### 📝 How to Build and Upload
Open Quartus → File → Open Project → e.g. Part5_BCDAdder_Behavioral.qpf

Compile the project

Go to Tools → Programmer, load .sof file

Program DE10-Lite via USB-Blaster




