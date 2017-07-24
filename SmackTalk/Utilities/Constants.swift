//
//  Constants.swift
//  SmackTalk
//
//  Created by Evan on 7/23/17.
//  Copyright © 2017 Evan Laird. All rights reserved.
//

import Foundation

//Segues

let TO_LOGIN = "ToLoginVC"
let TO_SIGN = "ToSignUp"
let UNWIND = "UnwindToChannel"

//User Defaults

let LOGGED_IN_KEY = "loggedin"
let TOKEN_KEY = "token"
let USER_EMAIL = "user email"

//Completion Handler

typealias CompletionHandler = (_ Success: Bool) -> ()

//URLS

let BASE_URL = "https://smacktalkevanlaird.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
