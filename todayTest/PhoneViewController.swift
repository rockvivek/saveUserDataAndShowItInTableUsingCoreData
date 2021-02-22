//
//  PhoneViewController.swift
//  todayTest
//
//  Created by IPHTECH 20 on 19/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import UIKit

class PhoneViewController: UIViewController {

    //MARK:- variables
    var email = ""
    var firstname = ""
    var lastname = ""
    
    //mark:- outlet
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phoneText: UILabel!
    
    //MARK:- ViewControllerDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        phoneText.text = ""
    }
    
    //MARK:- nextButtonAction
    @IBAction func nextButton(_ sender: UIButton) {
        if isValidPhone(phone: phoneTextField.text!) {
            let vc = storyboard?.instantiateViewController(identifier: "PasswordViewController") as! PasswordViewController
            vc.email = email
            vc.firstname = firstname
            vc.lastname = lastname
            vc.phone = phoneTextField.text!
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else {
            phoneText.text = "invalid phone number"
        }
        
    }

}
