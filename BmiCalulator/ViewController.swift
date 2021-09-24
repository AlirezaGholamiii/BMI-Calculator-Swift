//  ViewController.swift
//  BmiCalulator
//  Created by Alireza Gholami - 1931230.

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblResult.isHidden = true
        
        btnCalculate.layer.cornerRadius = 10
        btnCalculate.clipsToBounds = true
    }

    @IBOutlet weak var btnCalculate: UIButton!
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    
    @IBAction func txtheightChanged(_ sender: Any) {
        
        lblResult.isHidden = true
        
    }
    
    @IBAction func txtWeghtChanged(_ sender: Any) {
        
        lblResult.isHidden = true
        
    }
    
    @IBAction func btnCalculate(_ sender: Any) {
        
        var height : Float
        
        var weight : Float
        
        var bmi : Float
        
        
        height = Float(txtHeight.text ?? "0")!
        
        weight = Float(txtWeight.text ?? "0")!
        
        if (height < 80 || height > 250) {
            Toast.ok(view: self, title: "Review the height", message: "Enter a height between 80cm and 250cm")
            return
        }
        else if(weight < 30 || weight > 300){
            Toast.ok(view: self, title: "Review the weight", message: "Enter a weight between 30kg and 300kg")
            return
        }
        else{
            lblResult.isHidden = false
            let heightMeters : Float = height / 100
            let heightTimesHeight : Float = heightMeters * heightMeters
            bmi = weight / heightTimesHeight
            bmi = round(bmi * 10) / 10.0
            
            
            if(bmi < 18.5){
                lblResult.text = "BMI Classification = Underweight!"
                lblResult.backgroundColor = UIColor.blue
            }
            else if(bmi < 24.9){
                lblResult.text = (" BMI Classification = Normal Weight")
                lblResult.backgroundColor = UIColor.green
            }
            else if(bmi < 29.9){
                lblResult.text = (" BMI Classification = Overweight")
                lblResult.backgroundColor = UIColor.yellow
            }
            else if(bmi < 100){

                lblResult.text = (" BMI Classification = Obese")
                lblResult.backgroundColor = UIColor.orange
            }
        }
    }
    @IBOutlet weak var lblResult: UILabel!
    
    
}

