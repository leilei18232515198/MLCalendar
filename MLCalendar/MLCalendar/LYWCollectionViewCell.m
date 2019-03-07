//
//  LYWCollectionViewCell.m
//  MLCalendar
//
//  Created by yizhilu on 2019/3/6.
//  Copyright © 2019年 刘朋坤. All rights reserved.
//

#import "LYWCollectionViewCell.h"

@implementation LYWCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        _dateLable = [[UILabel alloc] initWithFrame:self.bounds];
        [_dateLable setTextAlignment:NSTextAlignmentCenter];
        [_dateLable setFont:[UIFont systemFontOfSize:17]];
        _dateLable.textColor = [UIColor blackColor];
        [self addSubview:_dateLable];
    }
    return self;
}
@end
