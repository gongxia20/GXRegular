//
//  GXRegularTool.m
//  linshi
//
//  Created by apple on 15/9/27.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "GXRegularTool.h"

@implementation GXRegularTool

//查找字符串中符合正则表达式规则的内容
+ (NSArray *)regexString:(NSString *)regexString fromContentString:(NSString *)contentString
{
    NSArray *array =    nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:nil];
    array = [regex matchesInString:contentString options:0 range:NSMakeRange(0, [contentString length])];
    NSMutableArray *arr = [NSMutableArray array];
    NSString *str1 = nil;
    for (NSTextCheckingResult* result in array)
    {
        for(int i=0;i<result.numberOfRanges;i++){
            str1 = [contentString substringWithRange:[result rangeAtIndex:0]];
            NSLog(@"str -> %@,location:%lu,length:%lu",str1,(unsigned long)[result rangeAtIndex:0].location,(unsigned long)[result rangeAtIndex:0].length);
            if (i == 0) {
                [arr addObject:str1];
            }
        }
        
    }
    //    NSLog(@"arr is %@",arr);
    
    return arr;
}

//将字符串中符合正则表达式规则的内容替换
+ (NSArray *)regexStringtotal:(NSString *)regexString fromContentString:(NSString *)contentString
{
    NSArray *array =    nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexString options:NSRegularExpressionCaseInsensitive error:nil];
    array = [regex matchesInString:contentString options:0 range:NSMakeRange(0, [contentString length])];
    NSMutableArray *arr = [NSMutableArray array];
    
    NSString *str1 = nil;
    
    NSUInteger before = 0; //上一个结束的下标
    
    for (NSTextCheckingResult *result in array)
    {
        NSUInteger strLocation = [result rangeAtIndex:0].location;    //每一个匹配的字符串的下标开始
        NSUInteger strLength = [result rangeAtIndex:0].length;      //每一个匹配的字符串的长度
        
        str1 = [contentString substringWithRange:[result rangeAtIndex:0]];
        if (strLocation-before > 0) {
            NSString *ls = [contentString substringWithRange:NSMakeRange(before, strLocation-before)];
            [arr addObject:ls];
            
            before = strLength + strLocation;
        }else{
            before = before + strLength;
        }
        
        [arr addObject:[contentString substringWithRange:[result rangeAtIndex:1]]];
        
    }
    
    [arr addObject:[contentString substringFromIndex:before]];
    //    NSLog(@"arr is %@",arr);
    return arr;
}

//写入文件
+ (void)writeTextFileToDocumentFile
{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"%@",docDir);
    NSString *createPath = [NSString stringWithFormat:@"%@/Image", docDir];
    NSString *createDir = [NSString stringWithFormat:@"%@/a.plist", createPath];
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:createPath]) {
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createDirectoryAtPath:createDir withIntermediateDirectories:YES attributes:nil error:nil];
    } else {
        NSLog(@"FileDir is exists.");
    }
    
    NSString *filePath = [createPath stringByAppendingPathComponent:@"fuckingDay.plist"];
    
    NSArray *array = @[@1,@2,@"123"];
    //只有具备writeToFile的对象才能使用plist存储，NSArray
    [array writeToFile:filePath atomically:YES];
}
@end
