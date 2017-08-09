//
//  ChatVC.swift
//  SmackTalk
//
//  Created by Evan on 7/23/17.
//  Copyright © 2017 Evan Laird. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var channelTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataChanged(_:)), name: NOTIF_USER_DATA_CHANGE, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_USER_CHANNELS_SELECTED, object: nil)
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                
                if success {
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE, object: nil)
                    
                    }
            })
        }
        MessageService.instance.findAllChannels { (success) in
            
                
        }
    
    }
    
    @objc func userDataChanged(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            //get Channels
            onLogginGetMessages()
        } else {
            channelTitle.text = "Please Login"
        }
    }
    
    @objc func channelSelected(_ notif: Notification) {
        updateWithChannel()
    }
    
    func updateWithChannel() {
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channelTitle.text = "#\(channelName)"
    }
    
    func onLogginGetMessages() {
        MessageService.instance.findAllChannels { (success) in
            if success {
                //Do stuff with channels
            }
        }
    }



}
