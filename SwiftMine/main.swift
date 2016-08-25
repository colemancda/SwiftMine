//
//  main.swift
//  SwiftMine
//
//  Created by FunTimes on 5/5/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

import Foundation

public let VERSION = "0.1-GIT"
public let API_VERSION = "0.1"
public let CODENAME = "RedOne"
public let MINECRAFT_VERSION = "v0.15.4 alpha"
public let MINECRAFT_VERSION_NETWORK = "0.15.4"

public let PATH = FileManager.default.currentDirectoryPath
public let DATA_PATH = PATH
public let PLUGIN_PATH = DATA_PATH + "plugins"
public let START_TIME = Date.timeIntervalSinceReferenceDate
public let shortTitle = false
public let DEBUG = 1

let logger: MainLogger = MainLogger(logFile: DATA_PATH + "server.log")

let server: Server = Server()

server.start()
