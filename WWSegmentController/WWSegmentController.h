//
//  WWSegmentController.h
//
//  Created by Jerome on 14-9-11.
//  Copyright (c) 2014年 Jianqiang Meng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWSegmentController : UIControl
@property (nonatomic, assign) float boardWidth;
@property (nonatomic, assign) float cornerRadius;
@property (nonatomic, assign) NSInteger normalSeletedIndex;
@property (nonatomic, strong) UIFont * font;
@property (nonatomic, strong) UIColor * boardColor;
@property (nonatomic, strong) UIColor * selectedBackgroundColor;
@property (nonatomic, strong) UIColor * normalBackgroundColor;
@property (nonatomic, strong) UIColor * selectedTextColor;
@property (nonatomic, strong) UIColor * normalTextColor;

- (id)initWithFrame:(CGRect)frame andSegmentNames:(NSArray *)items;
- (void)showMessageBadge:(BOOL)needShow;
- (void)showInformationBadge:(BOOL)needShow;
@end
