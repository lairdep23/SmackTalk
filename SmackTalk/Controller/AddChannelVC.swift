//
//  AddChannelVC.swift
//  SmackTalk
//
//  Created by Evan on 8/7/17.
//  Copyright © 2017 Evan Laird. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var chanDesc: UITextField!
    
    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func createChannelPressed(_ sender: Any) {
        guard let chanName = nameText.text, nameText.text != "" else {return}
        guard let chanDesc = chanDesc.text else {return}
        
        SocketService.instance.addChannel(channelName: chanName, channelDesc: chanDesc) { (success) in
            
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
    
    func setupView() {
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
