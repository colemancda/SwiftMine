//
//  Logger.swift
//  SwiftMine
//
//  Created by FunTimes on 5/8/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

import Foundation

public protocol Logger {
    func emergency(_ message: String)
    func alert(_ message: String)
    func critical(_ message: String)
    func error(_ message: String)
    func warning(_ message: String)
    func notice(_ message: String)
    func info(_ message: String)
    func debug(_ message: String)
    func log(_ level: LogLevel, message: String)
    func emergency(_ message: String, t: ErrorProtocol)
    func alert(_ message: String, t: ErrorProtocol)
    func critical(_ message: String, t: ErrorProtocol)
    func error(_ message: String, t: ErrorProtocol)
    func warning(_ message: String, t: ErrorProtocol)
    func notice(_ message: String, t: ErrorProtocol)
    func info(_ message: String, t: ErrorProtocol)
    func debug(_ message: String, t: ErrorProtocol)
    func log(_ level: LogLevel, message: String, t: ErrorProtocol)
}
