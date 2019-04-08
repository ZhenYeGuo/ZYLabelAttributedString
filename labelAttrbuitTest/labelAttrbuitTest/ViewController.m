//
//  ViewController.m
//  labelAttrbuitTest
//
//  Created by 鸩夜 on 2018/6/2.
//  Copyright © 2018年 KuoShuChing. All rights reserved.
//

#import "ViewController.h"
#import "ZYLabelAttributedString.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100,100, self.view.frame.size.width, 30)];
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
    
    //图片文本设置
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(100,300, self.view.frame.size.width, 30)];
    //    label.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:label2];
    NSMutableAttributedString *imageAttributedStr = [ZYLabelAttributedString creatAttributedString:@"左边图片" andLetfImage:[UIImage imageNamed:@"发起者"] withLeftImageFrame:CGRectMake(0, -5, 20, 20) andRightImage:nil withRightImageFrame:CGRectZero];
    label2.attributedText = imageAttributedStr;

    //价格中划线设置
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(100,400, self.view.frame.size.width, 30)];
    //    label.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:label3];
    [label3 setAttributedText:[ZYLabelAttributedString textInput:[NSString stringWithFormat:@"¥%@",@"28.90"]]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
