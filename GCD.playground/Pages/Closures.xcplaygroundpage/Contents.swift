import UIKit

let closure1 = {
    print("Hola")
}

var x = 2


let closure2 = {
    x = 10
    print("EL valor de X: \(x)")
}

closure1()

sleep(3)

closure2()
