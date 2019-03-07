//
//  MLCalendarView.m
//  MLCalendar
//
//  Created by yizhilu on 2019/3/6.
//  Copyright © 2019年 杨磊. All rights reserved.
//

#import "MLCalendarView.h"
#import "MLDateModel.h"
#import "NSDate+MLCalender.h"
#import "MLCalendarCollectionViewCell.h"
#define NumberMounthes 7 //想要展示的天数

@interface MLCalendarView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *array;
@property (nonatomic,assign)int count;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,assign)NSInteger selectRow;
@end

@implementation MLCalendarView
static NSString *cellID = @"cellID";

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //    当前时间日期
        NSDate *currentDate = [NSDate date];
        [self configureData:currentDate];
        [self layoutView];
    }
    return self;
}

- (void)layoutView{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    titleLabel.font = [UIFont systemFontOfSize:12.0f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
    
    NSDate *currentDate = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |  NSCalendarUnitDay |
    NSCalendarUnitHour |  NSCalendarUnitMinute |
    NSCalendarUnitSecond | NSCalendarUnitWeekday;
    // 获取不同时间字段的信息
    NSDateComponents* comp = [gregorian components: unitFlags
                                          fromDate:currentDate];
    titleLabel.text = [NSString stringWithFormat:@"%ld年%ld月",comp.year,comp.month];
    self.titleLabel = titleLabel;
    
    CGFloat width = ([UIScreen mainScreen].bounds.size.width-60)/7;
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc]init];
    flowlayout.minimumLineSpacing = 0;
    flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowlayout.itemSize = CGSizeMake(width, 80);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(titleLabel.frame), [UIScreen mainScreen].bounds.size.width-60, 80) collectionViewLayout:flowlayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self addSubview:collectionView];
    [collectionView registerClass:[MLCalendarCollectionViewCell class] forCellWithReuseIdentifier:cellID];
    self.collectionView = collectionView;
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(CGRectGetMaxX(self.collectionView.frame), CGRectGetMaxY(titleLabel.frame), 30, 80);
    [nextButton setTitle:@">" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:nextButton];
    
    UIButton *privousButton = [UIButton buttonWithType:UIButtonTypeCustom];
    privousButton.frame = CGRectMake(0, CGRectGetMaxY(titleLabel.frame), 30, 80);
    [privousButton setTitle:@"<" forState:UIControlStateNormal];
    [privousButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [privousButton addTarget:self action:@selector(previousAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:privousButton];

}

- (void)configureData:(NSDate *)currentDate{
    //    获取当前月份
    NSInteger mounth = [currentDate month:currentDate];
    //    当前月份的天数
    NSInteger daysInMounth = [currentDate totaldaysInMonth:currentDate];
    //    获取那一年
    NSInteger year = [currentDate year:currentDate];
    //    获取当前是哪号
    NSInteger day = [currentDate day:currentDate];
    //    当前星期几
    NSInteger week = [currentDate getweekDayStringWithDate:currentDate];
    //    获取上一个月当前时间
    NSDate *previousDate = [currentDate getPriousorLaterDateFromDate:currentDate withMonth:-1];
    //    获取上个月总天数
    NSInteger privousDaysInMounth = [previousDate totaldaysInMonth:previousDate];
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < NumberMounthes; i++) {
        MLDateModel *model = [[MLDateModel alloc]init];
        model.count = i;
        model.year = year;
        model.month = mounth;
        if (week-1 == i) {
            //      当前时间所在日期
            model.date = day;
            model.isSelect = YES;
            self.selectRow = i;
            self.titleLabel.text = [NSString stringWithFormat:@"%ld年%ld月",model.year,model.month];
        }else if (week-1 < i){
            //      需要考虑下一个月的总天数
            if (day+(i-week+1) > daysInMounth) {
                model.date = day+(i-week+1)-daysInMounth;
                model.month = mounth+1;
                if (mounth == 12) {
                    model.year = year+1;
                    model.month = 1;
                }
            }else{
                model.date = day+(i-week+1);
            }
        }else if (week-1 > i){
            //      需要考虑上一个月的总天
            if (day-(week-1-i) <= 0) {
                //  获取前一个月的总天数
                model.date = privousDaysInMounth+day-(week-1-i);
                model.month = mounth-1;
                if (mounth == 1) {
                    model.year = year-1;
                    model.month = 12;
                }

            }else{
                model.date = day-(week-1-i);
            }
        }
        [array addObject:model];
    }
    self.array = array;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MLCalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    cell.model = self.array[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.selectRow) return;
    MLDateModel *model = self.array[indexPath.row];
    MLDateModel *selectModel = self.array[self.selectRow];
    selectModel.isSelect = NO;
    model.isSelect = YES;

    [self.collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.selectRow inSection:0],indexPath]];
    self.titleLabel.text = [NSString stringWithFormat:@"%ld年%ld月",model.year,model.month];

    self.selectRow = indexPath.row;
}

- (void)nextAction:(UIButton *)sender{
    //    当前时间日期
    NSDate *currentDate = [NSDate date];
    self.count++;
    [self configureData:[currentDate getPriousorLaterDateFromDate:currentDate withDate:7*self.count]];
    [self.collectionView reloadData];
}

- (void)previousAction:(UIButton *)sender{
    //    当前时间日期
    NSDate *currentDate = [NSDate date];
    self.count--;
    if (self.count<0) {
        self.count = 0;
        return;
    }
    [self configureData:[currentDate getPriousorLaterDateFromDate:currentDate withDate:7*self.count]];
    [self.collectionView reloadData];

}
@end
