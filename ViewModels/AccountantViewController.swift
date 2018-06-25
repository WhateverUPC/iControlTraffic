//
//  LocationViewController.swift
//  iControlTraffic
//
//  Created by Juan Manuel Santos on 25/06/18.
//  Copyright © 2018 Juan Manuel Santos. All rights reserved.
//

import UIKit

class AccountantViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveLocationAction(_ sender: UIButton) {
        // TODO: Save current Location
    }
    
    @IBAction func showLocationAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showLocation", sender: self)
    }
}


