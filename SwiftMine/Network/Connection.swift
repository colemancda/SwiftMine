//
//  Connection.swift
//  SwiftMine
//
//  Created by FunTimes on 8/7/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

import Foundation

internal class Connection: BaseClass {
    private let connectedPlayer: Player;
    private var RakNetSession = RakPeer()
    
    init(sourcePlayer: Player) {
        //initialize vars
        connectedPlayer = sourcePlayer
        
        //initialize superclass
        super.init()
        
    }
    
    
}
