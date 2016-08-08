//
//  Player.swift
//  SwiftMine
//
//  Created by FunTimes on 8/3/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

import Foundation

class Player {
    public var name: String = ""
    public var IP: String
    
    init(name: String, IP: String) {
        self.name = name
        self.IP = IP
    }
}
