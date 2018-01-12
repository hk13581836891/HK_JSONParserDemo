//
//  StudentModel.m
//  HK_JSONParserDemo
//
//  Created by houke on 2018/1/12.
//  Copyright © 2018年 houke. All rights reserved.
//

#import "StudentModel.h"

@implementation StudentModel

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        //使用 kvc对属性赋值
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"name = %@, age = %@, gender = %@", self.name, self.age, self.gender];
}
@end
