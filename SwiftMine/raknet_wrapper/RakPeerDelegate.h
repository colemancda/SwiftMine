//
//  NSObject_RakPeerDelegate.h
//  SwiftMine
//
//  Created by FunTimes on 8/25/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RakPeerDelegate

-(void) receivedData: (NSData *) data
                guid: (uint64_t) guid
       objectPointer: (void *) pointer;

@end
