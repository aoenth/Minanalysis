# Minalysis

Analyzes probabilities of each unexplored mine in a game of Minesweeper. 

## Usage
The function `analyze` takes in a 2D array of integers. `-1` represents unexplored mines, `0-8` represent the number of mines withinin the 3x3 square it occupies. 

The result is a 2D array of  `Double` representing the probability of the mine with the same coordinates as the input. 

```swift
let mineField = [
    [-1, -1, -1],
    [-1,  1, -1],
    [-1, -1, -1],
]

let result = analyze(mineField)

/*
result = [
    [0.125, 0.125, 0.125],
    [0.125,     0, 0.125],
    [0.125, 0.125, 0.125],
]
*/
```
