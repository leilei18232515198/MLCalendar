//
//  MLCalendarCollectionViewCell.m
//  MLCalendar
//
//  Created by yizhilu on 2019/3/6.
//  Copyright © 2019年 杨磊. All rights reserved.
//

#import "MLCalendarCollectionViewCell.h"
#import "MLDateModel.h"

@interface MLCalendarCollectionViewCell()

@property (nonatomic,strong)UILabel *weekLabel;
@property (nonatomic,strong)UILabel *dayLabel;
@end
@implementation MLCalendarCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self configureCellView];
    }
    return self;
}

- (void)configureCellView{
    CGFloat width = ([UIScreen mainScreen].bounds.size.width-60)/7;
    UILabel *weekLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 40)];
    weekLabel.textAlignment = NSTextAlignmentCenter;
    weekLabel.font = [UIFont systemFontOfSize:12.0f];
    [self.contentView addSubview:weekLabel];
    self.weekLabel = weekLabel;
    
    UILabel *dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.weekLabel.frame), width, 40)];
    dayLabel.textAlignment = NSTextAlignmentCenter;
    weekLabel.font = [UIFont systemFontOfSize:13.0f];
    [self.contentView addSubview:dayLabel];
    self.dayLabel = dayLabel;
}

- (void)setModel:(MLDateModel *)model{
    _model = model;
    self.weekLabel.text = _model.week;
    self.dayLabel.text = [NSString stringWithFormat:@"%ld",_model.date];
    
    if (model.isSelect) {
        self.contentView.backgroundColor = [UIColor greenColor];
        self.weekLabel.textColor = [UIColor whiteColor];
        self.dayLabel.textColor = [UIColor whiteColor];
    }else{
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.weekLabel.textColor = [UIColor blackColor];
        self.dayLabel.textColor = [UIColor blackColor];
    }
}
@end
