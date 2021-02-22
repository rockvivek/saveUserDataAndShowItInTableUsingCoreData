//
//  FirstNameViewController.swift
//  todayTest
//
//  Created by IPHTECH 20 on 19/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import UIKit

class FirstNameViewController: UIViewController {

    //MARK:- outlet
    @IBOutlet weak var warningText: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    //MARK:- variables
    var email = ""
    
    //MARK:- ViewControllerDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        warningText.text = ""
        navigationItem.hidesBackButton = true
    }
    
    //MARK:- nextButtonAction
    @IBAction func nextButton(_ sender: UIButton) {
        if firstNameTextField.text == "" {
            warningText.text = "first name should not be blank."
        }
        else{
            let vc = storyboard?.instantiateViewController(identifier: "LastNameViewController") as! LastNameViewController
            vc.email = email
            vc.firstname = firstNameTextField.text!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
