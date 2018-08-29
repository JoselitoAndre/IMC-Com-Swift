//
//  ViewController.swift
//  IMC
//
//  Created by andre araujo on 23/08/2018.
//  Copyright © 2018 andre araujo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tFWeight: UITextField!
    @IBOutlet weak var tFHeight: UITextField!
    @IBOutlet weak var iBResult: UILabel!
    @IBOutlet weak var iVResult: UIImageView!
    var imc: Double = 0
    
    @IBOutlet weak var viResult: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func calculet(_ sender: Any) {
        if let wight = Double (tFWeight.text!), let height = Double (tFHeight.text!){
            let heightCm = height/100
            imc = wight / pow(heightCm,2)
            showResults()
        }
        
    }
    func showResults(){
        var result: String = ""
        var image : String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do Peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        iBResult.text = "\(Int (imc)): \(result)"
        iVResult.image = UIImage (named: image)
        viResult.isHidden = false
        view.endEditing(true)
    }
    
}

