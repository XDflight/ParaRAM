# ParaRAM

**ParaRAM** is a **zero-delay** 512x16 bits SRAM built on ***GlobalFoundries 180nm Process*** that can run up to **10MHz (100ns for each read/write)**.

## Basic Info

- **Package:** 6x10 WLCSP

- **Word width:** 16 bits

- **Address width:** 9 bits

- **Fmax:** 10MHz

## Pin Definition

![](https://caravel-harness.readthedocs.io/en/latest/_images/package_as_viewed_from_the_bottom.svg)

**Pin**|**Definition**
-|-
_C4, F10_|3.3V Power Supply
_A10, F2_|1.8V Power Supply
_C5, C6, D5, D6, F6_|Ground
_E7_|Clock
_F7_|Write Control
_E5_|Enable
_F5_|Data[0]
_E4_|Data[1]
_F4_|Data[2]
_E3_|Data[3]
_F3_|Data[4]
_D3_|Data[5]
_E2_|Data[6]
_F1_|Data[7]
_E1_|Data[8]
_D2_|Data[9]
_D1_|Data[10]
_C1_|Data[11]
_C2_|Data[12]
_B1_|Data[13]
_B2_|Data[14]
_A1_|Data[15]
_C3_|Address[0]
_A3_|Address[1]
_B4_|Address[2]
_A4_|Address[3]
_B5_|Address[4]
_A5_|Address[5]
_B6_|Address[6]
_A6_|Address[7]
_A7_|Address[8]

## Usage Tips

- Connect the power pins to proper power supplies.

- Provide a stable, 50% duty-cycle clock. It should be 180 degrees out-of-phase to the **data**, **address**, **write control**, and **enable** signals.

- Set the **write control** pin to HIGH for writing data and to LOW for reading data. 

- Set the **enable** pin to HIGH to commit the the command.
