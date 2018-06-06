//
//  ConcentrationThemeChooseVCViewController.swift
//  Concentration
//
//  Created by Mac on 6/6/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class ConcentrationThemeChooseVCViewController: UIViewController, UISplitViewControllerDelegate {
    
    let themes = [
        "Sports": "⚽️🏀🏈⚾️🎾🏐🏒🏂🚴🏻‍♀️🥌🥊🧘🏿‍♀️",
        "Animals": "🐶🐭🦋🐚🐸🦀🐳🐜🐓🐲🐇🐿",
        "Faces": "🤕🤑😐👩🏻💂🏻‍♀️👩🏻‍🏫😷👮🏾‍♀️👩🏻‍🚒🧝🏻‍♂️💆🏽‍♂️💇🏼‍♀️"
    ]
    
    
    // IT IS CALLED ON EVERY OBJECT THAT COMES OUT FROM THE INTERFACE BUILDER
    override func awakeFromNib() {
        splitViewController?.delegate = self
    }
    
    
    // this is implemented so that split view default behaviour of loading the detail view is changed to the false and the initial view that will be loaded will be theme selection view i.e. this view.
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnChooseTheme(_ sender: Any) {
        if let cvc = splitViewDetailConcentrationController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
        } else if let cvc = lastSeguedToConcentrationViewController {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                cvc.theme = theme
            }
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            performSegue(withIdentifier: "Choose Theme", sender: sender)
        }
    }
    
    private var splitViewDetailConcentrationController: ConcentrationViewController? {
        return splitViewController?.viewControllers.last as? ConcentrationViewController
    }
    
    // MARK: - Navigation
    private var lastSeguedToConcentrationViewController: ConcentrationViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                    lastSeguedToConcentrationViewController = cvc
                }
            }
        }
    }
    
    
}
