//
//  ViewController.m
//  regexKitLitePractice
//
//  Created by rwli on 16/11/24.
//  Copyright © 2016年 companyName. All rights reserved.
//

//http://www.mamicode.com/info-detail-969110.html这个时比较好的教程

#import "ViewController.h"
#import "RegexKitLite.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* const textContent = @"NSAttributedString - An NSAttributedString object manages character strings and associated sets of attributes (for example, font and kerning) that apply to individual characters or ranges of characters in the string. An association of characters and their attributes is called an attributed string. The cluster’s two public classes, NSAttributedString and NSMutableAttributedString, declare the programmatic <a href=\"https://www.taobao.com\"> 来自我的iPhone6装逼客户端 </a> interface for read-only attributed strings and modifiable attributed strings, respectively.\n well my contact list is dimchumhaul@163.com or | tel:13896985686 | 王老师的电话是：15201022018";
    
    UITextView *v =[[UITextView alloc]init];
    v.frame =self.view.bounds;
    
 //1.可以找出所有的range。但是代码量大
//    NSRegularExpression *expression =[NSRegularExpression regularExpressionWithPattern:@"1[3578][0-9]{9}" options:NSRegularExpressionCaseInsensitive error:nil];
//   NSArray *arry= [expression matchesInString:textContent options:NSMatchingReportProgress range:NSMakeRange(0, textContent.length)];
//    NSMutableAttributedString *s =[[NSMutableAttributedString alloc]initWithString:textContent];
//    NSDictionary *attu =@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]};
//    for (NSTextCheckingResult *rs in arry) {
//        [s addAttributes:attu range:rs.range];
//    }
//    v.attributedText =s;
    
    
    //1.1 z还能找出第一个来
//  NSRange range =  [textContent rangeOfString:@"1[3578][0-9]{9}" options:NSRegularExpressionSearch];
//    if (range.location!=NSNotFound) {
//        NSLog(@"%@",NSStringFromRange(range));
//    }
    
    //2.可以找出所有的range，而且代码量小
//    [textContent enumerateStringsMatchedByRegex:@"[0-9]{11}" usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
//        NSLog(@"[-------%@----",NSStringFromRange(*capturedRanges));
//    }];
    [self.view insertSubview:v atIndex:0];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
