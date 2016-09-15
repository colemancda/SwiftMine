//
//  IncomingConnectionHandler.swift
//  SwiftMine
//
//  Created by FunTimes on 8/7/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

import Foundation

class ConnectionHandler: BaseClass, RakPeerDelegate {
    private let OFFLINE_MESSAGE_DATA_ID: Array<UInt8> = [0x00, 0xff, 0xff, 0x00, 0xfe, 0xfe, 0xfe, 0xfe, 0xfd, 0xfd, 0xfd, 0xfd, 0x12, 0x34, 0x56, 0x78]
    
    /**
     
     Instance of the Objective-C++ wrapper for RakNet
     
     */
    private var raknet_instance = RakPeer()
    
    /**
     
     Begins listening on a given port
     
     - Parameter port: The port to listen on
     
     */
    public func listen(onPort port: Int) {
        self.raknet_instance.delegate = self
        self.raknet_instance.startup(onPort: 19132, addressToBind: "0.0.0.0")
        RunLoop.main.run()
    }
    
    /**
     
     Delegate method: Called when data is received
     
     - Parameter data: Data received
     - Parameter guid: Global id, extracted from packet
     - Parameter objectPointer: C++ Object pointer, passed through Swift, to keep track of context.
     
     */
    
    func receivedData(_ data: Data!, guid: UInt64, objectPointer pointer: UnsafeMutableRawPointer!) {
        print(data[0])
        var response_data_packet = Data(bytes: [0x1c])
        
        response_data_packet.append(contentsOf: uint64_to_uint8_array(guid))
        response_data_packet.append(contentsOf: uint64_to_uint8_array(UInt64(505123)))
        response_data_packet.append(contentsOf: OFFLINE_MESSAGE_DATA_ID)
        
        let server_title: Array<UInt8> = ("HOLY CRAP THIS WORKS!!!".cString(using: String.Encoding.utf8)! as [Int8]).map({ (U: Int8) -> UInt8 in
            return UInt8(U)
        })
        
        response_data_packet.append(contentsOf: server_title)
        print("sending: \(response_data_packet.base64EncodedString())")
        raknet_instance.send(response_data_packet, objectPointer: pointer)
    }
    
    func uint64_to_uint8_array (_ integer: UInt64) -> [UInt8]
    {
        return stride(from: 56, through: 0, by: -8).map { (U) -> UInt8 in
            return UInt8((integer >> U) & 0xff)
        }
    }
}
