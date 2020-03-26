//
//  QLTapMenuViewController.m
//  QLReader
//
//  Created by Yimmm on 2020/3/23.
//  Copyright © 2020 Yimmm. All rights reserved.
//

#import "QLTapMenuViewController.h"

@interface QLTapMenuViewController () <QLMenuDelegate,UIGestureRecognizerDelegate,QLMenuChapterVCDelegate>



//@property (nonatomic,strong) UIView * catalogView;  //侧边栏背景
@property (nonatomic,strong) QLMenuCataLogViewController * menuCatalogVC;   //目录栏
@property (nonatomic,strong) QLBookMarkVC *  bookMarkVC;   //书签栏

@end

@implementation QLTapMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.tapMenuView];
    // 屏幕快照截图背景和章节VC
//    [self.view addSubview:self.catalogView];
//
//    [self addChildViewController:self.menuCatalogVC];
//    [self.catalogView addSubview:self.menuCatalogVC.view];
    
    [self.tapMenuView showAnimation:YES];

    // 添加屏幕点击手势，退出菜单
//    [self.view addGestureRecognizer:({
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissTapMenu)];
//        tap.delegate = self;
//        tap;
//    })];
    // Do any additional setup after loading the view.
}



#pragma  mark - setter getter | init

-(QLtapMenuView *)tapMenuView
{
    if (!_tapMenuView) {
        _tapMenuView = [[QLtapMenuView alloc] initWithFrame:self.view.frame];
        _tapMenuView.hidden = YES;
        _tapMenuView.delegate = self;
        _tapMenuView.recordModel = _RBmodel.RBrecord;
    }
    return _tapMenuView;
}

//-(UIView *)catalogView
//{
//    if (!_catalogView) {
//        _catalogView = [[UIView alloc] initWithFrame:CGRectMake(-ViewFrameSize(self.view).width, 0, ViewFrameSize(self.view).width * 2, ViewFrameSize(self.view).height)];
//        _catalogView.backgroundColor = [UIColor clearColor];
//        _catalogView.hidden = YES;
//        [_catalogView addGestureRecognizer:({
//            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenCatalog)];
//            tap.delegate = self;
//            tap;
//        })];
//    }
//    return _catalogView;
//}

- (QLMenuCataLogViewController *)menuCatalogVC
{
    if (!_menuCatalogVC) {
        _menuCatalogVC = [[QLMenuCataLogViewController alloc] init];
        _menuCatalogVC.readModel = _RBmodel;
        _menuCatalogVC.catalogDelegate = self;
    }
    return _menuCatalogVC;
}

- (QLBookMarkVC *)bookMarkVC
{
    if (!_bookMarkVC)
    {
        _bookMarkVC = [[QLBookMarkVC alloc]init];
        _bookMarkVC.readModel = _RBmodel;
        _bookMarkVC.delegate = self;
    }
    return _bookMarkVC;
}


#pragma mark - QLMenuDelegate

//-(void)menuViewJumpChapter:(NSUInteger)chapter page:(NSUInteger)page
//{
//    if ([self.delegate respondsToSelector:@selector(menuViewJumpChapter:page:)]) {
//        [self.delegate menuViewJumpChapter:chapter page:page];
//    }
//}
//
//-(void)menuViewFontSize:(QLBottomMenuView *)bottomMenu
//{
//    if ([self.delegate respondsToSelector:@selector(menuViewFontSize:)]) {
//        [self.delegate menuViewFontSize:bottomMenu];
//    }
//}

-(void)menuViewInvokeCatalog:(QLBottomMenuView *)bottomMenu
{
//    if ([self.delegate respondsToSelector:@selector(menuViewInvokeCatalog:)]) {
//        [self.delegate menuViewInvokeCatalog:bottomMenu];
//    }
//    [_tapMenuView hiddenMenuView];
    // 2
//    _tapMenuView.hidden = YES;
//    [self catalogShowState:YES];
    
    // 3
    [self presentViewController:self.menuCatalogVC animated:YES completion:nil];
}

-(void)menuVCpresentToMarkVC
{

    [self presentViewController:self.bookMarkVC animated:YES completion:nil];
}


-(void)menuVCdismiss
{
    [self dismissViewControllerAnimated:NO completion:nil];
}


#pragma mark - Private Method

//-(void)hiddenCatalog
//{
//    [self catalogShowState:NO];
//}


//-(void)catalogShowState:(BOOL)show
//{
//    show?({
//        _catalogView.hidden = !show;
//        [UIView animateWithDuration:AnimationDelay animations:^{
//            _catalogView.frame = CGRectMake(0, 0,2*ViewFrameSize(self.view).width, ViewFrameSize(self.view).height);
//
//        } completion:^(BOOL finished) {
//            // 加一个截屏（已自定义模糊化效果）的UIView
////            [_catalogView insertSubview:[[UIImageView alloc] initWithImage:[self EffectBlurredSnapshot]] atIndex:0];
//        }];
//    }):({
//        if ([_catalogView.subviews.firstObject isKindOfClass:[UIImageView class]]) {
//            [_catalogView.subviews.firstObject removeFromSuperview];
//        }
//        [UIView animateWithDuration:AnimationDelay animations:^{
//            _catalogView.frame = CGRectMake(-ViewFrameSize(self.view).width, 0, 2*ViewFrameSize(self.view).width, ViewFrameSize(self.view).height);
//        } completion:^(BOOL finished) {
//            _catalogView.hidden = !show;
//
////            [self dismissViewControllerAnimated:NO completion:nil];
//
//        }];
//    });
//}

//- (UIImage *)EffectBlurredSnapshot {
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)), NO, 1.0f);
//    // 渲染一个完整的当前图层快照  （截屏作用）
//    [self.view drawViewHierarchyInRect:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) afterScreenUpdates:NO];
//    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIImage *blurredSnapshotImage = [snapshotImage applyLightEffect];
//    UIGraphicsEndImageContext();
//    return blurredSnapshotImage;
//}





#pragma mark - QLMenuChapterVCDelegate Delegate

-(void)catalogDidSelectChapter:(NSUInteger)chapter page:(NSUInteger)page
{
//    if ([self.delegate respondsToSelector:@selector(menuViewInvokeCatalog:)]) {
//        [self.delegate menuViewInvokeCatalog:bottomMenu];
//    }
    if ([self.catalogDelegate respondsToSelector:@selector(catalogDidSelectChapter:page:)])
    {
//        [self hiddenCatalog];
        [self.catalogDelegate catalogDidSelectChapter:chapter page:page];
        // 2
//        [self menuVCdismiss];
    }
}



#pragma mark -  UIGestureRecognizer Delegate
//解决ChapterTableView与Tap手势冲突
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return  YES;
}



- (void)viewDidLayoutSubviews
{
    _menuCatalogVC.view.frame = CGRectMake(0, 0, ViewFrameSize(self.view).width-130, ViewFrameSize(self.view).height);
    [_menuCatalogVC reload];
}

@end
