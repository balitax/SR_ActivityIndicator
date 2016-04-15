//
//  ViewController.swift
//  SR_Activity_Indicator
//
//  Created by Saroj on 4/7/16.
//  Copyright © 2016 Saroj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
   
    @IBOutlet weak var activityIndicator: SR_ActivityIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.centerImage = UIImage(named: "imgres.jpg")!
        activityIndicator.startAnimating()
        //activityIndicator.startAnimating()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

