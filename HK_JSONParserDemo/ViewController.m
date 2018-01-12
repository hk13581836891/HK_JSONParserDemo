//
//  ViewController.m
//  HK_JSONParserDemo
//
//  Created by houke on 2018/1/12.
//  Copyright © 2018年 houke. All rights reserved.
//

#import "ViewController.h"
#import "StudentModel.h"
#import "JSONKit.h"

/**
 JSON -- JavaScript Object Notation ,与 XML 同属数据格式,主要用于传递数据
        是比 XML 更轻量级的数据交换格式,被称为理想的数据交换语言
 解析 -- 从固定的格式中提取数据
        系统方法解析
        JSONKit解析
 
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)parserJSONWithSytemMethod:(UIButton *)sender {
    
    //json文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Student" ofType:@"json"];
    
    //提取内容
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:filePath]];
    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
    
    //解析 json 数据
    NSError *error = nil;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    if (error == nil) {
        NSLog(@"array:%@",array);
    }else{
        NSLog(@"error:%@",error);
    }
    
    NSMutableArray *studentArr = [NSMutableArray array];
    //数据封装
    for (NSDictionary *dict in array) {
        StudentModel *model = [[StudentModel alloc] initWithDictionary:dict];
        [studentArr addObject:model];
    }
    NSLog(@"studentArr:%@",studentArr);
    for (StudentModel *model in studentArr) {
        NSLog(@"model%@",model);
    }
}

- (IBAction)parserJSONWithJSONKit:(UIButton *)sender {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Student" ofType:@"json"];
    
    //获取 json 文件的内容
    NSString *content = [NSString stringWithContentsOfURL:[NSURL fileURLWithPath:filePath] encoding:NSUTF8StringEncoding error:nil];
    
    //使用 jsonkit 解析
    NSArray *array = [content objectFromJSONString];
    NSLog(@"array%@",array);
    
    //数据封装
    NSMutableArray *studentArr = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        StudentModel *model = [[StudentModel alloc] initWithDictionary:dict];
        [studentArr addObject:model];
    }
    
    for (StudentModel *model in studentArr) {
        NSLog(@"model:%@",model);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
