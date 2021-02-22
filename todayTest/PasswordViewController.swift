//
//  PasswordViewController.swift
//  todayTest
//
//  Created by IPHTECH 20 on 19/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {

    
    //MARK:- variables
    var email = ""
    var firstname = ""
    var lastname = ""
    var phone = ""
    
    //mark:- outlet
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var warningText: UILabel!
    
    //MARK:- ViewControllerDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        warningText.text = ""
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        if isPasswordStrong(pass: passwordTextField.text!){
            let vc = storyboard?.instantiateViewController(identifier: "DobViewController") as! DobViewController
            vc.email = email
            vc.firstname = firstname
            vc.lastname = lastname
            vc.phone = phone
            vc.password = passwordTextField.text!
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            warningText.text = "Invalid Password."
        }
        
    }

}
