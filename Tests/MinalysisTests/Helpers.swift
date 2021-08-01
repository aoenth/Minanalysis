import Foundation

func errorMessage(_ input: [[Int]], _ result: [[Double]], _ expectation: [[Double]]) -> String {
    """

    Input:
    \(describeField(input))
    Output:
    \(describeField(result))
    Want:
    \(describeField(expectation))
    """
}
