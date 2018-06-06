//
//  RegistrationTableVC.swift
//  MVVMIntro
//
//  Created by Mac on 5/29/18.
//  Copyright © 2018 eggs. All rights reserved.
//

import UIKit

class RegistrationTableVC: UITableViewController {
    
    @IBOutlet weak var fldFirstname: UITextField!
    @IBOutlet weak var fldLastname: UITextField!
    @IBOutlet weak var fldEmail: UITextField!
    @IBOutlet weak var fldPassword: UITextField!
    
    private var registrationVM: RegistrationViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSave(_ sender: UIBarButtonItem) {
        self.registrationVM = RegistrationViewModel(firstName: fldFirstname.text!, lastName: fldLastname.text!, email: fldEmail.text!, password: fldPassword.text!)
        
       self.registrationVM.save()
    }
}

