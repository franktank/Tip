//
//  ViewController.swift
//  Tip
//
//  Created by Franky Liang on 12/4/15.
//  Copyright © 2015 FrankyLiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var finalT: UILabel!
    @IBOutlet weak var tipButton: UIButton!
    
    @IBOutlet weak var tipPercent: UITextField!
    
    @IBOutlet weak var price: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var end: UILabel!
    var priceNum = " "
    var tipNum = " "
    var answer = 0.0
    var tipPercentages = [0.15,0.18,0.2]
    var tipPercentage = 0.0
    var total = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bluesky.jpg")!)
        price.becomeFirstResponder()
        
        
        end.hidden = true
        tipAmount.hidden = true
        finalT.hidden = true
        totalAmount.hidden = true
        
        end.text = "$0.00"
        finalT.text = "$0.00"
        
        
    }
   
    
    @IBAction func onEditChange(sender: AnyObject) {
        
        
        
        tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        priceNum = price.text!
        
        if (priceNum != ""){
        answer = Double(priceNum)! * Double(tipPercentage)
        
        total = answer + Double(priceNum)!
        end.text = "$" + String(answer)
        
        end.text = String(format: "$%.2f", answer)
        
        finalT.text = "$" + String(total)
        finalT.text = String(format: "$%.2f", total)
        
        tipAmount.hidden = false
        end.hidden = false
        finalT.hidden = false
        totalAmount.hidden = false
        }
    }
    
    
    @IBAction func onEditTap(sender: AnyObject) {
        
        tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        priceNum = price.text!
        
        if (priceNum != ""){
            answer = Double(priceNum)! * Double(tipPercentage)
            
            end.text = "$" + String(answer)
            
            end.text = String(format: "$%.2f", answer)
            total = answer + Double(priceNum)!
            finalT.text = "$" + String(total)
            finalT.text = String(format: "$%.2f", total)
            tipAmount.hidden = false
            end.hidden = false
            finalT.hidden = false
            totalAmount.hidden = false}
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let intValue = defaults.integerForKey("defaultPercentageIndex")
        
        tipControl.selectedSegmentIndex = intValue
        
        onEditTap(animated)
        
    }

}

