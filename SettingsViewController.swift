//
//  SettingsViewController.swift
//  Tip
//
//  Created by Franky Liang on 12/5/15.
//  Copyright © 2015 FrankyLiang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercent: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        
        let intValue = defaults.integerForKey("defaultPercentageIndex")
        tipPercent.selectedSegmentIndex = intValue
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func userDefault(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipPercent.selectedSegmentIndex, forKey:"defaultPercentageIndex")
        defaults.synchronize()
    }

    
    @IBAction func exitView(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
