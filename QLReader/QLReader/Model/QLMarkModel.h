//
//  QLMarkModel.h
//  QLReader
//
//  Created by Yimmm on 2020/3/26.
//  Copyright © 2020 Yimmm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QLMarkModel : NSObject<NSCoding>
@property (nonatomic,strong) NSDate *date;
@property (nonatomic,strong) QLReadRecordModel * recordModel;
@end

NS_ASSUME_NONNULL_END
