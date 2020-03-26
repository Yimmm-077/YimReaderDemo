//
//  QLBookMarkVC.h
//  QLReader
//
//  Created by Yimmm on 2020/3/26.
//  Copyright © 2020 Yimmm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMenuCataLogViewController.h"
NS_ASSUME_NONNULL_BEGIN
@protocol QLMenuChapterVCDelegate;

@interface QLBookMarkVC : UIViewController
@property (nonatomic,strong) QLReadBookModel *readModel;
@property (nonatomic,weak) id<QLMenuChapterVCDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
