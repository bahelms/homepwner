//
//  BNRItem.m
//  RandomItems
//
//  Created by Barrett Helms on 6/5/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype)randomItem {
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            self.randomAdjective,
                            self.randomNoun];
    
    return [[self alloc] initWithItemName:randomName
                           valueInDollars:arc4random_uniform(100)
                             serialNumber:self.randomSerialNumber];
}


+ (NSString *)randomAdjective {
    NSArray *randomAdjectives = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSInteger adjectiveIndex = arc4random_uniform((int)[randomAdjectives count]);
    return randomAdjectives[adjectiveIndex];
}


+ (NSString *)randomNoun {
    NSArray *randomNouns = @[@"Bear", @"Spork", @"Mac"];
    NSInteger nounIndex = arc4random_uniform((int)[randomNouns count]);
    return randomNouns[nounIndex];
}


+ (NSString *)randomSerialNumber {
    char digit = '0' + arc4random_uniform(10);
    char letter = 'A' + arc4random_uniform(26);
    return [NSString stringWithFormat:@"%c%c%c%c%c", digit, letter, digit, letter, digit];
}


#pragma mark - Initializers

- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)serialNumber
{
    if (self = [super init]) {
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = serialNumber;
        _dateCreated = [[NSDate alloc] init];
    }
    return self;
}


- (instancetype)initwithItemName:(NSString *)name serialNumber:(NSString *)serialNumber {
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:serialNumber];
}


- (instancetype)initWithItemName:(NSString *)name {
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}


- (instancetype)init { return [self initWithItemName:@"Item"]; }


#pragma mark - Accessors


- (NSString *)description {
    NSString *description = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                             self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
    return description;
}


- (void)dealloc { NSLog(@"Destroyed: %@", self); }
@end
