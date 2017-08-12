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
let TO_AVATAR = "toAvatarPicker"

//User Defaults

let LOGGED_IN_KEY = "loggedin"
let TOKEN_KEY = "token"
let USER_EMAIL = "user email"

//Completion Handler

typealias CompletionHandler = (_ Success: Bool) -> ()

//URLS

let BASE_URL = "https://smacktalkevanlaird.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNEL = "\(BASE_URL)channel/"
let URL_GET_MESSAGES = "\(BASE_URL)message/byChannel/"

//Headeraccount

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]

let B_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset=utf-8"
]

//Notifications

let NOTIF_USER_DATA_CHANGE = Notification.Name("userDataChanged")
let NOTIF_USER_CHANNELS_LOADED = Notification.Name("channelsLoaded")
let NOTIF_USER_CHANNELS_SELECTED = Notification.Name("channelsSelected")









