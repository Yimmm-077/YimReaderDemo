//
//  QLBottomMenuView.m
//  YimReaderDemo
//
//  Created by Yimmm on 2020/3/5.
//  Copyright © 2020 Yimmm. All rights reserved.
//

#import "QLBottomMenuView.h"
#import "QLtapMenuView.h"

@interface QLBottomMenuView ()
//@property (nonatomic,strong) LSYReadProgressView *progressView;
//@property (nonatomic,strong) LSYThemeView *themeView;
//@property (nonatomic,strong) UIButton *minSpacing;
//@property (nonatomic,strong) UIButton *mediuSpacing;
//@property (nonatomic,strong) UIButton *maxSpacing;
//@property (nonatomic,strong) UISlider *slider;

@property (nonatomic,strong) UIButton * catalog;
@property (nonatomic,strong) UIButton * bookMarkTag;

//@property (nonatomic,strong) UIButton *lastChapter;
//@property (nonatomic,strong) UIButton *nextChapter;
//@property (nonatomic,strong) UIButton *increaseFont;
//@property (nonatomic,strong) UIButton *decreaseFont;
//@property (nonatomic,strong) UILabel *fontLabel;

@end



@implementation QLBottomMenuView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];

    [self addSubview:self.catalog];
    [self addSubview:self.bookMarkTag];

}

#pragma mark - setter getter | init



-(UIButton *)catalog
{
    if (!_catalog) {
        _catalog = [QLReadParser ReadButtonToTarget:self action:@selector(showCatalog)];
        [_catalog setImage:[UIImage imageNamed:@"reader_cover"] forState:UIControlStateNormal];
    }
    return _catalog;
}

- (UIButton *)bookMarkTag
{
    if (!_bookMarkTag)
    {
        _bookMarkTag = [QLReadParser ReadButtonToTarget:self action:@selector(showMarkTag)];
        [_bookMarkTag setImage:[[UIImage imageNamed:@"bookMarkTag.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
    }
    return _bookMarkTag;
}


#pragma mark - private Method


-(void)showCatalog
{
    if ([self.delegate respondsToSelector:@selector(menuViewInvokeCatalog:)]) {
        [self.delegate menuViewInvokeCatalog:self];
    }
}

- (void)showMarkTag
{
    if ([self.delegate respondsToSelector:@selector(menuVCpresentToMarkVC)]) {
        [self.delegate menuVCpresentToMarkVC];
    }
}





-(void)layoutSubviews
{
    [super layoutSubviews];

    _catalog.frame = CGRectMake(0, 0, ViewFrameSize(self).width / 2, ViewFrameSize(self).height);

    _bookMarkTag.frame = CGRectMake(ViewFrameSize(self).width / 2, 0, ViewFrameSize(self).width / 2, ViewFrameSize(self).height);

}


@end


//
//
//@interface LSYThemeView ()
//@property (nonatomic,strong) UIView *theme1;
//@property (nonatomic,strong) UIView *theme2;
//@property (nonatomic,strong) UIView *theme3;
//@end
//
//@implementation LSYThemeView
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self setup];
//    }
//    return self;
//}
//-(void)setup{
//    [self setBackgroundColor:[UIColor clearColor]];
//    [self addSubview:self.theme1];
//    [self addSubview:self.theme2];
//    [self addSubview:self.theme3];
//}
//-(UIView *)theme1
//{
//    if (!_theme1) {
//        _theme1 = [[UIView alloc] init];
//        _theme1.backgroundColor = [UIColor whiteColor];
//        [_theme1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeTheme:)]];
//    }
//    return _theme1;
//}
//-(UIView *)theme2
//{
//    if (!_theme2) {
//        _theme2 = [[UIView alloc] init];
//        _theme2.backgroundColor = [UIColor lightGrayColor];
//        [_theme2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeTheme:)]];
//    }
//    return _theme2;
//}
//-(UIView *)theme3
//{
//    if (!_theme3) {
//        _theme3 = [[UIView alloc] init];
//        _theme3.backgroundColor = RGB(190, 182, 162);
//        [_theme3 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeTheme:)]];
//    }
//    return _theme3;
//}
//-(void)changeTheme:(UITapGestureRecognizer *)tap
//{
//    // tap（轻触对象）.view（的视图）
//    [[NSNotificationCenter defaultCenter] postNotificationName:QLBottomThemeNotification object:tap.view.backgroundColor];
//}
//-(void)layoutSubviews
//{
//    CGFloat spacing = (ViewFrameSize(self).width-50*3)/4;
//    _theme1.frame = CGRectMake(spacing, 0, 50, 50);
//    _theme2.frame = CGRectMake(DistanceFromLeftView(_theme1)+spacing, 0, 50, 50);
//    _theme3.frame = CGRectMake(DistanceFromLeftView(_theme2)+spacing, 0, 50, 50);
//}
//@end
