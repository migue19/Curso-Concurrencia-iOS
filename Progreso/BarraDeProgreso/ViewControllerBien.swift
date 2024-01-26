//
//  ViewController.swift
//  BarraDeProgreso

import UIKit

class ViewControllerBien: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var botonComenzar: UIButton!
    @IBOutlet weak var botonParar: UIButton!
    
    var timer:Timer?
    var segundos = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
    }

    @IBAction func comenzar(_ sender: UIButton) {
        botonComenzar.isEnabled = false
        botonParar.isEnabled = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            DispatchQueue.global().async {
                self.segundos += 1
                if self.segundos == 60 {
                    timer.invalidate()
                    DispatchQueue.main.async {
                        self.progressBar.progress = 1.0
                        self.botonComenzar.isEnabled = true
                    }
                } else {
                    DispatchQueue.main.async {
                        self.progressBar.progress = Float(self.segundos) / 60.0
                    }
                }
            }
        }
    }
    
    @IBAction func parar(_ sender: UIButton) {
        timer?.invalidate()
        progressBar.progress = 0.0
        botonParar.isEnabled = false
        botonComenzar.isEnabled = true
    }
}

