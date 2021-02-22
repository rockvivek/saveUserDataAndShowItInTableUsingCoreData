//
//  DobViewController.swift
//  todayTest
//
//  Created by IPHTECH 20 on 19/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import UIKit

class DobViewController: UIViewController {

     //MARK:- variables
       var email = ""
       var firstname = ""
       var lastname = ""
       var phone = ""
       var password = ""
       
        let datePicker = UIDatePicker()
    
       //MARK:- outlet
       @IBOutlet weak var dobTextField: UITextField!
       @IBOutlet weak var warningText: UILabel!
    
       //MARK:- ViewControllerDelegate
       override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.hidesBackButton = true
            warningText.text = ""
            showDatePicker()
       }
       
         func showDatePicker(){
           //Formate Date
           datePicker.datePickerMode = .date

          //ToolBar
          let toolbar = UIToolbar();
          toolbar.sizeToFit()
          let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
         let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

         dobTextField.inputAccessoryView = toolbar
         dobTextField.inputView = datePicker

        }

         @objc func donedatePicker(){

          let formatter = DateFormatter()
          formatter.dateFormat = "dd/MM/yyyy"
          dobTextField.text = formatter.string(from: datePicker.date)
          self.view.endEditing(true)
        }

        @objc func cancelDatePicker(){
           self.view.endEditing(true)
         }
        
        
        
       //MARK:- saveButtonAction
       @IBAction func saveButton(_ sender: Any) {
           print(email,password,firstname,lastname,phone,dobTextField.text!)
        if saveDataToDatabase(firstname: firstname, lastname: lastname, email: email, password: password, phone: phone, dob: dobTextField.text!){
               print("data save in database")
               let vc = storyboard?.instantiateViewController(identifier: "TableListTableViewController") as! TableListTableViewController
               self.navigationController?.pushViewController(vc, animated: true)
           }
        else {
            print("something went wrong")
        }
       }

}
