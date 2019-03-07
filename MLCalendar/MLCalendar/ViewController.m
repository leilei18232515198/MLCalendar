//
//  ViewController.m
//  MLCalendar
//
//  Created by yizhilu on 2019/3/6.
//  Copyright © 2019年 杨磊. All rights reserved.
//

#import "ViewController.h"
#import "MLCalendarView.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
//    [formatter1 setDateFormat:@"yyyy-MM-dd"];
//    // 要转换的日期字符串
//    NSString *dateString1 = @"2019-03-01";
    // NSDate形式的日期
//    NSDate *currentDate =[formatter1 dateFromString:dateString1];

        
        MLCalendarView *calendarView = [[MLCalendarView alloc]initWithFrame:CGRectMake(0, 100, ScreenWidth, 120)];
        [self.view addSubview:calendarView];
}
    
@end
