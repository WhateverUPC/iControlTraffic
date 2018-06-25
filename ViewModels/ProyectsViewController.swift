//
//  HomeViewController.swift
//  iTrafficControl
//
//  Created by Juan Manuel Santos on 19/06/18.
//  Copyright © 2018 Juan Manuel Santos. All rights reserved.
//

import UIKit

class ProyectsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       self.performSegue(withIdentifier: "showOnboarding", sender: self)
    }
    
}
