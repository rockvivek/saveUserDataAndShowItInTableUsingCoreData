//
//  LastNameViewController.swift
//  todayTest
//
//  Created by IPHTECH 20 on 19/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import UIKit

class LastNameViewController: UIViewController {

    //mark:- outlet
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var warningText: UILabel!
    
    
    //MARK:- variables
    var email = ""
    var firstname = ""
    
    //MARK:- ViewControllerDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        warningText.text = ""
    }
    
    //MARK:- nextButtonAction
    @IBAction func nextButton(_ sender: UIButton) {
        if lastNameTextField.text == "" {
            warningText.text = "last name should not be blank."
        }
        else{
            let vc = storyboard?.instantiateViewController(identifier: "PhoneViewController") as! PhoneViewController
            vc.email = email
            vc.firstname = firstname
            vc.lastname = lastNameTextField.text!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
