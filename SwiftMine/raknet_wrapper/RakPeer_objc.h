//
//  RakPeerInterface.h
//  SwiftMine
//
//  Created by FunTimes on 8/7/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

#ifndef RakPeer_h
#define RakPeer_h
#import "RakPeerDelegate.h"

@interface RakPeer : NSObject

@property NSObject<RakPeerDelegate>* delegate;

-(void)addToBanList: (NSString*) IP
            seconds: (NSTimeInterval) seconds;
-(void)addToSecurityExceptionList: (NSString*) IP;
-(bool)advertiseSystem: (NSString*) host
            remotePort: (unsigned short) remotePort
                  data: (NSData*) data;
-(void)startupOnPort: (uint16_t) port
       addressToBind: (NSString*) address;
-(uint32_t)send: (NSData *) data
  objectPointer: (void *) pointer;
@end

#endif /* RakPeer_h */
