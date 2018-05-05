//
//  ViewController.swift
//  Coder-Swag
//
//  Created by Alish Giri on 5/5/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.dataSource = self
        categoryTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "productCell", sender: category) // category FROM HERE
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let ProductVC = segue.destination as? ProductVC {
            
            // SETTING UP NEXT VIEW BACK BUTTON TEXT TO ""
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            
            // AS A DEVELOPER FOR DEBUGGING PURPOSE USE assert FUNCTION TO CHECK THE TYPE PASSED TO THE ProductVC IS EXPLICITLY OF TYPE Category
            assert(sender as? Category != nil) // layer of protection under development
            
            ProductVC.initProducts(category: sender as! Category) // category TO HERE
        }
    }
    
}

