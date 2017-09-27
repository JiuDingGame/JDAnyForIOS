//
//  JDRoleModel.h
//  JDAnySDK
//
//  Created by huguan-mac01 on 2017/9/26.
//  Copyright © 2017年 熙文 张. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDRoleModel : NSObject
/**
 *  角色名称
 */
@property (nonatomic, strong) NSString *roleName;
/**
 *  角色等级
 */
@property (nonatomic, strong) NSString *roleLever;
/**
 *  区服id
 */
@property (nonatomic, strong) NSString *serverId;
@end
