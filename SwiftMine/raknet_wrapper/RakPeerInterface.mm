//
//  RakPeerInterface.m
//  SwiftMine
//
//  Created by FunTimes on 8/7/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RakPeerInterface_objc.h"
#import "RakPeerInterface.h"
#import "PacketPriority.h"

@interface RakPeerInterface()

@property RakNet::RakPeerInterface *interface;

@end

@implementation RakPeerInterface

-(instancetype)init {
    self = [super init];
    self.interface = RakNet::RakPeerInterface::GetInstance();
    return self;
}

-(void)addToBanList: (NSString*) IP
            seconds: (NSTimeInterval) seconds{
    self.interface->AddToBanList([IP cStringUsingEncoding:NSUTF8StringEncoding], seconds);
}

-(void)addToSecurityExceptionList: (NSString*) IP {
    self.interface->AddToSecurityExceptionList([IP cStringUsingEncoding:NSUTF8StringEncoding]);
}

-(void)advertiseSystem: (NSString*) host
            remotePort: (unsigned short) remotePort
                  data: (NSData*) data {
    self.interface->AdvertiseSystem([host cStringUsingEncoding:NSUTF8StringEncoding], (unsigned short)remotePort, (const char *)data.bytes, (int)data.length);
    
}

@end
