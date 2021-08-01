import Foundation

func describeField<T: Numeric>(_ field: [[T]]) -> String {
    let digitsToShow = 4
    var result = ""
    for row in field {
        for col in row {
            let string: String
            if let col = col as? Double {
                string = String(format: "%.2f", col)
            } else if let col = col as? Int {
                string = String(describing: col)
            } else {
                fatalError("Invalid numeric type")
            }
            let length = string.count
            let numberOfPaddings = digitsToShow - length
            let padding = String(repeating: " ", count: numberOfPaddings + 1)
            result += padding + string + " "
        }
        result += "\n"
    }
    return result
}
