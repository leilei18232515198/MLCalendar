//
//  MLDateModel.m
//  MLCalendar
//
//  Created by yizhilu on 2019/3/6.
//  Copyright © 2019年 杨磊. All rights reserved.
//

#import "MLDateModel.h"

@implementation MLDateModel


- (void)setCount:(NSInteger)count{
    _count = count;
    NSArray *array = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    self.week = array[_count];
}
@end
