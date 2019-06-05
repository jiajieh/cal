
import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

//run errorDetection
errorDetection(rawInput: args)

//run operation
operation.oper(input: &args)

