//
//  RakPeerInterface.h
//  SwiftMine
//
//  Created by FunTimes on 8/7/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

#ifndef RakPeerInterface_h
#define RakPeerInterface_h

@interface RakPeerInterface : NSObject

-(void)addToBanList: (NSString*) IP
            seconds: (NSTimeInterval) seconds;
-(void)addToSecurityExceptionList: (NSString*) IP;
-(void)advertiseSystem: (NSString*) host
            remotePort: (unsigned short) remotePort
                  data: (NSData*) data;
@end

#endif /* RakPeerInterface_h */
