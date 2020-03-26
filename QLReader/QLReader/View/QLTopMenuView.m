//
//  QLTopMenuView.m
//  YimReaderDemo
//
//  Created by Yimmm on 2020/3/5.
//  Copyright © 2020 Yimmm. All rights reserved.
//

#import "QLTopMenuView.h"

@interface QLTopMenuView ()
@property (nonatomic,strong) UIButton *back;
@property (nonatomic,strong) UIButton *bookMarkTag;

@end


@implementation QLTopMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    [self addSubview:self.back];
    [self addSubview:self.bookMarkTag];
}

-(UIButton *)back
{
    if (!_back) {
//        _back = [QLReadParser commonButtonSEL:@selector(backView) target:self];
        _back = [QLReadParser ReadButtonToTarget:self action:@selector(backToUpperView)];
        
        [_back setImage:[UIImage imageNamed:@"bg_back_white"] forState:UIControlStateNormal];
    }
    return _back;
}


-(UIButton *)bookMarkTag
{
    if (!_bookMarkTag) {
        _bookMarkTag = [QLReadParser ReadButtonToTarget:self action:@selector(markReadBook)];
        [_bookMarkTag setImage:[[UIImage imageNamed:@"Mark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]forState:UIControlStateNormal];
//        [_bookMarkTag setImageEdgeInsets:UIEdgeInsetsMake(7.5, 12.5, 7.5, 12.5)];
    }
    return _bookMarkTag;
}

-(void)setState:(BOOL)state
{
    _state = state;
    if (state) {
        [_bookMarkTag setImage:[[UIImage imageNamed:@"Mark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        return;
    }
    [_bookMarkTag setImage:[[UIImage imageNamed:@"Mark.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]forState:UIControlStateNormal];
}

#pragma mark - Private Method

- (void)markReadBook
{
    [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:QLClickMarkBtnNoti object:nil]];
}


-(void)backToUpperView
{
    [[QLReadParser getCurrentVC] dismissViewControllerAnimated:YES completion:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:dismissVCNoti object:nil];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    _back.frame = CGRectMake(0, 24, 40, 40);
    _bookMarkTag.frame = CGRectMake(ViewFrameSize(self).width-50, 24, 40, 40);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
