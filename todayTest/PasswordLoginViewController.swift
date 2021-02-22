//
//  PasswordLoginViewController.swift
//  todayTest
//
//  Created by IPHTECH 20 on 19/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import UIKit

class PasswordLoginViewController: UIViewController {
    var email = ""
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var warningText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        warningText.text = ""
        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        if dabaseLogin(email:email,password:passwordTextField.text!) {
            let vc = storyboard?.instantiateViewController(identifier: "TableListTableViewController") as! TableListTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            warningText.text = "Invalid Password."
        }
    }
    
    

}
