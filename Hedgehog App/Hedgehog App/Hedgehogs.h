//
//  Hedgehogs.h
//  Hedgehog App
//
//  Created by ian kunneke on 12/8/15.
//  Copyright © 2015 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hedgehogs : NSObject

@property (nonatomic) NSString *fact;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *continent;


+ (Hedgehogs *)hedgehogsWithDictionary:(NSDictionary *)hedgehogDict;

@end
