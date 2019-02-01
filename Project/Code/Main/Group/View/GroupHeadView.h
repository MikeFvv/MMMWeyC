//
//  GroupHeadView.h
//  Project
//
//  Created by mini on 2018/8/16.
//  Copyright © 2018年 CDJay. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GroupNet;

typedef void (^HeadClick)(NSInteger index);

@interface GroupHeadView : UIView

@property (nonatomic, copy) HeadClick click;

+ (GroupHeadView *)headViewWithModel:(GroupNet *)model;

@end