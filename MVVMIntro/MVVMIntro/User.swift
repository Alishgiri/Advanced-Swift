//
//  File.swift
//  MVVMIntro
//
//  Created by Mac on 5/29/18.
//  Copyright © 2018 eggs. All rights reserved.
//

import Foundation


class User {
    
    var firstName: String!
    var lastName: String!
    var email: String!
    var password: String!
    
    init(firstname: String, lastname: String, email: String, password: String) {
        self.firstName = firstname
        self.lastName = lastname
        self.email = email
        self.password = password
    }
    
    init(vm: RegistrationViewModel) {
        self.firstName = vm.firstName
        self.lastName = vm.lastName
        self.email = vm.email
        self.password = vm.password
    }
    
}
