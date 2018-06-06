//
//  UsersTableVC.swift
//  MVVMIntro
//
//  Created by Mac on 5/29/18.
//  Copyright © 2018 eggs. All rights reserved.
//

import UIKit

class UsersTableVC: UITableViewController {
    
    private var usersListVM: UsersListVM!
    private var dataAccess = DataAccess()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usersListVM = UsersListVM(dataAccess: self.dataAccess)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersListVM.userVMs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let userVM = self.usersListVM.userVMs[indexPath.row]
        cell.textLabel?.text = "\(userVM.firstName!), \(userVM.lastName!)"
        return cell
    }

}
