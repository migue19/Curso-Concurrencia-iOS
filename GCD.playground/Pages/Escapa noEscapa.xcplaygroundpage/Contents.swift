import UIKit


var array: [() -> ()] = []

class Test {
    var x = 10
    
    func noEscapa(completion: () -> ()) {
        //array.append(completion)
        
        completion()
    }
    
    func escapa(completion: @escaping () -> ()) {
        array.append(completion)
    }
    
    func testing() {
        escapa { [unowned self] in
            self.x = 17
            print("El valor de x: \(self.x)")
        }
    }
}

do {
    var test = Test()
    test.noEscapa {
        print("Hola")
    }
    test.testing()
}

//array.first!()
