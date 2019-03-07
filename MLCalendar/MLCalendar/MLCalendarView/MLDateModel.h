//
//  MLDateModel.h
//  MLCalendar
//
//  Created by yizhilu on 2019/3/6.
//  Copyright © 2019年 杨磊. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MLDateModel : NSObject

@property (nonatomic,copy)NSString *week;
@property (nonatomic,assign)NSInteger date;
@property (nonatomic,assign)NSInteger count;
@property (nonatomic,assign)NSInteger year;
@property (nonatomic,assign)NSInteger month;
@property (nonatomic,assign)BOOL isSelect;
@end

NS_ASSUME_NONNULL_END
