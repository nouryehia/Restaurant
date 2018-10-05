/* OrderConfirmationViewController.swift
 Restaurant
 Lets user place an order from a menu obtained from a local server.
 --------------------------------------------------------------------------
 OpenRestaurant (included in project file) MUST BE RUNNING FOR APP TO WORK.
 --------------------------------------------------------------------------
 Created by Nour Yehia on 9/5/18.
 Copyright © 2018 Nour Yehia. All rights reserved. */

import UIKit

// ADD COMMENTS!!!!!!
class OrderConfirmationViewController: UIViewController {
    
    var minutes: Int!
    
    @IBOutlet weak var timeLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = "Thank you for your order! Your wait time is aproximately \(minutes!) minutes."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
