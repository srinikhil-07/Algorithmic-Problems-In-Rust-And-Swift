import Foundation

// O's on border and O's connected to border O's shouldn't be touched
// horizontal and vertical connection 

func solve(_ board: inout [[Character]]) {
    let xSize = board.count - 1
    let ySize = board[0].count - 1
    if xSize <= 1 || ySize <= 1 { //any 2XN or NX2 should be intact
        return
    }
    for i in 1..<xSize {
        for j in 1..<ySize {
            print("board[\(i),\(j)] \(board[i][j])")
            if board[i][j] == "O" {
                print("O at: \(i),\(j)")
                if board[i-1][j] == "X" || board[i+1][j] == "X" || board[i][j-1] == "X" || board[i][j+1] == "X" {
                    if i-1 == 0 || i+1 == xSize-1 || j-1 == 0 || j+1 == ySize-1 { // adjacent to border
                        if i-1 == 0 && board[i-1][j] == "O" {
                            print("we have a O at \(i-1),\(j)")
                            continue;
                        }
                        if i+1 == xSize && board[i+1][j] == "O" {
                            print("we have a O at \(i+1),\(j)")
                            continue;
                        }
                        if j-1 == 0 && board[i][j-1] == "O" {
                            print("we have a O at \(i),\(j-1)")
                            continue;
                        }
                        if j+1 == ySize && board[i][j+1] == "O" {
                            print("we have a O at \(i),\(j+1)")
                            continue;
                        }
                    }
                    board[i][j] = "X"
                }
            }
        }
    }
}
func testSolve() {
    var test = [[Character]]()
    test = [["X","O","X","O","X","O"],
            ["O","X","O","X","O","X"],
            ["X","O","X","O","X","O"],
            ["O","X","O","X","O","X"]]
    print(test[0].capacity)
    solve(&test)
    print(test)
}
testSolve()

// [["X","O","X","O","X","O"],["O","X","X","X","O","X"],["X","X","X","O","X","O"],["O","X","O","X","O","X"]]
// [["X","O","X","O","X","O"],["O","X","X","X","X","X"],["X","X","X","X","X","O"],["O","X","O","X","O","X"]]