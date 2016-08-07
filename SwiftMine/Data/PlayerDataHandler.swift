//
//  PlayerDataHandler.swift
//  SwiftMine
//
//  Created by FunTimes on 8/3/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

import Foundation

internal class PlayerDataHandler: DataHandler {
    
    internal func addPlayer(player: Player) {
        guard (getDataList().contains(where: {($0 as! Player).name == player.name})) else {
            add(player)
            return
        }
    }
    
    internal func removePlayer(player: Player) {
        removeData { (playerList) -> Array<AnyObject> in
            var temp_list = playerList
            guard let item_index = playerList.index(where: {
                ($0 as! Player).name == player.name
            }) else { return playerList }
            
            temp_list.remove(at: item_index)
            return playerList
        }
    }
}
