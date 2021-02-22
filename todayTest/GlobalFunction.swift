
//
//  GlobalFunction.swift
//  todayTest
//
//  Created by IPHTECH 20 on 19/02/21.
//  Copyright © 2021 iPHTech20. All rights reserved.
//

import Foundation
import CoreData

let dot = "."
let atdret = "@"
var emailData = [String]()
var emailID = ""

//MARK:- emailValidation
func emailValidation(email:String) ->Bool {
    if email.contains("@") && email.contains(".") && lenBetweenCharDotAndAdret(email: email)>=2 {
        return true
    }
    return false
}

func lenBetweenCharDotAndAdret(email:String) -> Int {
    var posDot = -1
    var posAdret = -1
    var len = 0
    if let idx = email.firstIndex(of: ".") {
        posDot = email.distance(from:email.startIndex, to: idx)
    }
    if let idx = email.firstIndex(of: "@") {
        posAdret = email.distance(from:email.startIndex, to: idx)
    }
    len = posDot - posAdret - 1
    return len
}

func isValidPhone(phone:String) -> Bool{
    if Int(phone) != nil && phone.count == 10 {
        return true
    }
    return false
}
func isPasswordStrong(pass:String) -> Bool{
    let len = pass.count
    if len >= 8 && isPasswordHaveDigits(password: pass) && isPasswordHaveCharacters(password: pass) {
        return true
    }
    return false
}

func isPasswordHaveDigits(password:String) -> Bool {
    for char in password {
        if char >= "0" && char <= "9" {
            return true
        }
    }
    return false
}
func isPasswordHaveCharacters(password: String) -> Bool {
    for char in password {
        if char >= "a" && char <= "z" || char >= "A" && char <= "Z"  {
            return true
        }
    }
    return false
}

