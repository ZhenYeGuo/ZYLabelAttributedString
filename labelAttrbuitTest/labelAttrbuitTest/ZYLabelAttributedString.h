//
//  ZYLabelAttributedString.h
//  labelAttrbuitTest
//
//  Created by 鸩夜 on 2018/6/2.
//  Copyright © 2018年 KuoShuChing. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <UIKit/UIKit.h>

@interface ZYLabelAttributedString : NSObject

/**
 label的富文本str

 @param textArray 文本数组
 @param fontArray 字体数组
 @param colorArray 颜色数组
 @return 富文本str 注：三个数组须count 相同
 */
+(NSMutableAttributedString*)changeLabelWithText:(NSArray*)textArray addAattributesAboutFont:(NSArray*)fontArray withAboutColor:(NSArray*)colorArray;

+(NSMutableAttributedString*)changeLabelWithText:(NSArray*)textArray addAattributesAboutFont:(NSArray*)fontArray withAboutColor:(NSArray*)colorArray fontWright:(UIFontWeight)fontWeight;

//价格中划线设置  注:需要下划线什么的自己可以在.m中随意设置
+ (NSMutableAttributedString*)textInput:(NSString*)inputStr;
/**
 创建带图片的富文本，用于label显示
 
 @param nomalString 传入的string
 @param leftImage 左边的图片
 @param leftImageRect 左边图片在label中的frame
 @param rightImage 右边图片
 @param rightImageRect 右边图片在label中的frame
 @return 富文本
 */
+ (NSMutableAttributedString*)creatAttributedString:(NSString*)nomalString andLetfImage:(UIImage*)leftImage withLeftImageFrame:(CGRect)leftImageRect andRightImage:(UIImage*)rightImage withRightImageFrame:(CGRect)rightImageRect;
/**
 示例代码
 UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,100, self.view.frame.size.width, 30)];
 //    label.backgroundColor = [UIColor purpleColor];
 [self.view addSubview:label];
 NSString *str = @"价格:";
 NSString *str1 = @"￥";
 NSString *str2 = @"22";
 NSString *str3 = @".22";
 NSString *str4 =  @"个数";
 NSArray *textArray = [NSArray arrayWithObjects:str,str1,str2,str3,str4,nil];
 NSArray *fontArray = @[@"11",@"13",@"25",@"17",@"14"];
 NSArray *colorArray = @[@"#b2b2b2",@"#ff8900",@"#333333",@"#999999",@"#DCDCDC"];
 NSAttributedString *attributeStr = [ZYLabelAttributedString changeLabelWithText:textArray addAattributesAboutFont:fontArray withAboutColor:colorArray];
 [label setAttributedText:attributeStr];
 
 **/

@end
