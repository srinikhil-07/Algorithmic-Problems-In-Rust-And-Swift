import Foundation

func islandPerimeter(_ grid: [[Int]]) -> Int {
    var perimeter = 0
    let rows = grid.count
    let columns = grid[0].count
    for row in 0..<rows {
        for col in 0..<columns {
            print("\(row), \(col)")
            if grid[row][col] == 1 {//for each 1 in the matrix
            // edges by default have 1 unit  of perimeter
                if row == 0  {
                    perimeter = perimeter + 1
                } else {
                    if grid[row-1][col] != 1 {
                        perimeter = perimeter + 1
                    } 
                }
                if row == rows-1 {
                    perimeter = perimeter + 1
                } else {
                    if grid[row+1][col] != 1 {
                        perimeter = perimeter + 1
                    }
                }
                if col == 0  {
                    perimeter = perimeter + 1
                } else {
                    if grid[row][col-1] != 1 {
                        perimeter = perimeter + 1
                    } 
                }
                if col == columns-1 {
                    perimeter = perimeter + 1
                } else {
                    if grid[row][col+1] != 1 {
                        perimeter = perimeter + 1
                    }
                }
            }
            print("\(perimeter)")
        }
    }
    return perimeter
}
//test function
func testIslandPerimeter() {
    let input = [[0,1,0,0],
                [1,1,1,0],
                [0,1,0,0],
                [1,1,0,0]]
    print(islandPerimeter(input))
}
testIslandPerimeter()