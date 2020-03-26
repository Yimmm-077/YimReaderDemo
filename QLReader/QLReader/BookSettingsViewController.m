//
//  BookSettingsViewController.m
//  QLReader
//
//  Created by Yimmm on 2020/3/24.
//  Copyright © 2020 Yimmm. All rights reserved.
//

#import "BookSettingsViewController.h"
#import "BookSettingsView.h"

@interface BookSettingsViewController ()
@property (nonatomic, strong) BookSettingsView * bookSetView;

@end

@implementation BookSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bookSetView];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;

    // Do any additional setup after loading the view.
}


- (BookSettingsView *)bookSetView
{
    if(!_bookSetView)
    {
        _bookSetView = [[BookSettingsView alloc]initWithFrame:self.view.bounds];
    }
    return _bookSetView;
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
