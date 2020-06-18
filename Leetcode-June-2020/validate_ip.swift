import Foundation
/// - TODO: 1. Implement your own custom charcterset, 2. Read Standard lib code for characterset if available
func validIPAddress(_ IP: String) -> String {
    if IP.components(separatedBy: ".").count == 4 {
        let ipComponents = IP.components(separatedBy: ".")
        var allowed = CharacterSet()
        allowed.formUnion(.decimalDigits)
        //diagnostics will fail for filter if $0.text is called inside closure
        let invalidComp = ipComponents.filter { 
            let validInteger = $0.unicodeScalars.allSatisfy {
                allowed.contains($0)
            }
            if let comp1 = UInt($0) {
                if validInteger {
                    return comp1 <= 255 && !(($0.count > 1) && ($0[$0.startIndex] == "0")) //special case "-0"
                }
            }
            return false
        }
        if invalidComp.count == 4 {
            return "IPv4"
        }
    }
    if IP.components(separatedBy: ":").count == 8 {
        let ipComponents = IP.components(separatedBy: ":")
        let hexaSet = CharacterSet.init(charactersIn: "0123456789ABCDEFabcdef") //hexadecimal with small letters as well
        let invalidComp = ipComponents.filter {
            let validHex = $0.unicodeScalars.allSatisfy {
                hexaSet.contains($0)
            }
            return $0.count >= 1 && $0.count <= 4 && validHex
        }
        if invalidComp.count == 8 {
            return "IPv6"
        }
    }
    return "Neither"
}

func testValidIPAddress() {
    if let test = UInt("-0") {
        print(test)
        var allowed = CharacterSet()
        allowed.formUnion(.decimalDigits)
        let string = "-0"
        print(string.unicodeScalars.allSatisfy {
            allowed.contains($0)
        })
    }
    print(validIPAddress("02001:0db8:85a3:0:0:8A2E:0370:7334"))
}
//"20EE:FGb8:85a3:0:0:8A2E:0370:7334"
testValidIPAddress()