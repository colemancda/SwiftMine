//
//  DataCompressor.m
//  SwiftMine
//
//  Created by FunTimes on 8/5/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RakNet/DataCompressor.h>
#import "DataCompressor_objc.h"
#import <raknet/BitStream.h>

@interface DataCompressor()

@property (readwrite) RakNet::DataCompressor* compressor;

@end

@implementation DataCompressor : NSObject

- (instancetype) init {
    self = [super init];
    self.compressor = RakNet::DataCompressor().GetInstance();
    return self;
}

- (NSData*) compress: (NSData*) userData
                size: (unsigned int) sizeInBytes{
    unsigned char *temp_data_string = (unsigned char *)[[[NSString alloc] initWithData:userData encoding:(NSUTF8StringEncoding)] cStringUsingEncoding:NSUTF8StringEncoding];
    RakNet::BitStream *temp_bitstream = RakNet::BitStream().GetInstance();
    self.compressor->Compress(temp_data_string, sizeInBytes, temp_bitstream);
    
    return [NSData dataWithBytes:temp_bitstream->GetData() length:temp_bitstream->GetNumberOfBytesUsed()];
}

//- (NSData*) decompress: (NSData*) input {
//    unsigned char *output;
//    
//    RakNet::BitStream *temp_input_bitstream = RakNet::BitStream().GetInstance();
//    temp_input_bitstream->AddBitsAndReallocate((RakNet::BitSize_t) input.length);
//    temp_input_bitstream->WriteCompressed([[[NSString alloc] initWithData:input encoding:NSUTF8StringEncoding] cStringUsingEncoding:NSUTF8StringEncoding]);
//    self.compressor->DecompressAndAllocate(temp_input_bitstream, &output);
//    return [NSData dataWithBytes:output length:[self stringCounter:output]];
//}

- (NSUInteger) stringCounter: (unsigned char *) string {
    NSUInteger count = 0;
    for (int i = 0;;i++) {
        if (string[i] != '\0') {
            count++;
        }
    }
    
    return count + 1;
}

- (void) dealloc {
    self.compressor->DestroyInstance(self.compressor);
}

@end
