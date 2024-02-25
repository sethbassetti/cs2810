### Program Overview
Take the last program and modify it to perform bubble sort:

#### 1. Array Element Manipulation
- Make sure you don't go out of bounds by subtracting 1 from the register that stores the array size
- Delete the code that prints out numbers and spaces
- Inside the loop, load the current array element and the next array element into two separate registers (e.g., `$t3` and `$t4`).
  - Use the `lw` instruction with the base address to load array[i], and the base address with an offset of 4 to load array[i+1]
- Compare these two elements to determine if a swap or any other operation is needed based on your program's logic.
  - `slt r1, r2, r3` stores a 1 in r1 if r2 < r3, otherwise it stores a 0
  - Combine this with the `beq` instruction to branch if array[i+1] < array[i]
- If array[i + 1] < array[i], swap the elements and store them back in memory
  - Use the `sw` instruction to store them back in memory
