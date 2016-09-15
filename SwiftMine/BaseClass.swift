//
//  BaseClass.swift
//  SwiftMine
//
//  Created by FunTimes on 8/24/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

import Foundation

class BaseClass: NSObject {
    private let configuration_filename = "Config/swiftmine.sws"
    
    internal var configuration_array: Dictionary<String, Any> {
        get {
            if FileManager.default.fileExists(atPath: PATH + configuration_filename) {
                return NSUnarchiver.unarchiveObject(withFile: configuration_filename) as! Dictionary<String, Any>
            } else {
                //default configuration dictionary
                let default_dict: Dictionary<String, Any> = ["port": 19132]
                return default_dict
            }
        }
    }
}
