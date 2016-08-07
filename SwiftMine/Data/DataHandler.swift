//
//  DataHandler.swift
//  SwiftMine
//
//  Created by FunTimes on 8/3/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

import Foundation

internal class DataHandler {
    
    let JSON_STORAGE_PATH: String = FileManager.default.currentDirectoryPath
    let JSON_FILE_PATH: String
    
    // use getDataList() getter to avoid the data_list from being modified directly
    private var data_list: Array<AnyObject> = []
    
    init(JSON_FILE_NAME: String) {
        JSON_FILE_PATH = JSON_STORAGE_PATH + JSON_FILE_NAME
    }
    
    // Other classes should create their own data addition method, named more appropriately
    internal func add(_ object: AnyObject) {
        data_list += [object]
        updateJSON()
    }
    
    internal func removeData (using handler: (Array<AnyObject>) -> Array<AnyObject>) {
        data_list = handler(data_list)
        updateJSON()
    }
    
    internal func getDataList() -> Array<AnyObject> {
        return data_list
    }
    
    private func updateJSON() {
        (data_list as NSArray).write(toFile: JSON_FILE_PATH, atomically: true)
    }
}
