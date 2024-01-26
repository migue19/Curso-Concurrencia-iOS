import UIKit

DispatchQueue.global(qos: .utility).async {
    let myGroup: DispatchGroup = DispatchGroup()

    //3 enter -> 3 leaves
    var x = 0
    var y = 3

    DispatchQueue.global().async {
        myGroup.enter()
        print("Tarea 1")
        x = 5
        myGroup.leave()
    }

    DispatchQueue.global().async {
        myGroup.enter()
        print("Tarea 2")
        y = 9
        myGroup.leave()
    }
    
    DispatchQueue.global().async {
        myGroup.enter()
        print("Tarea 3")
        x = 5
        myGroup.leave()
    }

    DispatchQueue.global().async {
        print("Termine: el valor de x + y: \(x+y)")
    }

    myGroup.notify(queue: .main) {
        print("Termine: el valor de x + y: \(x+y)")
    }

}

