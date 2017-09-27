//
//  JDAnySDK.h
//  JDAnySDK
//
//  Created by 熙文 张 on 2017/01/11.
//  Copyright © 2017年 熙文 张. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "JDAnySDKParameters.h"
#import "JDPayParamsModel.h"
#import "JDAnySDKInitModel.h"
#import "JDAnySDKUserModel.h"
#import "JDRoleModel.h"


//! Project version number for JDAnySDK.
FOUNDATION_EXPORT double JDAnySDKVersionNumber;

//! Project version string for JDAnySDK.
FOUNDATION_EXPORT const unsigned char JDAnySDKVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <JDAnySDK/PublicHeader.h>





typedef NS_ENUM(NSInteger, JDPayResultCode) {
    /**
     * 购买成功
     */
    JDPayResultCodeSucceed	= 0,
    /**
     * 购买失败
     */
    JDPayResultCodeFailed = 1,
    
    /**
     * 登录状态有问题
     */
    JDPayResultCodeFailedWithLogin = 2,
    /**
     * 订单不合法
     */
    JDPayResultCodeFailedWithOrderIllegal = 3,
    /**
     * 支付结果未知，需要去服务端查询
     */
    JDPayResultCodeUnknown	= 6
};


typedef void (^jdLoginSuccessBlock)(JDAnySDKUserModel *userModel);
typedef void (^jdLogoutBlock)();
typedef void (^jdPayBlock)(JDPayResultCode payResultCode);



@class JDPayParamsModel;

@interface JDAnySDK : NSObject
/**
 *  客服屏幕旋转
 */
@property (nonatomic, assign) NSUInteger supportedInterface;
/**
 *  登陆之后当前用户对象
 */
@property (nonatomic, strong) JDAnySDKUserModel   *jdCurrUserModel;
/**
 *  渠道编号
 */
@property (nonatomic, readonly) NSString *jdChannelId;

/**
 * SDK初始化参数对象
 */
@property (nonatomic, strong) JDAnySDKParameters *sdkParameters;

/**
 *  登陆成功回调
 */
@property (nonatomic, copy) jdLoginSuccessBlock jdLoginSuccessBlock;

/**
 *  注销回调
 */
@property (nonatomic, copy) jdLogoutBlock jdLogoutBlock;

/**
 *  支付回调
 */
@property (nonatomic, copy) jdPayBlock jdPayBlock;




/**
 *  返回一个静态单例对象
 *
 *  @return 单例对象
 */
+ (JDAnySDK *)sharedInstance;

/**
 *  初始化SDK
 *
 *  @param sdkParameters SDK参数对象
 */
- (void)jdInitWithSDKParameters:(JDAnySDKParameters *)sdkParameters;
/**
 *  创建新角色
 *
 *  @param name 角色名
 */
- (void)jdCreateRole:(NSString *)name;
/**
 *  第三方支付回调
 *
 *  @param app     UIApplication
 *  @param url     NSURL
 *  @param options options
 */
- (void)jdPayResult:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options;
/**
 *  分享
 *
 *  @param app  UIApplication
 *  @param url  应用URL
 *  @param options       分享回调
 */
- (void)jdShareResult:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options;
/**
 *  第三方支付回调
 *
 *  @param app     UIApplication
 *  @param url     NSURL
 *  @param sourceApplication sourceApplication
 */
- (void)jdPayResult:(UIApplication *)app openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication;


- (void)jdWillEnterForeground:(UIApplication *)application;

/**
 *  登陆
 *
 *  @param view     所添加的视图
 *  @param complete 登陆成功回调
 */
- (void)jdLogin:(UIView *)view
       complete:(jdLoginSuccessBlock)complete;

/**
 *  用户中心
 */
- (void)jdCenter;

/**
 *  注销
 */
- (void)jdLogout;

/**
 *  支付
 *
 *  @param payParamsModel 订单对象
 *  @param complete       支付回调
 */
- (void)jdPay:(JDPayParamsModel *)payParamsModel
        complete:(jdPayBlock)complete;
/**
 * 上报玩家信息 可以在玩家进入游戏时或退出游戏时上报玩家信息 请务必保证有一次调用
 *
 */
- (void)updateRoleInfo:(JDRoleModel *) roleModel;

@end
