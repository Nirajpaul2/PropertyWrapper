//
//  ViewController.swift
//  PropertyWrapper
//
//  Created by Niraj Paul on 14/04/22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Save the value in the form on key
    @UserDefaultWrapper(key: "token")
    static var token: String?
    
    //MARK: Save object data
    @CustomObjectUserDefaultWrapper(key: "user", defaultValue: UserData.age)
    static var user: UserData
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

}

//MARK: Capitalized initial charactor if set value for the variable
struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}

//MARK: Use Atomic wrapper to perform sync task
struct MyStruct {
    @Atomic var x = 0
}



enum UserData: String, Codable {
    case name
    case age
}
