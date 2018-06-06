//
//  UsersListVM.swift
//  MVVMIntro
//
//  Created by Mac on 5/29/18.
//  Copyright © 2018 eggs. All rights reserved.
//

import Foundation


class UsersListVM {
    
    var userVMs = [UserVM]()
    private var dataAccess: DataAccess
    
    init(dataAccess: DataAccess) {
        self.dataAccess = dataAccess
        populateUsers()
    }
    
    private func populateUsers() {
        let users = self.dataAccess.getAllUsers()
        self.userVMs = users.map { user in
            return UserVM(user: user)
        }
    }
}


class UserVM {
    
    var firstName: String!
    var lastName: String!
    
    init(user: User) {
        self.firstName = user.firstName
        self.lastName = user.lastName
    }
}
