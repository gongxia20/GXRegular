//
//  ViewController.m
//  GXRegularDemo
//
//  Created by apple on 15/9/27.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "GXRegularTool.h"

NSString *string = @"12345,<http://www.google.com>abcdefg<http://www.baidu.com>测试测试,<http://www.google.com>应该是没问题啦";
NSString *str = @"\\<(.*?)\\>";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self regularString:string];
    
    // 正则表达式截取
    [self regularExpressions:string];
}

// 工具类的
- (void)regularString:(NSString *)string {
    NSArray *array = [GXRegularTool regexString:str fromContentString:string];
    for (NSTextCheckingResult *TextResult in array) {
        NSLog(@"%@",TextResult);
    }
}

// 正则表达常规的方式检验
- (void)regularExpressions:(NSString *)string {
    NSError *error1;
    NSRegularExpression *regex1 = [NSRegularExpression regularExpressionWithPattern:str options:0 error:&error1];
    if (regex1 != nil){
        NSArray *array = [regex1 matchesInString:string options:0 range:NSMakeRange(0, string.length)];
        
        for (NSTextCheckingResult *fistMatch in array) {
            if (fistMatch) {
                NSRange resultRange = [fistMatch rangeAtIndex:0];
                
                NSString *result = [string substringWithRange:resultRange];
                NSLog(@"%@",result);
            }
        }
    }
}

@end
