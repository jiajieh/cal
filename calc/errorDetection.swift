
import Foundation

extension String {
    var isNumeric : Bool {
        return Double(self) != nil
    }
}

public func errorDetection(rawInput: [String]) {
    //check calculation integrity
    guard args.count % 2 == 1
        else{
            fatalError("INVALID INPUT")
    }
    
    //check invalid input (input should be "number->operator->number")
    for i in stride(from: 1, to: args.count-1, by: 2) {
        guard args[i-1].isNumeric
            else {
                fatalError("NO LEFT NUMBER")
        }

        guard (args[i].contains("+") || args[i].contains("-") || args[i].contains("x") || args[i].contains("/") || args[i].contains("%"))
            else {
                fatalError("NO OPERATOR")
        }

        guard args[i].count == 1
            else {
                fatalError("INVALID OPERATOR")
        }

        guard !args[i].isNumeric
            else {
                fatalError("MISSING OPERATOR")
        }

        guard args[i+1].isNumeric
            else {
                fatalError("NO RIGHT NUMBER")
        }
    }
    
    //change "+number" into "number"
    for i in (0...args.count-1) {
        if (args[i].count > 1 && args[i].prefix(1) == "+") {
            args[i].remove(at: args[i].startIndex)
        }
    
    }
    
    //check number bound
    for i in (0 ... args.count-1) {
        if args[i].isNumeric {
            guard Int(args[i])! >= Int.min && Int(args[i])! <= Int.max
                else {
                    fatalError("OUT OF BOUND")
            }
        }
    }
}

