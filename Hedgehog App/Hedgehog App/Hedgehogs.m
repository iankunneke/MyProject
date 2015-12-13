//
//  Hedgehogs.m
//  Hedgehog App
//
//  Created by ian kunneke on 12/8/15.
//  Copyright © 2015 test. All rights reserved.
//

#import "Hedgehogs.h"

@implementation Hedgehogs

+ (Hedgehogs *)hedgehogsWithDictionary:(NSDictionary *)hedgehogDict;
{
    Hedgehogs *aHedgehog = nil;
    if (hedgehogDict)
    {
        aHedgehog = [[Hedgehogs alloc]init];
        aHedgehog.fact = [hedgehogDict objectForKey:@"fact"];
        aHedgehog.name = [hedgehogDict objectForKey:@"name"];
        aHedgehog.continent = [hedgehogDict objectForKey:@"continent"];

    }
    return aHedgehog;
}

@end
