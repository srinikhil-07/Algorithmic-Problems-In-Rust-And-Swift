import Foundation
/// To test tuple return with try?
func returnSingle() throws -> String {
    return "Swift"
}
func returnTuple() throws -> (String, String)? {
    return ("Swift", "Five")
}
func returnTupleWithoutThrows() -> (String, String) {
    return ("Swift", "Five")
}
func test() {
    let test0 = try? returnSingle()
    print(test0 ?? "")
    let tuple = try? returnTuple()
    //less standard way
    let (test1, test2) = returnTupleWithoutThrows()
    //let (test3, test4) = try? returnTuple() --> error
}