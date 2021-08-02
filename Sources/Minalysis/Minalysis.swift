func analyze(_ field: [[Int]]) throws -> [[Double]] {
    guard field.count > 0 else {
        throw AnalysisError.zeroDimension
    }
    let height = field.count
    let width = field[0].count
    guard width > 0 else {
        throw AnalysisError.zeroDimension
    }
    var result = [[Double]](repeating: [Double](repeating: 0, count: width), count: height)
    for row in 0 ..< height {
        for col in 0 ..< width {
            guard field[row][col] != -1 else {
                continue
            }
            let explored = explore(row: row, col: col, width: width, height: height, mineField: field, depth: 2)
            let prediction: Double = Double(field[row][col]) / Double(9 - explored)
            mark(row: row, col: col, width: width, height: height, field: field, result: &result, depth: 2, prediction: prediction)
        }
    }
    return result
}

typealias ExplorationResult = Int

func explore(row: Int, col: Int, width: Int, height: Int, mineField: [[Int]], depth: Int) -> ExplorationResult {
    guard depth > 0 else { return 0 }
    guard col < width, col >= 0 else { return 1 }
    guard row < height, row >= 0 else { return 1 }
    guard mineField[row][col] != -1 else {
        return 0
    }

    var explored = 1
    // upper left
    explored += explore(row: row - 1, col: col - 1, width: width, height: height, mineField: mineField, depth: depth - 1)

    // left
    explored += explore(row: row, col: col - 1, width: width, height: height, mineField: mineField, depth: depth - 1)

    // lower left
    explored += explore(row: row + 1, col: col - 1, width: width, height: height, mineField: mineField, depth: depth - 1)

    // down
    explored += explore(row: row + 1, col: col, width: width, height: height, mineField: mineField, depth: depth - 1)

    // lower right
    explored += explore(row: row + 1, col: col + 1, width: width, height: height, mineField: mineField, depth: depth - 1)

    // right
    explored += explore(row: row, col: col + 1, width: width, height: height, mineField: mineField, depth: depth - 1)

    // upper right
    explored += explore(row: row - 1, col: col + 1, width: width, height: height, mineField: mineField, depth: depth - 1)

    // top
    explored += explore(row: row - 1, col: col, width: width, height: height, mineField: mineField, depth: depth - 1)

    return explored
}

func mark(row: Int, col: Int, width: Int, height: Int, field: [[Int]], result: inout [[Double]], depth: Int, prediction: Double) {
    guard depth > 0 else { return }
    guard col < width, col >= 0 else { return }
    guard row < height, row >= 0 else { return }

    if field[row][col] == -1 {
        result[row][col] = prediction
    }

    // upper left
    mark(row: row - 1, col: col - 1, width: width, height: height, field: field, result: &result, depth: depth - 1, prediction: prediction)

    // left
    mark(row: row, col: col - 1, width: width, height: height, field: field, result: &result, depth: depth - 1, prediction: prediction)

    // lower left
    mark(row: row + 1, col: col - 1, width: width, height: height, field: field, result: &result, depth: depth - 1, prediction: prediction)

    // down
    mark(row: row + 1, col: col, width: width, height: height, field: field, result: &result, depth: depth - 1, prediction: prediction)

    // lower right
    mark(row: row + 1, col: col + 1, width: width, height: height, field: field, result: &result, depth: depth - 1, prediction: prediction)

    // right
    mark(row: row, col: col + 1, width: width, height: height, field: field, result: &result, depth: depth - 1, prediction: prediction)

    // upper right
    mark(row: row - 1, col: col + 1, width: width, height: height, field: field, result: &result, depth: depth - 1, prediction: prediction)

    // top
    mark(row: row - 1, col: col, width: width, height: height, field: field, result: &result, depth: depth - 1, prediction: prediction)
}



enum AnalysisError: Error {
    case zeroDimension
}
