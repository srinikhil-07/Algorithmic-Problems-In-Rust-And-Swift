import Foundation

class Solution {
    // Clock hour hand moves 360 degrees in 12 hours -> 360/(12*60) = 0.5 degree per minute
    // Minute hand moves 360 in 60 minutes, 6 degree per minute
    // Hour hand -> (m+h*60)*0.5 movement for give hour and minute
    // Minute hand -> (m+h*60)*6 
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        var hourHand = hour, minuteHand = minutes
        if hour == 12 {
            hourHand = 0
        }
        if minutes == 60 {
            minuteHand = 0
            hourHand = hourHand + 1
            if hourHand > 12 {
                hourHand = hourHand - 1
            }
        }
        //the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
        //var angle = ((minuteHand+hourHand*60)*0.5) - (6.0*minuteHand)
        let hourAngle = Double(minuteHand+hourHand*60)*0.5
        let minAngle = 6.0*Double(minuteHand)
        let angle = fabs(hourAngle-minAngle)
        return min(angle, 360-angle)
    }
}

func testAngleClock() {
    print(Solution.init().angleClock(12, 30))
}

testAngleClock()