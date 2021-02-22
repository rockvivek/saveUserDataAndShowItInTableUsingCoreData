//
//  ProfilePageViewController.swift
//  todayTest
//
//  Created by IPHTECH 20 on 19/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import UIKit
import CoreData

class ProfilePageViewController: UIViewController {
    var emailid = ""
    
    //MARK:- outlet
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var firstname: UILabel!
    
    //MARK:- View controller delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
           request.returnsObjectsAsFaults = false
        
        print(emailid)
        do {
               let result = try context!.fetch(request)
               for data in result as! [NSManagedObject] {
                if data.value(forKey: "email") as! String == emailid{
                    print(data)
                    firstname.text = "FirstName: \(data.value(forKey: "firstname") as! String)"
                    lastname.text = "LastName: \(data.value(forKey: "lastname") as! String)"
                    email.text = "Email: \(data.value(forKey: "email") as! String)"
                    phone.text = "Phone: \(data.value(forKey: "phone") as! String)"
                    dob.text = "Dob: \(data.value(forKey: "dob") as! String)"
                 }
               }
           } catch {
               print(error)
           }
        
    }
    
    
    

}
