//
//  MLCalendarCollectionViewCell.h
//  MLCalendar
//
//  Created by yizhilu on 2019/3/6.
//  Copyright © 2019年 杨磊. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MLDateModel;

NS_ASSUME_NONNULL_BEGIN

@interface MLCalendarCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong)MLDateModel *model;
@end

NS_ASSUME_NONNULL_END
