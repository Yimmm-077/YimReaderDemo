//
//  QLTapMenuViewController.h
//  QLReader
//
//  Created by Yimmm on 2020/3/23.
//  Copyright © 2020 Yimmm. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol QLMenuDelegate;
@protocol QLMenuChapterVCDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface QLTapMenuViewController : UIViewController

@property (nonatomic, strong) QLReadBookModel * RBmodel;

@property (nonatomic, weak) id<QLMenuDelegate>delegate;
@property (nonatomic,weak) id<QLMenuChapterVCDelegate>catalogDelegate;

@property (nonatomic,strong) QLtapMenuView * tapMenuView;
//菜单栏

@end

NS_ASSUME_NONNULL_END
