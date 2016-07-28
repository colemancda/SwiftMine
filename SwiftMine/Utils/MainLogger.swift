//
//  MainLogger.swift
//  SwiftMine
//
//  Created by FunTimes on 5/8/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

import Foundation

public class MainLogger: NSObject, Logger {
    
    private let logFile: FileHandle?
    private let logStream = ""
    private let shutdown: Bool
    
    private let logDebug: Bool
    private let logger: MainLogger?
    public convenience init(logFile: String) {
        self.init(logFile: logFile, logDebug: false)
    }
    
    public init(logFile: String, logDebug: Bool) {
        //TODO: Implement
    }
    
    public func emergency(_ message: String) {
        send("[EMERGENCY] " + message)
    }
    
    public func alert(_ message: String) {
        send("[ALERT] " + message)
    }
    
    public func critical(_ message: String) {
        send("[CRITICAL] " + message)
    }
    
    public func error(_ message: String) {
        send("[ERROR] " + message)
    }
    
    public func warning(_ message: String) {
        send("[WARNING] " + message)
    }
    
    public func notice(_ message: String) {
        send("[NOTICE] " + message)
    }
    
    public func info(_ message: String) {
        send("[INFO] " + message)
    }
    
    public func debug(_ message: String) {
        if (logDebug) {
            return;
        }
    }
    
    private func send(_ message: String) {
        send(message, level: -1)
    }
    
    private func send(_ message: String, level: Int) {
        print(message)
    }
    
    
}
