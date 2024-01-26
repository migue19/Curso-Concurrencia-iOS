import UIKit


DispatchQueue.main.async {
    print("Hola")
}
DispatchQueue.global().async {
    print("Global 1")
}
DispatchQueue.global().async {
    print("Global 2")
}
DispatchQueue.global().async {
    print("Global 3")
}
DispatchQueue.global(qos: .userInteractive).async {
    print("Global userInteractive")
}
DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 3) {
    print("Global userInteractive after")
}

let dispatch = DispatchQueue(label: "com.banregio.serializada")
let dispatchConcurrent = DispatchQueue(label: "com.banregio.concurrente", qos: .userInitiated, attributes: .concurrent)

dispatchConcurrent.sync {
    print("serial 1")
}
dispatchConcurrent.sync {
    print("serial 2")
}

dispatchConcurrent.async {
    print("concurrente 1")
}
dispatchConcurrent.async {
    print("concurrente 2")
}

dispatchConcurrent.schedule(after: .init(.now() + 60), tolerance: .seconds(1)) {
    print("schedule")
}



DispatchQueue.concurrentPerform(iterations: 10) { index in
    print("concurrentPerform: \(index)")
}
