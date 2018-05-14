//
//  AddChannelViewController.swift
//  Smack Chat
//
//  Created by Mac on 5/14/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var fldName: UITextField!
    @IBOutlet weak var fldDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func btnClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCreateChannel(_ sender: Any) {
        guard let channelName = fldName.text, fldName.text != "" else { return }
        guard let channelDescription = fldDescription.text, fldDescription.text != "" else { return }
        
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDescription) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTapped(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        fldName.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        fldDescription.attributedPlaceholder = NSAttributedString(string: "Description", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
    }
    
    @objc func closeTapped(_ recogniser: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
