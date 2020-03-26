//
//  QLMarkModel.m
//  QLReader
//
//  Created by Yimmm on 2020/3/26.
//  Copyright © 2020 Yimmm. All rights reserved.
//

#import "QLMarkModel.h"
@implementation QLMarkModel


-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.date forKey:@"date"];
    [aCoder encodeObject:self.recordModel forKey:@"recordModel"];
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.date = [aDecoder decodeObjectForKey:@"date"];
        self.recordModel = [aDecoder decodeObjectForKey:@"recordModel"];
    }
    return self;
}

@end
