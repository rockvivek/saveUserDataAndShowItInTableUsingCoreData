//
//  coreDataConnection.swift
//  todayTest
//
//  Created by IPHTECH 20 on 19/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import Foundation
import CoreData
import UIKit

let app = UIApplication.shared.delegate as? AppDelegate
let context = app?.persistentContainer.viewContext

//MARK:- checkEmailAbailabilityIndatabase
func checkEmailAbailabilityIndatabase(email:String) -> Bool{
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
    request.returnsObjectsAsFaults = false
    do {
        let result = try context!.fetch(request)
        for data in result as! [NSManagedObject] {
            print(data.value(forKey: "email") as! String)
            if data.value(forKey: "email") as! String  == email {
                return true
            }
        }
    } catch {
        print(error)
        return false
    }
    return false
}

//MARK saveDataToDatabase
func saveDataToDatabase(firstname:String,lastname:String,email:String,password:String,phone:String,dob:String) ->Bool {
    
    let entity = NSEntityDescription.entity(forEntityName: "Person", in: context!)
    let user = NSManagedObject(entity: entity!, insertInto: context)
    
    user.setValue(firstname, forKey: "firstname")
    user.setValue(lastname, forKey: "lastname")
    user.setValue(email, forKey: "email")
    user.setValue(password, forKey: "password")
    user.setValue(phone, forKey: "phone")
    user.setValue(dob, forKey: "dob")
    
    do{
        try context?.save()
        return true
    } catch {
        print(error)
    }
    return false
}

//MARK:- NoOfRowsInPersonTable
func numberOfRowsInPersonTable() -> Int {
    var count = 0
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
    request.returnsObjectsAsFaults = false
    do {
        let result = try context!.fetch(request)
        for _ in result as! [NSManagedObject] {
            count = count + 1
        }
    } catch {
        print(error)
    }
    return count
}

//MARK:- DeleteRowFromTable
func deleteRowFormTable(email:String)->Bool{
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
    request.returnsObjectsAsFaults = false
    do {
        let result = try context!.fetch(request)
        for data in result as! [NSManagedObject] {
            if data.value(forKey: "email") as! String == email {
                context?.delete(data)
                do {
                    try context!.save()
                    return true
                } catch {
                    print (error)
                    return false
                }
            }
        }
    } catch {
        print(error)
        return false
    }
    return false
}

//MARK:- getEmailDAta
func getEmailData() {
     let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
       request.returnsObjectsAsFaults = false
       do {
           let result = try context!.fetch(request)
           for data in result as! [NSManagedObject] {
             emailData.append((data.value(forKey: "email") as? String)!)
           }
       } catch {
           print(error)
       }
}

func dabaseLogin(email:String,password:String)->Bool {
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
       request.returnsObjectsAsFaults = false
       do {
           let result = try context!.fetch(request)
           for data in result as! [NSManagedObject] {
               //print(data.value(forKey: "email") as! String)
               if data.value(forKey: "email") as! String  == email && data.value(forKey: "password") as! String  == password {
                   return true
               }
           }
       } catch {
           print(error)
           return false
       }
       return false
}

