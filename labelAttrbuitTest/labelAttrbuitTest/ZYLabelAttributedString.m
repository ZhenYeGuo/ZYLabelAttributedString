//
//  ZYLabelAttributedString.m
//  labelAttrbuitTest
//
//  Created by 鸩夜 on 2018/6/2.
//  Copyright © 2018年 KuoShuChing. All rights reserved.
//

#import "ZYLabelAttributedString.h"
#import "UIColor+KQExpanded.h"

@implementation ZYLabelAttributedString



+(NSMutableAttributedString*)changeLabelWithText:(NSArray*)textArray addAattributesAboutFont:(NSArray*)fontArray withAboutColor:(NSArray*)colorArray{
   
    NSString *textStr = [textArray componentsJoinedByString:@","];
    NSString *strUrl = [textStr stringByReplacingOccurrencesOfString:@"," withString:@""];
     NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:strUrl];
    if (textArray.count ==fontArray.count ||fontArray.count ==colorArray.count) {
        NSInteger strLocation = 0;
        for (int i=0; i<textArray.count; i++) {
            //m做了改动，加了weight:UIFontWeightMedium
            UIFont *font = [UIFont systemFontOfSize:[fontArray[i] floatValue] weight:UIFontWeightMedium];
            NSString *str = textArray[i];
            
            [attrString addAttribute:NSFontAttributeName value:font range:NSMakeRange(strLocation,str.length)];
            [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor hexStringToColor:colorArray[i]] range:NSMakeRange(strLocation,str.length)];
           
                strLocation = strLocation+str.length;
          
            
        }
    }
    return attrString;
}


+(NSMutableAttributedString*)changeLabelWithText:(NSArray*)textArray addAattributesAboutFont:(NSArray*)fontArray withAboutColor:(NSArray*)colorArray fontWright:(UIFontWeight)fontWeight
{
    NSString *textStr = [textArray componentsJoinedByString:@","];
    NSString *strUrl = [textStr stringByReplacingOccurrencesOfString:@"," withString:@""];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:strUrl];
    if (textArray.count ==fontArray.count ||fontArray.count ==colorArray.count) {
        NSInteger strLocation = 0;
        for (int i=0; i<textArray.count; i++) {
            UIFont *font = [UIFont systemFontOfSize:[fontArray[i] floatValue] weight:fontWeight];
            NSString *str = textArray[i];
            
            [attrString addAttribute:NSFontAttributeName value:font range:NSMakeRange(strLocation,str.length)];
            [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor hexStringToColor:colorArray[i]] range:NSMakeRange(strLocation,str.length)];
            
            strLocation = strLocation+str.length;
            
            
        }
    }
    return attrString;
}

/**
 价格中划线

 @param inputStr 价格使用"¥"而不是"￥"
 @return 带中划线的字符串
 */
+ (NSMutableAttributedString *)textInput:(NSString *)inputStr{
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:inputStr attributes:attribtDic];
    return attribtStr;
}

/**
 创建带图片的富文本，用于label显示

 @param nomalString 传入的string
 @param leftImage 左边的图片
 @param leftImageRect 左边图片在label中的frame
 @param rightImage 右边图片
 @param rightImageRect 右边图片在label中的frame
 @return 富文本
 */
+ (NSMutableAttributedString*)creatAttributedString:(NSString*)nomalString andLetfImage:(UIImage*)leftImage withLeftImageFrame:(CGRect)leftImageRect andRightImage:(UIImage*)rightImage withRightImageFrame:(CGRect)rightImageRect{
    //创建富文本
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"  %@  ",nomalString]];

    if (leftImage) {
        //NSTextAttachment可以将要插入的图片作为特殊字符处理
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        //定义图片内容及位置和大小
        attch.image = leftImage;
        attch.bounds = leftImageRect;
        //创建带有图片的富文本
        NSAttributedString *stringLeft = [NSAttributedString attributedStringWithAttachment:attch];
        //将图片放在第一位
        [attri insertAttributedString:stringLeft atIndex:0];
    }
    if (rightImage) {
        //NSTextAttachment可以将要插入的图片作为特殊字符处理
        NSTextAttachment *attchright = [[NSTextAttachment alloc] init];
        //定义图片内容及位置和大小
        attchright.image =rightImage;
        attchright.bounds = rightImageRect;
        
        NSAttributedString *stringRight = [NSAttributedString attributedStringWithAttachment:attchright];
        //将图片放在最后一位
        [attri appendAttributedString:stringRight];
    }
    //用label的attributedText属性来使用富文本
    return attri;
}




@end
