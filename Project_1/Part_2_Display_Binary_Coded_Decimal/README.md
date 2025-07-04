# Part II – Binary to Decimal Conversion with MUX & Comparator

**Author**      : Sanjida Orin Tawhid   
**Project**     : C4M1P2  
**Board**       : DE10-Lite  
**Quartus**     : 16.1 Lite Edition  

---

## 🔍 Overview

Displays a 4-bit binary value (0–15) as two decimal digits using a comparator, subtractor (`circuitA`), and a 2-to-1 multiplexer. Implements correction when value exceeds 9 (i.e., 10–15).

---

## 🔧 Signal Map

| Signal | Description              |
|--------|--------------------------|
| SW[3:0] | Binary input V          |
| HEX0    | Decimal ones digit      |
| HEX1    | Decimal tens digit      |

| Internal Blocks Used |
|----------------------|
| `comparator_4_bit.vhd` |
| `circuitA.vhd`         |
| `MUX_2_to_1.vhd`       |

---

## 🗂 Files

- `C4M1P2.vhd`
- `comparator_4_bit.vhd`
- `circuitA.vhd`
- `MUX_2_to_1.vhd`

---

## 🧪 Test Examples

| V (SW3–0) | Expected HEX1 HEX0 |
|-----------|---------------------|
| 0101      | 0 5                 |
| 1010      | 1 0                 |
| 1111      | 1 5                 |

---

## 🛠 How to Run

1. Open `C4M1P2.qpf` in Quartus.
2. Compile the project.
3. Load `.sof` into DE10-Lite.
4. Use SW[3:0] to provide input.

---

## Notes

- MUX selects V or A based on Z (V > 9).
- Only concurrent statements used — no IF or CASE.
