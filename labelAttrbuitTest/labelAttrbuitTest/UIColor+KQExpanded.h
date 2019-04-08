//
//  UIColor+KQExpanded.h
//  KangQiaoVHu
//
//  Created by 鸩夜 on 16/10/12.
//  Copyright © 2016年 KuoShuChing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KQExpanded)

+(UIColor *) hexStringToColor: (NSString *) stringToConvert;
+(UIColor *) hexStringToColor: (NSString *) stringToConvert andAlpha:(CGFloat)alpha;


@end
