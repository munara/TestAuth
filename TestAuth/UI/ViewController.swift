//
//  ViewController.swift
//  TestAuth
//
//  Created by Munara on 6/1/20.
//  Copyright © 2020 Munara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var responseObject: ResponseObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapGoButton(_ sender: UIButton) {
        guard let loginText = loginTextField.text,
            let passwordText = passwordTextField.text else {
            return
        }
        if loginText != "" && passwordText != "" {
            NetworkManager.shared.signin(with: loginText, password: passwordText) {[weak self] result in
                switch result {
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let data):
                    self?.responseObject = data
                    DispatchQueue.main.async {
                         self?.performSegue(withIdentifier: "SegueToSecondView", sender: nil)
                    }
                   
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToSecondView" {
            if let destinationViewController = segue.destination as? SecondViewController {
                destinationViewController.responseObject = self.responseObject
            }
        }
    }
    
}

