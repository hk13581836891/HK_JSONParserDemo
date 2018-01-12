//
//  StudentModel.h
//  HK_JSONParserDemo
//
//  Created by houke on 2018/1/12.
//  Copyright © 2018年 houke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentModel : NSObject

@property (nonatomic, strong) NSString *name, *age, *gender;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end
