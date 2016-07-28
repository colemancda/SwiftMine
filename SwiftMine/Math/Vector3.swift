//
//  Vector3.swift
//  SwiftMine
//
//  Created by FunTimes on 5/8/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

import Foundation

public class Vector3: CustomStringConvertible {
    public static let SIDE_DOWN = 0
    public static let SIDE_UP = 1
    public static let SIDE_NORTH = 2
    public static let SIDE_SOUTH = 3
    public static let SIDE_WEST = 4
    public static let SIDE_EAST = 5
    
    public var x: Double?
    public var y: Double?
    public var z: Double?
    
    init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    public func getX() -> Double {
        return self.x!
    }
    
    public func getY() -> Double {
        return self.y!
    }
    
    public func getZ() -> Double {
        return self.z!
    }
    
    public func getFloorX() -> Int {
        return Int(Foundation.floor(self.x!))
    }
    
    public func getFloorY() -> Int {
        return Int(Foundation.floor(self.x!))
    }
    
    public func getFloorZ() -> Int {
        return Int(Foundation.floor(self.z!))
    }
    
    public func getRight() -> Double {
        return self.x!
    }
    
    public func getUp() -> Double {
        return self.y!
    }
    
    public func getForward() -> Double {
        return self.z!
    }
    
    public func getSouth() -> Double {
        return self.x!
    }
    
    public func getWest() -> Double {
        return self.z!
    }
    
    public func add(_ vector: Vector3) -> Vector3 {
        return Vector3(x: self.x! + vector.x!, y: self.y! + vector.y!, z:self.z! + vector.z!)
    }
    
    public func add(x: Double, y: Double, z: Double) -> Vector3 {
        return Vector3(x: self.x! + x, y: self.y! + y, z: self.z! + z)
    }
    
    public func subtract(_ vector: Vector3) -> Vector3 {
        return add(x: -vector.x!, y: -vector.y!, z: -vector.z!)
    }
    
    public func subtract(_ x: Double, y: Double, z: Double) -> Vector3 {
        return add(x: -x, y: -y, z: -z)
    }
    
    public func multiply(_ number: Double) -> Vector3 {
        return Vector3(x: self.x! * number , y: self.y! * number, z: self.z! * number)
    }
    
    public func divide(_ number: Double) -> Vector3 {
        return Vector3(x: self.x! / number, y: self.y! / number, z: self.z! / number)
    }
    
    public func ceil() -> Vector3 {
        return Vector3(x: Foundation.ceil(self.x!), y: Foundation.ceil(self.y!), z: Foundation.ceil(self.z!))
    }
    
    public func floor() -> Vector3 {
        return Vector3(x: Foundation.floor(self.x!), y: Foundation.floor(self.y!), z: Foundation.floor(self.z!))
    }
    
    public func round() -> Vector3 {
        return Vector3(x: Foundation.round(self.x!), y: Foundation.round(self.y!), z: Foundation.round(self.z!))
    }
    
    public func abs() -> Vector3 {
        return Vector3(x: Foundation.fabs(self.x!), y: Foundation.fabs(self.y!), z: Foundation.fabs(self.z!))
    }
    
    public func getSide(_ side: Int, step: Int = 1) -> Vector3 {
        switch side {
        case Vector3.SIDE_DOWN:
            return Vector3(x: self.x!, y: self.y! - Double(step), z: self.z!)
        case Vector3.SIDE_UP:
            return Vector3(x: self.x!, y: self.y! + Double(step), z: self.z!)
        case Vector3.SIDE_NORTH:
            return Vector3(x: self.x!, y: self.y!, z: self.z! - Double(step))
        case Vector3.SIDE_SOUTH:
            return Vector3(x: self.x!, y: self.y!, z: self.z! + Double(step))
        case Vector3.SIDE_WEST:
            return Vector3(x: self.x! - Double(step), y: self.y!, z: self.z!)
        case Vector3.SIDE_EAST:
            return Vector3(x: self.x! + Double(step), y: self.y!, z: self.z!)
        default:
            return self
        }
    }
    
    public func getOppositeSide(_ side: Int) -> Int {
        switch(side) {
        case Vector3.SIDE_DOWN:
            return Vector3.SIDE_UP
        case Vector3.SIDE_UP:
            return Vector3.SIDE_DOWN
        case Vector3.SIDE_NORTH:
            return Vector3.SIDE_SOUTH
        case Vector3.SIDE_SOUTH:
            return Vector3.SIDE_NORTH
        case Vector3.SIDE_WEST:
            return Vector3.SIDE_EAST
        case Vector3.SIDE_EAST:
            return Vector3.SIDE_WEST
        default:
            return -1
        }
    }
    
    public func distanceSquared(_ pos: Vector3) -> Double {
        return pow(self.x! - pos.x!, 2) + pow(self.x! - pos.x!, 2)
    }
    
    public var description: String {
        return "Vector3(x=" + String(self.x!) + ",y=" + String(self.y!) + ",z=" + String(self.z!) + ")"
    }
}
