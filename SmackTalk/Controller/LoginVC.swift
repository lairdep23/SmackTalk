//
//  LoginVC.swift
//  SmackTalk
//
//  Created by Evan on 7/23/17.
//  Copyright © 2017 Evan Laird. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        
    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_SIGN, sender: nil)
    }
    @IBAction func loginBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = usernameText.text , usernameText.text != "" else {return}
        guard let password = passwordText.text , passwordText.text != "" else {return}
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_CHANGE, object: nil)
                        self.spinner.stopAnimating()
                        self.spinner.isHidden = true
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    func setupView() {
        spinner.isHidden = true
    }

}
