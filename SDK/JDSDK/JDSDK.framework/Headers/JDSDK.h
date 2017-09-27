//
//  JDSDK.h
//  JDSDK
//
//  Created by 熙文 张 on 2016/11/07.
//  Copyright © 2016年 熙文 张. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "JDSDKParameters.h"
#import "JDOrderModel.h"
#import "JDUserModel.h"
#import "JDRole.h"


//! Project version number for JDSDK.
FOUNDATION_EXPORT double JDSDKVersionNumber;

//! Project version string for JDSDK.
FOUNDATION_EXPORT const unsigned char JDSDKVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <JDSDK/PublicHeader.h>


typedef enum {
    JDUserNotLogin                     = 10
}JDSDKErrorFailed;

@class JDSDKParameters;
@class JDUserModel;
@class JDOrderModel;


typedef void (^loginSuccessBlock)(JDUserModel *userModel);
typedef void (^logoutBlock)();

@interface JDSDK : NSObject

/**
 *  获取JDSDK单例
 *
 *  @return JDSDK单例对象
 */
+ (JDSDK *)sharedJDSDK;


@property (nonatomic, strong) NSString *currentToken;
@property (nonatomic, strong) NSString *currentUserName;
@property (nonatomic, strong) NSString *currentUserId;
@property (nonatomic, strong) NSString *currentChannelId;
@property (nonatomic, strong) NSString *currentUserPhone;
@property (nonatomic, strong) NSString *currentVirtualMoney;


@property (nonatomic, strong) NSString *currentService;

@property (nonatomic, copy, readonly) loginSuccessBlock loginSuccessBlock;

@property (nonatomic, copy) logoutBlock logoutBlock;

@property (nonatomic, assign) BOOL canShowController;
/**
 *  客服屏幕旋转
 */
@property (nonatomic, assign) NSUInteger supportedInterface;

/**
 *  初始化SDK
 *
 *  @param gameId    游戏编号
 *  @param key       游戏密钥
 *  @param cpid      合作商编号
 *  @param channelId 游戏渠道
 */
- (void)jdInitWithSDKParameters:(JDSDKParameters *)sdkParameters;


/**
 *   用户登陆
 *
 *  @param successBlock 登陆成功回调
 */
- (void)jdLogin:(loginSuccessBlock)successBlock;

/**
 *  游戏在创建角色的时候调用一次
 *
 *  @param name 角色名
 */
- (void)jdOnCreateRole:(NSString *)name;
- (void)jdReportRole:(JDRole *)role;
/**
 *  支付
 *
 *  @param orderInfo    订单信息
 */
- (void)payment:(JDOrderModel *)orderInfo;

/**
 *  注销用户登陆接口
 */
- (void)jdLogOut;


/**
 *  第三方应用跳转
 *
 *  @param url url
 *
 *  @return
 */
- (BOOL)handleOpenURL:(NSURL *)url;

+ (void)showFloatWindow;

+ (void)hiddenFloatWindow;

@end

