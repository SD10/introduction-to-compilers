/*: 
 # IR Generation (Intermediate Representation)
 
 While the tree structure generated by the parser is very good at highlighting the semantics of Swift code, later phases of the compiler are simpler if they can operate on an unnested, linear stream of instructions.
 
 The compiler will thus transform the AST generated by the parser into an *Intermediate Representation (IR)*. Each funtion in the IR consists of multiple *basic blocks*. These basic blocks, in turn, consist of basic instructions like `add` or `compare` and terminate with `branch`, `jump`, or `return` that transfer control flow to a different block (conditionally or unconditionally respectively) or return from the current function.
 
 For example, the instruction `add %1, 2 -> %2` means that we want to add `2` to the value of variable `%1` and store the result in variable `%2`. In the context of IR and assembly, these variables are often called *registers*.
 
 * note:
 If you are familiar with Assembly code, the IR presented here may look very familiar. Compilers that are more advanced than the one we study right now have features in their IR that cannot be represented in assembly like assigning a variable based on which block was executed previously (the so-called ϕ-function). These simplify later analysis.
 
 */
let sourceFile: SwiftFile = #fileLiteral(resourceName: "Fibonacci.swift")
/*:
 * callout(Discover):
 Use the IR debugger on the right to explore how the IR generated for the program above gets executed by stepping through the instructions. \
Change the source file to see the IR for different programs.
 
 [❮ Back to the parser](Parser)

 [❯ Continue with optimisation](Optimisation)
 
 ---
 */
// Setup for the live view
import PlaygroundSupport
PlaygroundPage.current.liveView = DebuggerView(forSourceFile: sourceFile)
