//
//  SecondViewController.swift
//  TestAuth
//
//  Created by Munara on 6/2/20.
//  Copyright © 2020 Munara. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    var responseObject: ResponseObject?
    
    @IBOutlet weak var identifierLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        identifierLabel.text = responseObject?.identifier
        loginLabel.text = responseObject?.login
    }
}
