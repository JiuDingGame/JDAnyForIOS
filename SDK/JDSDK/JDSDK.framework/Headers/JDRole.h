//
//  JDRole.h
//  JDSDK
//
//  Created by huguan-mac01 on 2017/9/26.
//  Copyright © 2017年 熙文 张. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDRole : NSObject
/**
 *  角色名称
 */
@property (nonatomic, strong) NSString *roleName;
/**
 *  角色等级
 */
@property (nonatomic, strong) NSString *roleLevel;
/**
 *  角色所在区服Id
 */
@property (nonatomic, strong) NSString *serverId;


@end
