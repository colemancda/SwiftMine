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
    func emergency(_ message: String, t: Error)
    func alert(_ message: String, t: Error)
    func critical(_ message: String, t: Error)
    func error(_ message: String, t: Error)
    func warning(_ message: String, t: Error)
    func notice(_ message: String, t: Error)
    func info(_ message: String, t: Error)
    func debug(_ message: String, t: Error)
    func log(_ level: LogLevel, message: String, t: Error)
}
