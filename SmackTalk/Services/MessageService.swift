//
//  MessageService.swift
//  SmackTalk
//
//  Created by Evan on 8/7/17.
//  Copyright © 2017 Evan Laird. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    var messages = [Message]()
    var selectedChannel: Channel?
    var unreadChannels = [String]()
    
    func findAllChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNEL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: B_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                self.clearChannels()
                guard let data = response.data else {return}
                
                if let json = JSON(data: data).array {
                    for item in json {
                        let name = item["name"].stringValue
                        let desc = item["description"].stringValue
                        let id = item["_id"].stringValue
                        
                        let channel = Channel(channelTitle: name, channelDescription: desc, channelID: id)
                        
                        self.channels.append(channel)
                    }
                    NotificationCenter.default.post(name: NOTIF_USER_CHANNELS_LOADED, object: nil)
                    completion(true)
                }
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func findAllMessagesForChannel(channelID: String, completion: @escaping CompletionHandler){
        
        Alamofire.request("\(URL_GET_MESSAGES)\(channelID)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: B_HEADER).responseJSON{(response) in
            
            if response.result.error == nil {
                self.clearMessages()
                guard let data = response.data else {return}
                
                if let json = JSON(data: data).array {
                    for item in json {
                        let messageBody = item["messageBody"].stringValue
                        let channelID = item["channelId"].stringValue
                        let id = item["_id"].stringValue
                        let userName = item["userName"].stringValue
                        let userAvatar = item["userAvatar"].stringValue
                        let userAvatarColor = item["userAvatarColor"].stringValue
                        let timeStamp = item["timeStamp"].stringValue
                        
                        let message = Message(message: messageBody, userName: userName, channelId: channelID, userAvatar: userAvatar, userAvatarColor: userAvatarColor, id: id, timeStamp: timeStamp)
                        self.messages.append(message)
                        
                    }
                    completion(true)
                }
                
            }else {
                debugPrint(response.result.error as Any)
                completion(false)
                
            }
            
        }
    }
    
    
    func clearChannels() {
        channels.removeAll()
    }
    
    func clearMessages() {
        messages.removeAll()
    }
}
