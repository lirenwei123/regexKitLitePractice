//
//  ViewController.m
//  regexKitLitePractice
//
//  Created by rwli on 16/11/24.
//  Copyright © 2016年 companyName. All rights reserved.
//

/// 正则表达式的标准定义(学名) “用来表述字符串的字符串 作者是Perl语言编译器的作者 Larry Wall”

/// 程序员七种武器 7.正则表达式 1.C语言
/// OC中的正则 到底是什么？ 掉哪个类的哪个方法 可以进行最简单的正则捕获
/// OC中最简单的正则  |验证/捕获| 的方式 字符串类的 rangeOf。。。。

/**
 *  元字符  有三个特殊的元字符 * ? + 这三个有特殊的含义。这三个都是代表 “次数”
 -------------------------------------
 . : 代表任意单字符
 [0-9] : 代表数字
 [a-z] : 代表小子英文字母
 [A-Z] : ..
 (捕获) [范围] {次数}。
 -------------------------------------
 *  * : 任意多次
 *  ? : 0,1 次
 *  + : 1,N 次
 *  {1,} {,2} , {512} 代表 {最小多少次,最大多少次} 如果只给一个参数 代表 固定次数
 *  ^ : 正则开始
 *  | : 正则逻辑‘或者’
 *  $ : 正则结束
 *／
 */

/// 1.OC中正则第一种实现
/// 中国电话号码是有固定规律的 那就是 13 18 15 17 打头 总共11位数字

/*
 NSCaseInsensitiveSearch = 1,// 不区分大小写比较
 NSLiteralSearch = 2, //区分大小写比较
 NSBackwardsSearch = 4,//从字符串末尾开始搜索
 NSAnchoredSearch = 8,//搜索限制范围的字符串
 NSNumericSearch = 64,//按照字符串里的数字为依据，算出顺序。例如 Foo2.txt < Foo7.txt < Foo25.txt
 NSDiacriticInsensitiveSearch = 128,//忽略 "-" 符号的比较
 NSWidthInsensitiveSearch = 256,//忽略字符串的长度，比较出结果</em></span>
 NSForcedOrderingSearch = 512,//忽略不区分大小写比较的选项，并强制返回 NSOrderedAscending 或者 NSOrderedDescending
 NSRegularExpressionSearch = 1024 //只能应用于 rangeOfString:..., stringByReplacingOccurrencesOfString:...和 replaceOccurrencesOfString:... 方法。使用通用兼容的比较方法，如果设置此项，可以去掉 NSCaseInsensitiveSearch 和 NSAnchoredSearch
 
 */


//http://www.mamicode.com/info-detail-969110.html这个时比较好的教程
//http://regexkit.sourceforge.net/RegexKitLite/index.html#NSString_RegexKitLiteAdditions__Xcode3IntegratedDocumentation

#import "ViewController.h"
#import "RegexKitLite.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* const textContent = @"NSAttributedString - An NSAttributedString object manages character strings and associated sets of attributes (for example, font and kerning) that apply to individual characters or ranges of characters in the string. An association of characters and their attributes is called an attributed string. The cluster’s two public classes, NSAttributedString and NSMutableAttributedString, declare the programmatic <a href=\"https://www.taobao.com\"> 来自我的iPhone6装逼客户端 </a> interface for read-only attributed strings and modifiable attributed strings, respectively.\n well my contact list is dimchumhaul@163.com or | tel:13896985686 | 王老师的电话是：15201022018";
    
    
 //1.可以找出所有的range。但是代码量大
//    NSRegularExpression *expression =[NSRegularExpression regularExpressionWithPattern:@"1[3578][0-9]{9}" options:NSRegularExpressionCaseInsensitive error:nil];
//   NSArray *arry= [expression matchesInString:textContent options:NSMatchingReportProgress range:NSMakeRange(0, textContent.length)];
//    NSMutableAttributedString *s =[[NSMutableAttributedString alloc]initWithString:textContent];
//    NSDictionary *attu =@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1]};
//    for (NSTextCheckingResult *rs in arry) {
//        [s addAttributes:attu range:rs.range];
//    }
//    v.attributedText =s;
    
    
    //1.1 只能找出第一个range来
//  NSRange range =  [textContent rangeOfString:@"1[3578][0-9]{9}" options:NSRegularExpressionSearch];
//    if (range.location!=NSNotFound) {
//        NSLog(@"%@",NSStringFromRange(range));
//    }
    
    //1.2 只能找出第一个字符串
//    NSString *str =[textContent stringByMatching:@"[0-9]{11}" ];
//    
//    NSLog(@"%@",str);
    
    //2.可以找出所有的range，而且代码量小
//    [textContent enumerateStringsMatchedByRegex:@"[0-9]{11}" usingBlock:^(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
//        NSLog(@"[-------%@----",NSStringFromRange(*capturedRanges));
//    }];
    //2.2可以返回所有的str
//    for (NSString *str in [textContent componentsMatchedByRegex:@"[0-9]{11}"]) {
//        NSLog(@"%@",str);
//    }
  //2.3替换
//    NSString *str =[textContent stringByReplacingOccurrencesOfRegex:@"[0-9]{11}" withString:@"123"];
//     NSLog(@"%@",str);
    //2.4
//    NSString *searchString      = @"This is neat.";
//    NSString *regexString       = @"\\b(\\w+)\\b";
//    NSString *replaceWithString = @"{$1}";
//    NSString *replacedString    = NULL;
//    
//    replacedString = [searchString stringByReplacingOccurrencesOfRegex:regexString withString:replaceWithString];
//    
//    NSLog(@"replaced string: '%@'", replacedString);
   
//    NSString *replaceWithString = @"{$1}";
//    NSString *str =[searchString stringByReplacingOccurrencesOfRegex:@"(\\w+)" //要加（）
//                                                          withString:@"$1"];
//    NSLog(@"%@",str);
    
    
    //3.可变str  直接替换，返回替换次数，并且改变了原来的str；
//    NSMutableString *str=[NSMutableString stringWithString:@"hello the word"];
//    NSInteger count =[str replaceOccurrencesOfRegex:@"(\\w+)" withString:@"[$1]"];
//    NSLog(@"%lu--%@",count, str);
    
    //3.1 可变str 替换block 返回替换次数以及可以在block里去改变获取的每一个str
//   NSInteger count= [str replaceOccurrencesOfRegex:@"\\w+" usingBlock:^NSString *(NSInteger captureCount, NSString *const __unsafe_unretained *capturedStrings, const NSRange *capturedRanges, volatile BOOL *const stop) {
//       return [NSString stringWithFormat:@"{%@}",[capturedStrings[0] capitalizedString]];
//   }];
//     NSLog(@"%lu--%@",count, str);
    
//    \\s 空格
    //3.2
//    NSString *searchString = @"$10.23, $1024.42, $3099";
//    NSString *regexString  = @"$((\\d+)(?:\\.(\\d+)|\\.?))";
//    NSArray *arry =[searchString componentsSeparatedByRegex:regexString];
//    NSLog(@"%@",arry);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
