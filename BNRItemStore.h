//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Barrett Helms on 6/14/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRItem; // Let's the compiler know this class exists without importing it

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+ (instancetype)sharedStore;
- (BNRItem *)createItem;

@end
