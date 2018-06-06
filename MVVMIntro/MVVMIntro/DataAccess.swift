//
//  DataAccess.swift
//  MVVMIntro
//
//  Created by Mac on 5/29/18.
//  Copyright © 2018 eggs. All rights reserved.
//

import Foundation

class DataAccess {
    
     func getAllUsers() -> [User] {
        
        var users = [User]()
        users.append(User(firstname: "Super", lastname: "Man", email: "super@man.com", password: "password"))
        users.append(User(firstname: "Bat", lastname: "Man", email: "bat@man.com", password: "password"))
        users.append(User(firstname: "Hawk", lastname: "Girl", email: "hawk@girl", password: "password"))
        users.append(User(firstname: "Wonder", lastname: "Woman", email: "wonder@woman.com", password: "password"))
        
        return users
    }
}
