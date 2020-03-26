//
//  cuiteFeedbackVC.m
//  cutieRescue
//
//  Created by blaceman on 2020/3/3.
//  Copyright © 2020 new4545. All rights reserved.
//

#import "klotFeedVC.h"
#import "ReaderHomeViewController.h"
#import "PersonalCenterPageViewController.h"
@interface klotFeedVC ()
@property (nonatomic,strong)UIButton * feedbackBtn;

@property (nonatomic,strong)UIButton * OneClick_login;

@property (nonatomic,strong)UITextField * emailBackTextField;
@property (nonatomic,strong)UITextField * feedBackTextField;
@property (nonatomic,strong)PersonalCenterPageViewController * PersonalCenterPageVC;


@end

@implementation klotFeedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setfeedBackView];
}

- (void)setfeedBackView{
    UIImageView *cuiteimageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"HomePage.jpg"]];
    [self.view addSubview:cuiteimageView];
    cuiteimageView.frame = self.view.bounds;
//    [cuiteimageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.offset(0);
//    }];
    
    UILabel *emailLabel = [UILabel new];
    emailLabel.text = @"用户名：";
    emailLabel.textColor = [UIColor whiteColor];
    emailLabel.font = [UIFont systemFontOfSize:22];
    [self.view addSubview:emailLabel];
    emailLabel.frame = CGRectMake(32, 140, 100, 40);
//    [emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(140);
//        make.left.offset(32);
//    }];
    
    self.emailBackTextField = [[UITextField alloc]init];
    _emailBackTextField.placeholder = @"请输入你的用户名";
//     [_emailBackTextField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    _emailBackTextField.textColor = [UIColor whiteColor];
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 16, 16)];
    leftView.backgroundColor = [UIColor clearColor];
    _emailBackTextField.leftView = leftView;
    _emailBackTextField.leftViewMode = UITextFieldViewModeAlways;

    [self.view addSubview:_emailBackTextField];
    _emailBackTextField.font = [UIFont systemFontOfSize:18];
    
    _emailBackTextField.frame = CGRectMake(32, DistanceFromTopView(emailLabel) + 12, ViewFrameSize(self.view).width - 80 - 32, 40);
    
//    [_emailBackTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(emailLabel.mas_bottom).offset(12);
//        make.left.equalTo(emailLabel);
//        make.right.offset(-80);
//        make.height.mas_equalTo(40);
//    }];
    
    
    
    _emailBackTextField.layer.cornerRadius = 5.f;
    _emailBackTextField.layer.borderWidth = 1;
    _emailBackTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _emailBackTextField.layer.masksToBounds = YES;
    _emailBackTextField.tag = 10;

    
    UILabel *feedLabel = [UILabel new];
    feedLabel.text = @"密码：";
    feedLabel.textColor = [UIColor whiteColor];
    feedLabel.font = [UIFont systemFontOfSize:22];
    [self.view addSubview:feedLabel];
    feedLabel.frame = CGRectMake(32, DistanceFromTopView(_emailBackTextField) + 48, 80, 40);
    
//    [feedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(_emailBackTextField.mas_bottom).offset(48);
//        make.left.equalTo(_emailBackTextField);
//    }];
    
    self.feedBackTextField = [[UITextField alloc]init];
    _feedBackTextField.textColor = [UIColor whiteColor];
    _feedBackTextField.placeholder = @"请输入你的密码";
    _feedBackTextField.tag = 12;
    UIView *leftView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 16, 16)];
    leftView2.backgroundColor = [UIColor clearColor];
    _feedBackTextField.leftView = leftView2;
    _feedBackTextField.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_feedBackTextField];
    
    _feedBackTextField.frame = CGRectMake(32, DistanceFromTopView(feedLabel) + 12, ViewFrameSize(self.view).width - 80 - 32, 40);
    
//    [_feedBackTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(feedLabel.mas_bottom).offset(12);
//        make.left.equalTo(emailLabel);
//        make.right.offset(-80);
//        make.height.mas_equalTo(40);
//    }];
    _feedBackTextField.font = [UIFont systemFontOfSize:18];
    _feedBackTextField.layer.cornerRadius = 5.f;
    _feedBackTextField.layer.borderWidth = 1;
    _feedBackTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    _feedBackTextField.layer.masksToBounds = YES;
    
    
    self.feedbackBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.view addSubview:self.feedbackBtn];
    
    
    // 按钮
    [self.feedbackBtn setBackgroundImage:[UIImage imageNamed:@"按钮.png"] forState:(UIControlStateNormal)];
    self.feedbackBtn.frame = CGRectMake(ViewFrameSize(self.view).width/2 - 80, DistanceFromTopView(_feedBackTextField) + 80, 160, 72);
//    [self.feedbackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.offset(0);
//        make.top.equalTo(_feedBackTextField.mas_bottom).offset(66);
//        make.width.mas_equalTo(160);
//        make.height.mas_equalTo(72);
//    }];
    [self.feedbackBtn addTarget:self action:@selector(feedbackAction:) forControlEvents:(UIControlEventTouchUpInside)];
//    [self.feedbackBtn setTitle:@"feedback" forState:(UIControlStateNormal)];
//    [self.feedbackBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
//    self.feedbackBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    UILabel *feedbackLabel = [UILabel new];
    feedbackLabel.text = @"登陆";
    feedbackLabel.textColor = [UIColor whiteColor];
    feedbackLabel.font = [UIFont systemFontOfSize:20];
    [self.feedbackBtn addSubview:feedbackLabel];
    feedbackLabel.textAlignment = NSTextAlignmentCenter;
    feedbackLabel.frame = self.feedbackBtn.bounds;
    
//    [feedbackLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.offset(0);
//        make.centerY.offset(0);
//    }];
    
    // 返回
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self.view addSubview:btn];
//    btn.frame = CGRectMake(20, 30, 32, 32);
//    [btn setImage:[UIImage imageNamed:@"klotResource/back.png"] forState:(UIControlStateNormal)];
//    [btn addTarget:self action:@selector(feedBackDissAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.OneClick_login = [QLReadParser ReadButtonToTarget:self action:@selector(oneLogin)];
    
    NSMutableAttributedString* tncString = [[NSMutableAttributedString alloc] initWithString:@"一键登录"];
    [tncString addAttribute:NSUnderlineStyleAttributeName
                      value:@(NSUnderlineStyleSingle)
                      range:(NSRange){0,[tncString length]}];
    [tncString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor]  range:NSMakeRange(0,[tncString length])];
    [tncString addAttribute:NSUnderlineColorAttributeName value:[UIColor redColor] range:(NSRange){0,[tncString length]}];

    [_OneClick_login setAttributedTitle:tncString forState:UIControlStateNormal];
    _OneClick_login.alpha = 0.8;
    _OneClick_login.titleLabel.font = [UIFont systemFontOfSize:18];
//    [_OneClick_login setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _OneClick_login.frame = CGRectMake(ViewFrameSize(self.view).width - 160, DistanceFromTopView(_feedBackTextField) + 10, 100, 40);
    
    [self.view addSubview:_OneClick_login];
    
    
}



- (PersonalCenterPageViewController *)PersonalCenterPageVC
{
    if (!_PersonalCenterPageVC)
    {
        //    //工作
        _PersonalCenterPageVC = [[PersonalCenterPageViewController alloc]init];
        //    UINavigationController *PersonalCenterPageVCNav = [[UINavigationController alloc] initWithRootViewController:PersonalCenterPageVC];
        //    PersonalCenterPageVCNav.navigationBar.translucent = NO;
        UITabBarItem * PerSonCenItem = [[UITabBarItem alloc] initWithTitle:@"个人中心" image:[[UIImage imageNamed:@"PersonalCenterIcon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"PersonalCenterIcon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        //    UITabBarItem * PerSonCenItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMore tag:1];
        //    PerSonCenItem.title = @"个人中心";
        _PersonalCenterPageVC.tabBarItem = PerSonCenItem;
        
        
    }
    

    return _PersonalCenterPageVC;
}


#pragma mark - Private Method

- (void)oneLogin
{

    self.emailBackTextField.text = [QLReadParser getRandomString];
    self.feedBackTextField.text = [QLReadParser getRandomString];

    [self feedBackAction];
}


- (void)feedbackAction:(UIButton *)sender{
    [self feedBackAction];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     [self.view endEditing:YES];
}

- (void)feedBackAction{
    

    
    
    UILabel *tipLabel = [UILabel new];
    tipLabel.textColor = [UIColor blackColor];
    tipLabel.backgroundColor = [UIColor whiteColor];
    UITextField *emailField = [self.view viewWithTag:10];
    UITextField *feedField = [self.view viewWithTag:12];
    if (emailField.text.length > 0 && feedField.text.length > 0) {
        tipLabel.text = @"登录成功！";
    }else{
        tipLabel.text = @"账号名或密码不能为空！";
    }
    tipLabel.textAlignment = NSTextAlignmentCenter;

    [self.view addSubview:tipLabel];
    tipLabel.frame = CGRectMake(ViewFrameSize(self.view).width/2 - 150, ViewFrameSize(self.view).height/2 - 20, 300, 40);
//    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.offset(0);
//    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (emailField.text.length > 0 && feedField.text.length > 0) {
            [self loginReadBook];

        }else{
            [tipLabel removeFromSuperview];
        }
    });
}



- (void)loginReadBook
{
    //1.创建Tab所属的ViewController
    // 看书首页
    ReaderHomeViewController *homeVC = [[ReaderHomeViewController alloc] init];

    
    UITabBarItem * homeTabItem = [[UITabBarItem alloc] initWithTitle:@"看书" image:[[UIImage imageNamed:@"ReadingIcon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"ReadingIcon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];

//    UITabBarItem* homeTabItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0];
//    homeTabItem.title = @"看书";
    homeVC.tabBarItem = homeTabItem;
    //    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    //    homeNav.navigationBar.translucent = NO;
    
    

    
    
    //    //工作
    BookSettingsViewController * bookSettingVC = [[BookSettingsViewController alloc]init];
    UITabBarItem * bookSettingVCItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:[[UIImage imageNamed:@"SettingsIcon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"SettingsIcon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    bookSettingVC.tabBarItem = bookSettingVCItem;
    
    
    //2、创建一个数组，放置多有控制器
    NSArray *vcArray = [NSArray arrayWithObjects:homeVC,bookSettingVC,self.PersonalCenterPageVC, nil];
    
    [_PersonalCenterPageVC.myPersonPage.UserName setTitle:self.emailBackTextField.text forState:UIControlStateNormal];

    
    //3、创建UITabBarController，将控制器数组设置给UITabBarController
    UITabBarController *tabBarVC = [[UITabBarController alloc]init];
    //设置多个Tab的ViewController到TabBarViewController
    tabBarVC.viewControllers = vcArray;
    //4、将UITabBarController设置为Window的RootViewController
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVC;
    [[tabBarVC tabBar]setTranslucent:NO];

}



- (void)feedBackDissAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
