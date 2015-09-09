//
//  WWSegmentController.m
//
//  Created by Jerome on 14-9-11.
//  Copyright (c) 2014年 Jianqiang Meng. All rights reserved.
//

#import "WWSegmentController.h"

@interface WWSegmentController ()
{
    NSMutableArray * _items;
}
@property (nonatomic, strong) NSArray * names;
@property (nonatomic, strong) UIImageView * messageBadge;
@property (nonatomic, strong) UIImageView * informationBadge;
@end

@implementation WWSegmentController

- (id)initWithFrame:(CGRect)frame andSegmentNames:(NSArray *)items{
    if(self = [super initWithFrame:frame]){
        _names = [[NSArray alloc]initWithArray:items];
        [self initSegmentView];
    }
    return self;
}

- (void)initSegmentView{
    [self setNormalValueForProperty];
    _items = [[NSMutableArray alloc]initWithCapacity:_names.count];
    float segmentWidth = self.frame.size.width/_names.count;
    for(int i=0;i<[_names count];i++){
        NSString * itemName = _names[i];
        UIView * itemView = [[UIView alloc]initWithFrame:CGRectMake(segmentWidth*i, 0, segmentWidth, CGRectGetHeight(self.frame))];
        itemView.backgroundColor = _normalBackgroundColor;
        
        if (i == 0 || i == [_items count] - 1) {
//            itemView.layer.cornerRadius = _cornerRadius;
            itemView.layer.masksToBounds = YES;
        }
        
        UILabel * titleLabel = [[UILabel alloc] initWithFrame:itemView.bounds];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = _normalBackgroundColor;
        titleLabel.textColor = _normalTextColor;
        titleLabel.text = itemName;
        titleLabel.font = _font;
        titleLabel.tag = 2013+i;
        [itemView addSubview:titleLabel];
        
        if(i == _normalSeletedIndex){
            itemView.backgroundColor = _selectedBackgroundColor;
            titleLabel.backgroundColor = _selectedBackgroundColor;
            titleLabel.textColor = _selectedTextColor;
        }
        //竖线
        if(i != [_names count]-1){
            UIView * line = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(itemView.frame) - 1, 0.0, 2.0, CGRectGetHeight(itemView.frame))];
            line.backgroundColor = _boardColor;
            [itemView addSubview:line];
        }
        
        [self addSubview:itemView];
        [_items addObject:itemView];
    }
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = _cornerRadius;
    self.layer.borderWidth = _boardWidth;
    self.layer.borderColor = _boardColor.CGColor;
    
    _messageBadge = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ios_new_yellow"]];
    _messageBadge.frame = CGRectMake(self.bounds.size.width-15, 8, 10, 10);
    _messageBadge.hidden = YES;
    [self addSubview:_messageBadge];
    
    _informationBadge = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ios_new_yellow"]];
    _informationBadge.frame = CGRectMake(10, 8, 10, 10);
    _informationBadge.hidden = YES;
    [self addSubview:_informationBadge];
}

- (void)setSelectIndex:(NSInteger)selectIndex
{
    _normalSeletedIndex = selectIndex;
    
    for (int i = 0; i < [_items count]; i ++) {
        UIView *itemView = [_items objectAtIndex:i];
        UILabel *titleLabel = (UILabel *)[itemView viewWithTag:2013+i];
        if (i == _normalSeletedIndex) {
            itemView.backgroundColor = _selectedBackgroundColor;
            titleLabel.textColor = _selectedTextColor;
            titleLabel.backgroundColor = _selectedBackgroundColor;
        } else {
            itemView.backgroundColor = _normalBackgroundColor;
            titleLabel.textColor = _normalTextColor;
            titleLabel.backgroundColor = _normalBackgroundColor;
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    float width = self.frame.size.width/[_items count];
    self.selectIndex = point.x / width;
    
    // 事件传递
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)setNormalValueForProperty{
    if(!_boardWidth){
        _boardWidth = 1.0f;
    }
    if(!_cornerRadius){
        _cornerRadius = 3.0f;
    }
    if(!_normalSeletedIndex){
        _normalSeletedIndex = 0;
    }
    if(!_boardColor){
        _boardColor = [UIColor whiteColor];
    }
    if(!_selectedBackgroundColor){
        _selectedBackgroundColor = [UIColor whiteColor];
    }
    if(!_normalBackgroundColor){
        _normalBackgroundColor = [UIColor colorWithRed:1.0 green:80.0/255.0 blue:70.0/255.0 alpha:1.0];
    }
    if(!_selectedTextColor){
        _selectedTextColor = [UIColor colorWithRed:1.0 green:80.0/255.0 blue:70.0/255.0 alpha:1.0];
    }
    if(!_normalTextColor){
        _normalTextColor = [UIColor whiteColor];
    }
    if(!_font){
        _font = [UIFont systemFontOfSize:14.0f];
    }
}

- (void)showMessageBadge:(BOOL)needShow{
    _messageBadge.hidden = needShow;
}

- (void)showInformationBadge:(BOOL)needShow{
    _informationBadge.hidden = needShow;
}
@end
