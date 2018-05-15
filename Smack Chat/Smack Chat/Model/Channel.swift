//
//  File.swift
//  Smack Chat
//
//  Created by Mac on 5/14/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import Foundation

struct Channel { //: Decodable { // IN SWIFT 4 JSON PARSING CAN BE DONE IN DIFFERENT WAY WHICH REQUIRES Decodable CLASS TYPE TO THE DATA STRUCTURE
    public private(set) var channelTitle: String!
    public private(set) var channelDescriptionn: String!
    public private(set) var id: String!
    
    // USING SWIFT 4 FOR JSON PARSING REQUIRES DATA STRUCTURE BELOW TO MATCH EXACTLY AND WITH THE SAME ORDER IN RESPECT TO THE JSON OBJECT THAT THE API HAS SET
    // other steps is done in the MessageService
    /*public private(set) var _id: String!
    public private(set) var name: String!
    public private(set) var description: String!
    public private(set) var __v: Int?*/
}
