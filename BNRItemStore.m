//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Barrett Helms on 6/14/14.
//  Copyright (c) 2014 Helms Industries. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic, strong) NSMutableArray *privateItems;

@end


@implementation BNRItemStore

+ (instancetype)sharedStore {
    // static stays in memory after method has returned. It's not kept on the stack.
    // This creates a strong reference cycle since it will never be destroyed.
    static BNRItemStore *sharedStore = nil;
    if (!sharedStore)
        sharedStore = [[self alloc] initPrivate];
    return sharedStore;
}


#pragma mark - Initializers
- (instancetype)initPrivate {
    if (self = [super init])
        _privateItems = [[NSMutableArray alloc] init];
    return self;
}


- (instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BNRItemStore sharedStore]"
                                 userInfo:nil];
    return nil;
}


#pragma mark - Accessors
- (NSArray *)allItems {
    return self.privateItems;
}


#pragma mark - Methods
- (BNRItem *)createItem {
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

@end
