### Program Overview
Take the last program and modify it to perform bubble sort:

#### 1. Array Element Manipulation
- Delete the code that prints out numbers and spaces
- Inside the loop, load the current array element and the next array element into two separate registers (e.g., `$t3` and `$t4`).
  - Use a 4 byte offset to do this
- Compare these two elements to determine if a swap or any other operation is needed based on your program's logic.
  - Use the `slt` instruction and `beq` to setup a conditional
- Perform the swap if the condition is met.
