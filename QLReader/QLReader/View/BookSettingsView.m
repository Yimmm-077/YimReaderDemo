//
//  BookSettingsView.m
//  QLReader
//
//  Created by Yimmm on 2020/3/24.
//  Copyright © 2020 Yimmm. All rights reserved.
//

#import "BookSettingsView.h"

@interface BookSettingsView()

@property (nonatomic,strong) UIButton *increaseFont;
@property (nonatomic,strong) UIButton *decreaseFont;
@property (nonatomic,strong) UILabel *fontLabel;
@property (nonatomic,strong) LSYThemeView *themeView;


@end

@implementation BookSettingsView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI
{
    self.backgroundColor = [QLReadConfig shareInstance].theme;
    
    [self addSubview:self.increaseFont];
    [self addSubview:self.decreaseFont];
    [self addSubview:self.fontLabel];
    //    [self addSubview:self.progressView];
    [self addSubview:self.themeView];
    
    [[QLReadConfig shareInstance] addObserver:self forKeyPath:@"fontSize" options:NSKeyValueObservingOptionNew context:NULL];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeThemeColor:) name:QLBottomThemeNotification object:nil];
//    tap.view.backgroundColor
}


-(UIButton *)increaseFont
{
    if (!_increaseFont) {
        _increaseFont = [QLReadParser ReadButtonToTarget:self action:@selector(changeFont:)];
        [_increaseFont setTitle:@"A+" forState:UIControlStateNormal];
        [_increaseFont.titleLabel setFont:[UIFont systemFontOfSize:17]];
        [_increaseFont setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        _increaseFont.layer.borderWidth = 1;
        _increaseFont.layer.borderColor = [UIColor darkGrayColor].CGColor;
    }
    return _increaseFont;
}

-(UILabel *)fontLabel
{
    if (!_fontLabel) {
        _fontLabel = [[UILabel alloc] init];
        _fontLabel.font = [UIFont systemFontOfSize:16];
        _fontLabel.textColor = [UIColor blackColor];
        _fontLabel.textAlignment = NSTextAlignmentCenter;
        _fontLabel.text = [NSString stringWithFormat:@"%d",(int)[QLReadConfig shareInstance].fontSize];
    }
    return _fontLabel;
}


-(UIButton *)decreaseFont
{
    if (!_decreaseFont) {
        _decreaseFont = [QLReadParser ReadButtonToTarget:self action:@selector(changeFont:)];
        [_decreaseFont setTitle:@"A-" forState:UIControlStateNormal];
        [_decreaseFont.titleLabel setFont:[UIFont systemFontOfSize:17]];
        [_decreaseFont setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        _decreaseFont.layer.borderWidth = 1;
        _decreaseFont.layer.borderColor = [UIColor darkGrayColor].CGColor;
    }
    return _decreaseFont;
}

-(LSYThemeView *)themeView
{
    if (!_themeView) {
        _themeView = [[LSYThemeView alloc] init];
    }
    return _themeView;
}


#pragma mark - private Method


- (void)changeThemeColor:(NSNotification *)no
{
    [QLReadConfig shareInstance].theme = no.object;
    [self setBackgroundColor:[QLReadConfig shareInstance].theme];
}



-(void)changeFont:(UIButton *)sender
{
    
    if (sender == _increaseFont) {
        
        if (floor([QLReadConfig shareInstance].fontSize) == floor(MaxFontSize)) {
            [_increaseFont setEnabled:NO];
            return;
        }
        [_decreaseFont setEnabled:YES];
        [QLReadConfig shareInstance].fontSize++;
    }
    else{
        if (floor([QLReadConfig shareInstance].fontSize) == floor(MinFontSize)){
            [_decreaseFont setEnabled:NO];
            return;
        }
        [_increaseFont setEnabled:YES];
        [QLReadConfig shareInstance].fontSize--;
    }
    
//    if ([self.delegate respondsToSelector:@selector(menuViewFontSize:)]) {
//        [self.delegate menuViewFontSize:self];
//    }
}


// KVO监听
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    if ([keyPath isEqualToString:@"readModel.chapter"] || [keyPath isEqualToString:@"readModel.page"]) {
        //        _slider.value = _readModel.page/((float)(_readModel.chapterModel.pageCount-1))*100;
        //        [_progressView title:_readModel.chapterModel.title progress:[NSString stringWithFormat:@"%.1f%%",_slider.value]];
    }
    else if ([keyPath isEqualToString:@"fontSize"]){
        _fontLabel.text = [NSString stringWithFormat:@"%d",(int)[QLReadConfig shareInstance].fontSize];
    }
    //    else{
    //        if (_slider.state == UIControlStateNormal) {
    //            _progressView.hidden = YES;
    //        }
    //        else if(_slider.state == UIControlStateHighlighted){
    //            _progressView.hidden = NO;
    //        }
    //    }
}


-(void)layoutSubviews
{
    [super layoutSubviews];

    _decreaseFont.frame = CGRectMake(10, 100, (ViewFrameSize(self).width-20)/3, 30);
    _fontLabel.frame = CGRectMake(DistanceFromLeftView(_decreaseFont), 100, (ViewFrameSize(self).width-20)/3,  30);
    _increaseFont.frame = CGRectMake(DistanceFromLeftView(_fontLabel), 100,  (ViewFrameSize(self).width-20)/3, 30);
    _themeView.frame = CGRectMake(0, DistanceFromTopView(_decreaseFont)+30, ViewFrameSize(self).width, 50);

}



-(void)dealloc
{

    [[QLReadConfig shareInstance] removeObserver:self forKeyPath:@"fontSize"];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}



@end





@interface LSYThemeView ()
@property (nonatomic,strong) UIView *theme1;
@property (nonatomic,strong) UIView *theme2;
@property (nonatomic,strong) UIView *theme3;
@end

@implementation LSYThemeView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}
-(void)setup{
    [self setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.theme1];
    [self addSubview:self.theme2];
    [self addSubview:self.theme3];
}
-(UIView *)theme1
{
    if (!_theme1) {
        _theme1 = [[UIView alloc] init];
        _theme1.backgroundColor = [UIColor whiteColor];
        [_theme1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeTheme:)]];
    }
    return _theme1;
}
-(UIView *)theme2
{
    if (!_theme2) {
        _theme2 = [[UIView alloc] init];
        _theme2.backgroundColor = [UIColor lightGrayColor];
        [_theme2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeTheme:)]];
    }
    return _theme2;
}
-(UIView *)theme3
{
    if (!_theme3) {
        _theme3 = [[UIView alloc] init];
        _theme3.backgroundColor = RGB(190, 182, 162);
        [_theme3 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeTheme:)]];
    }
    return _theme3;
}

-(void)changeTheme:(UITapGestureRecognizer *)tap
{
    // tap（轻触对象）.view（的视图）
    [[NSNotificationCenter defaultCenter] postNotificationName:QLBottomThemeNotification object:tap.view.backgroundColor];
}

-(void)layoutSubviews
{
    CGFloat spacing = (ViewFrameSize(self).width-50*3)/4;
    _theme1.frame = CGRectMake(spacing, 0, 50, 50);
    _theme2.frame = CGRectMake(DistanceFromLeftView(_theme1)+spacing, 0, 50, 50);
    _theme3.frame = CGRectMake(DistanceFromLeftView(_theme2)+spacing, 0, 50, 50);
}
@end
