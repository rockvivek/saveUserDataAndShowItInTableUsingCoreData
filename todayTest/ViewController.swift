//
//  ViewController.swift
//  todayTest
//
//  Created by IPHTECH 20 on 19/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- outlet
    @IBOutlet weak var emaiIdTextField: UITextField!
    @IBOutlet weak var warningTextLabel: UILabel!
    
    //MARK:- variables
    var emailId = ""
        
    //MARK:- ViewControllerDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        warningTextLabel.text = ""
    }
        
    //MARK:- nextButtonAction
    @IBAction func nextButton(_ sender: UIButton) {
        emailId = emaiIdTextField.text!
        print("email: \(emailId)")
//        print(numberOfRowsInPersonTable())
        if checkEmailAbailabilityIndatabase(email: emailId){
            print("email id is present")
            let vc = storyboard?.instantiateViewController(identifier: "PasswordLoginViewController") as! PasswordLoginViewController
            vc.email = emailId
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        else if(!emailValidation(email:emailId)) {
            warningTextLabel.text = "Please enter a valid email id."
        }
        else {
        //code when email is not present"
        let vc = storyboard?.instantiateViewController(identifier: "FirstNameViewController") as! FirstNameViewController
        vc.email = emailId
        self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

