//
//  RakPeerInterface.m
//  SwiftMine
//
//  Created by FunTimes on 8/7/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <dispatch/dispatch.h>
#import "RakPeer_objc.h"
#import <raknet/RakPeer.h>
#import <raknet/PacketPriority.h>
#import <raknet/RakNetVersion.h>
#import "RakPeerDelegate.h"

@interface RakPeer()

@property RakNet::RakPeerInterface *interface;
@property (strong) dispatch_queue_t server_queue;
@property bool should_terminate;
@property RakNet::Packet *custom_packet;

@end
@implementation RakPeer

-(instancetype)init {
    self = [super init];
    self.should_terminate = false;
    self.server_queue = dispatch_queue_create("server_queue", DISPATCH_QUEUE_SERIAL);
    self.interface = RakNet::RakPeer::GetInstance();
    return self;
}

-(void)addToBanList: (NSString*) IP
            seconds: (NSTimeInterval) seconds{
    self.interface->AddToBanList([IP cStringUsingEncoding:NSUTF8StringEncoding], seconds);
}

-(void)addToSecurityExceptionList: (NSString*) IP {
    self.interface->AddToSecurityExceptionList([IP cStringUsingEncoding:NSUTF8StringEncoding]);
}

-(bool)advertiseSystem: (NSString*) host
            remotePort: (unsigned short) remotePort
                  data: (NSData*) data {
    return self.interface->AdvertiseSystem([host cStringUsingEncoding:NSUTF8StringEncoding], (unsigned short)remotePort, (const char *)data.bytes, (int)data.length);
    
}

-(NSArray *)allocatePacket: (unsigned int) dataSize {
    self.custom_packet = self.interface->AllocatePacket(dataSize);
    //    struct custom_struct = RakNet::Packet;
    return @[@(self.custom_packet->bitSize),
             [NSData dataWithBytes:self.custom_packet->data length:self.custom_packet->length]];
}



-(void)startupOnPort: (uint16_t) port
       addressToBind: (NSString*) address{
    struct RakNet::SocketDescriptor socket_list[1] = {RakNet::SocketDescriptor(port, [address cStringUsingEncoding:NSUTF8StringEncoding])};
    
    unsigned char startup_result = self.interface->Startup(1000, socket_list , 1, -10);
    
    if (startup_result == 0) {
        NSLog(@"starting up...");
        dispatch_async(self.server_queue, ^{
            NSLog(@"queue starting");
            RakNet::Packet *packet=self.interface->Receive();
            if (packet != 0) {
                printf("%i", packet->length);
                NSLog(@"%@", [NSData dataWithBytes: packet->data length:packet->length]);
            }
            while (true) {
                RakNet::Packet *packet=self.interface->Receive();
                if (packet != 0) {
                    NSLog(@"packet received");
                    [[self delegate] receivedData:[NSData dataWithBytes: packet->data length:packet->length]
                                             guid:packet->guid.g
                                    objectPointer:packet];
                }
                self.interface->DeallocatePacket(packet);
            }
        });
    } else {
        NSLog(@"startup failed");
    }
}

-(uint32_t)send: (NSData *) data
  objectPointer: (void *) pointer{
    RakNet::Packet *passed_packet = (RakNet::Packet *)pointer;
    self.interface->Send((const char *)data.bytes, (int)data.length, PacketPriority::HIGH_PRIORITY, PacketReliability::UNRELIABLE, 0, passed_packet->guid, false);
    return 0;
}

-(void)dealloc {
    RakNet::RakPeer::DestroyInstance(self.interface);
}

//TODO: DELETE
-(void)cxx_dumping_ground {
}

@end
