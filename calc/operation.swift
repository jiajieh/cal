
import Foundation

public class operation {
    //identify priority
    class func oper (input: inout [String]) {
        var highPriorityOperator = ["x", "/", "%"]
        var lowPriorityOperator = ["+", "-"]
        var result = ""
        
        //identify operators and calculation
        func calculation (L:String, operators:String, R:String) -> Int {
            let leftNumber = Int(L)!
            let rightNumber = Int(R)!
            
            switch operators {
            case "x":
                return leftNumber * rightNumber
            case "/":
                return leftNumber / rightNumber
            case "%":
                return leftNumber % rightNumber
            case "+":
                return leftNumber + rightNumber
            case "-":
                return leftNumber - rightNumber
            default:
                return 0
            }
        }

        //execute "x", "/" and "%" operation
        for i in (0...input.count-1) {
            if (input[i].count == 1 && highPriorityOperator.contains(input[i])) {
                input[i+1] = String(calculation(L: input[i-1], operators: input[i], R: input[i+1]))
                input[i-1] = "0"
                if (i > 1){
                    input[i] = input[i-2]
                }
                else {
                    input[i] = "+"
                }
        
            }
        }

        //execute "+" and "-" operation
        for i in (0...input.count-1) {
            if (input[i].count == 1 && lowPriorityOperator.contains(input[i])) {
                input[i+1] = String(calculation(L: input[i-1], operators: input[i], R: input[i+1]))
            }
        }
        result = String(input[input.count-1])
        print (result)

    }
}
