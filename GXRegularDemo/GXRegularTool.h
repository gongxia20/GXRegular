//
//  GXRegularTool.h
//  linshi
//
//  Created by apple on 15/9/27.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GXRegularTool : NSObject

+ (NSArray *)regexStringtotal:(NSString *)regexString fromContentString:(NSString *)contentString;

+ (NSArray *)regexString:(NSString *)regexString fromContentString:(NSString *)contentString;

@end
