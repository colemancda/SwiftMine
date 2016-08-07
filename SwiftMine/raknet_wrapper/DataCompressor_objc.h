//
//  DataCompressor.h
//  SwiftMine
//
//  Created by FunTimes on 8/5/16.
//  Copyright © 2016 FunTimes. All rights reserved.
//

#ifndef DataCompressor_h
#define DataCompressor_h

#import <Foundation/Foundation.h>

@interface DataCompressor : NSObject

- (NSData*) compress: (NSData*) userData
                size: (unsigned int) sizeInBytes;

//- (NSData*) decompress: (NSData*) input;

@end

#endif /* DataCompressor_h */
