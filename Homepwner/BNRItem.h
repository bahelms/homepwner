//
//  BNRItem.h
//  RandomItems
//
//  Created by Barrett Helms on 6/5/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

+ (instancetype)randomItem;

// Designated initializer
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)serialNumber;

- (instancetype)initwithItemName:(NSString *)name
                    serialNumber:(NSString *)serialNumber;

- (instancetype)initWithItemName:(NSString *)name;

@end
