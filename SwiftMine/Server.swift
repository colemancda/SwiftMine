//
//  Server.swift
//  SwiftMine
//
//  Created by FunTimes on 6/4/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

import Foundation

class Server: ConnectionHandler {
    
    let x: DataCompressor = DataCompressor()
    
    private func addPlayer() {
    
    }
    
    public func start() {
        listen(onPort: self.configuration_array["port"] as! Int)
    }
}
