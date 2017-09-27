//
//  ViewController.m
//  JDAnySDKDemo
//
//  Created by 熙文 张 on 2017/01/11.
//  Copyright © 2017年 熙文 张. All rights reserved.
//

#import "ViewController.h"
#import <JDAnySDK/JDAnySDK.h>

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    UIImage *buttonImage = [UIImage imageNamed:@"JD_SDK_Button"];
    
    UIButton *loginButton = [UIButton new];
    [loginButton setFrame:CGRectMake(40, 140, 100, 40)];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    UIButton *payButton = [UIButton new];
    [payButton setFrame:CGRectMake(40, 200, 100, 40)];
    [payButton setTitle:@"支付一块" forState:UIControlStateNormal];
    [payButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [payButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [payButton addTarget:self action:@selector(payButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payButton];
    
    
    UIButton *logoutButton = [UIButton new];
    [logoutButton setFrame:CGRectMake(200, 140, 100, 40)];
    [logoutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [logoutButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [logoutButton setTitle:@"注销" forState:UIControlStateNormal];
    [logoutButton addTarget:self action:@selector(logoutButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoutButton];
    
    UIButton *centerButton = [UIButton new];
    [centerButton setFrame:CGRectMake(200, 200, 100, 40)];
    [centerButton setTitle:@"用户中心" forState:UIControlStateNormal];
    [centerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [centerButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [centerButton addTarget:self action:@selector(centerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:centerButton];
    
    [[JDAnySDK sharedInstance] setJdLogoutBlock:^{
        NSLog(@"注销回调");

    }];
    
}

- (void)loginButtonClick
{
    [[JDAnySDK sharedInstance] jdLogin:self.view complete:^(JDAnySDKUserModel *userModel) {
        NSLog(@"%@",[userModel description]);
        
        //创建角色调用一次
        [[JDAnySDK sharedInstance] jdCreateRole:@"小布丁"];
        
        //登录成功， 上报角色信息
        JDRoleModel *role = [JDRoleModel new];
        role.roleName = @"小布丁";
        role.roleLever = @"99";
        role.serverId = @"1";
        [[JDAnySDK sharedInstance] updateRoleInfo:role];
        
    }];
}


- (void)logoutButtonClick
{
    //注销游戏， 上报角色信息
    JDRoleModel *role = [JDRoleModel new];
    role.roleName = @"小布丁";
    role.roleLever = @"99";
    role.serverId = @"1";
    [[JDAnySDK sharedInstance] updateRoleInfo:role];
    
    //注销
    [[JDAnySDK sharedInstance] jdLogout];
}


- (void)centerButtonClick
{
    [[JDAnySDK sharedInstance] jdCenter];
}


- (void)payButtonClick
{
    JDPayParamsModel *payParamsModel = [JDPayParamsModel new];
    [payParamsModel setPrice:6];
    [payParamsModel setServerId:@"1"];
    [payParamsModel setServerName:@"蜀山传奇"];
    [payParamsModel setRoleId:@"1"];
    [payParamsModel setRoleName:@"GG20思密达"];
    [payParamsModel setOrderId:[self getOrderStringByTime]];
    [payParamsModel setProductId:@"com.rxft.600"];
    [payParamsModel setProductName:@"点券"];
    [payParamsModel setProductDesc:@"点卷可以用来买皮肤。你懂得"];
    [payParamsModel setExtension:@"Extension"];
    [[JDAnySDK sharedInstance] jdPay:payParamsModel complete:^(JDPayResultCode payResultCode) {
        if (payResultCode == JDPayResultCodeSucceed)
        {
            NSLog(@"支付成功");
        }
    }];
}



- (NSString *)getOrderStringByTime
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYYMMddhhmmssSS"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    NSString *orderId = [NSString stringWithFormat:@"hg_%@", dateString];
    NSLog(@"order:%@", orderId);
    return orderId;
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
//{
//
//    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight);
//}
//
//
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//
////    return UIInterfaceOrientationMaskLandscape;
//    return UIInterfaceOrientationMaskAll;
//}
//
//- (BOOL)shouldAutorotate
//{
//    return YES;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
