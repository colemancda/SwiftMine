//
//  Connection.swift
//  SwiftMine
//
//  Created by FunTimes on 8/7/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

import Foundation

internal class Connection: BaseClass, UDPEchoDelegate {
    private let connectedPlayer: Player;
    private var UDPSession = UDPEcho()
    
    init(sourcePlayer: Player) {
        //initialize vars
        connectedPlayer = sourcePlayer
        
        //initialize superclass
        super.init()
        
        //UDP delegation
        UDPSession?.delegate = self
        UDPSession?.startServer(onPort: 19132)
    }
    
    
}
