//
//  SocketService.swift
//  Smack Chat
//
//  Created by Mac on 5/14/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    static let instance = SocketService()
    
    // AS THIS CLASS IS OF TYPE NSObject initializer IS REQUIRED
    override init() {
        super.init()
    }
    
    let  manager = SocketManager(socketURL: URL(string: "\(BASE_URL)")!)
    lazy var socket = manager.defaultSocket
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannnel(completion: @escaping CompletionHandler) {
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDescription = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            let newChannel = Channel(channelTitle: channelName, channelDescriptionn: channelDescription, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
}
