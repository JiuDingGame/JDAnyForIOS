# 互冠聚合SDK iOS客户端文档


[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/JiuDingGame/JDAnySDKForiOS/master/LICENSE)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%208%2B%20-blue.svg?style=fla)](https://www.apple.com/nl/ios/)&nbsp;


演示项目
==============
查看并运行 `JDAnySDKDemo/JDAnySDKDemo.xcodeproj`



使用
==============

1. 获取sdk。<br/>
<img src="https://raw.githubusercontent.com/JiuDingGame/JDAnySDKForiOS/master/Snapshots/path.png"><br/>
2. SDK添加(拖放)到你的工程目录中。<br/>
<img src="https://raw.githubusercontent.com/JiuDingGame/JDAnySDKForiOS/master/Snapshots/ProductPath.png"><br/>
3. 在对应项目Targets下找到General，在Embedded Binaries链接 frameworks:<br/>
<img src="https://raw.githubusercontent.com/JiuDingGame/JDAnySDKForiOS/master/Snapshots/JDEmbeddedBinaries.png"><br/>
4. 导入 `<JDAnySDK/JDAnySDK.h>`。<br/>
5. 初始化SDK。并更改对应的参数<br/>
6. 配置对应渠道SDK设置<br/>


初始化SDK
==============
##### 各渠道支持真机模拟器情况
渠道列表 | 支持真机 | 支持模拟器 | 未支持原因
------- | ------- | -------- | --------
玖鼎		|   支持  |   支持    |  


##### JDAnySDKParameters参数说明
<table>
	<thead>
		<tr>
			<th>参数名</th>
			<th>参数类型</th>
			<th>说明</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>appId</td>
			<td>NSString</td>
			<td>聚合SDK游戏标识</td>
		</tr>
		<tr>
			<td>appKey</td>
			<td>NSString</td>
			<td>聚合SDK游戏Key</td>
		</tr>
		<tr>
			<td>logData</td>
			<td>BOOL</td>
			<td>渠道SDK并集参数。是否打印日志</td>
		</tr>
		<tr>
			<td>debug</td>
			<td>BOOL</td>
			<td>渠道SDK并集参数。是否为测试模式</td>
		</tr>
		<tr>
			<td>jdPlatformType</td>
			<td>NS_ENUM</td>
			<td>设置当前编译链接渠道</td>
		</tr>
	</tbody>
</table>

##### JDSDK JDJdSDKInitModel参数说明
<table>
    <thead>
        <tr>
            <th>参数名</th>
            <th>参数类型</th>
            <th>说明</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>gameId</td>
            <td>NSString</td>
            <td>玖鼎SDK游戏标识</td>
        </tr>
        <tr>
            <td>secretKey</td>
            <td>NSString</td>
            <td>玖鼎SDK游戏密钥</td>
        </tr>
         <tr>
            <td>tdAppId</td>
            <td>NSString</td>
            <td>玖鼎tdAppId</td>
        </tr>
    </tbody>
</table>



```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.window makeKeyAndVisible];

	//设置聚合参数
    [[FDSDKParameters sharedHGSDKParameters] setAppId:@"63"];
    [[FDSDKParameters sharedHGSDKParameters] setAppKey:@"ea718a569bgtd828e5481acc695rr2abb"];
    [[FDSDKParameters sharedHGSDKParameters] setLogData:NO];
    [[FDSDKParameters sharedHGSDKParameters] setDebug:NO];
    
    //设置玖鼎参数
    JDJdSDKInitModel *jdSDKInitModel = [JDJdSDKInitModel new];
    [jdSDKInitModel setGameId:@"232"];
    [jdSDKInitModel setSecretKey:@"fgrgbb79fbe202792025c975d787"];
    [jdSDKInitModel setTdAppId:@"34A992413AB5BFE96DEF372B16"];
    [[JDAnySDKParameters sharedJDSDKParameters] setJdSDKInitModel:jdSDKInitModel];
    
    
    
    //设置当前编译链接渠道
    [[JDAnySDKParameters sharedJDSDKParameters] setJdPlatformType:JDJDPlatform];
    
     //初始化SDK
    [[JDAnySDK sharedInstance] jdInitWithSDKParameters:[JDAnySDKParameters sharedJDSDKParameters]];
    
    return YES;
}
```

屏幕方向处理
==============


```objective-c
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return [[JDAnySDK sharedInstance] supportedInterface];
}

```

登陆方法
==============
##### JDAnySDKUserModel参数说明
<table>
	<thead>
		<tr>
			<th>参数名</th>
			<th>参数类型</th>
			<th>说明</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>userId</th>
			<td>NSString</th>
			<td>聚合SDK用户标识（可能为空）</th>
		</tr>
		<tr>
			<td>token</th>
			<td>NSString</th>
			<td>聚合SDK用户登陆令牌</th>
		</tr>
		<tr>
			<td>sdkUserId</th>
			<td>NSString</th>
			<td>渠道SDK用户标识（可能为空）</th>
		</tr>
		<tr>
			<td>sdkUserName</th>
			<td>NSString</th>
			<td>渠道SDK用户名（可能为空）</th>
		</tr>
		<tr>
			<td>extension</th>
			<td>NSString</th>
			<td>拓展参数（可能为空）</th>
		</tr>
	</tbody>
</table>


```objective-c
- (void)loginButtonClick
{
    [[JDAnySDK sharedInstance] jdLogin:self.view complete:^(JDAnySDKUserModel *userModel) {
        
    }];
}
```

上报角色信息方法
==============

#### JDRoleModel参数说明
<table>
	<thead>
		<tr>
			<th>参数名</th>
			<th>参数类型</th>
			<th>说明</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>roleName</td>
			<td>NSString</td>
			<td>角色名称</td>
		</tr>
		<tr>
			<td>roleLever</td>
			<td> NSString </td>
			<td>角色等级</td>
		</tr>
		<tr>
			<td>serverId</td>
			<td>NSString</td>
			<td>区服id</td>
		</tr>
		</tbody>
</table>

> ### 注意 
该方法只需要在游戏登录之后和注销之前调用。<br/>

```objective-c
	JDRoleModel *role = [JDRoleModel new];
	role.roleName = @"角色名称";
	role.roleLever = @"角色等级";
	role.serverId = @"区服Id";
	[[JDAnySDK sharedInstance] updateRoleInfo:role];
```

上报角色名称
==============

> ### 注意 
该方法只需要在每次创建新角色的时候调用。

```objective-c
   [[JDAnySDK sharedInstance] jdCreateRole:@"小布丁"];

```


用户中心
==============
```objective-c
- (void)centerButtonClick
{
    [[JDAnySDK sharedInstance] jdCenter];
}
```



支付方法
==============

#### JDPayParamsModel参数说明
<table>
	<thead>
		<tr>
			<th>参数名</th>
			<th>参数类型</th>
			<th>说明</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>orderId</td>
			<td>NSString</td>
			<td>订单编号</td>
		</tr>
		<tr>
			<td>price</td>
			<td>int</td>
			<td>订单金额（大于等于1的整数）</td>
		</tr>
		<tr>
			<td>productId</td>
			<td>NSString</td>
			<td>商品标识</td>
		</tr>
		<tr>
			<td>productName</td>
			<td>NSString</td>
			<td>商品名称</td>
		</tr>
		<tr>
			<td>productDesc</td>
			<td>NSString</td>
			<td>商品描述</td>
		</tr>
		<tr>
			<td>roleId</td>
			<td>NSString</td>
			<td>角色标识</td>
		</tr>
		<tr>
			<td>roleName</td>
			<td>NSString</td>
			<td>角色名称</td>
		</tr>
		<tr>
			<td>serverId</td>
			<td>NSString</td>
			<td>区服标识</td>
		</tr>
		<tr>
			<td>serverName</td>
			<td>NSString</td>
			<td>区服名称</td>
		</tr>
		<tr>
			<td>extension</td>
			<td>NSString</td>
			<td>拓展参数(不能包含中文字符)</td>
		</tr>
	</tbody>
</table>

```objective-c
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


```


用户注销
==============
```objective-c
- (void)logoutButtonClick
{
    [[JDAnySDK sharedInstance] jdLogout];
}
```


用户注销回调方法
==============
```objective-c
[[JDAnySDK sharedInstance] setJdLogoutBlock:^{
    NSLog(@"注销回调");
}];
```



配置渠道SDK
==============
1、选择项目，新建Target。并且删除新建项目的所有模板文件。只保留项目的info.plist文件<br/>
2、选择新建的Target。选择Build Phases。引用公共项目的代码和资源
<img src="https://raw.githubusercontent.com/JiuDingGame/JDAnySDKForiOS/master/Snapshots/ProductSettings1.png"><br/>
<img src="https://raw.githubusercontent.com/JiuDingGame/JDAnySDKForiOS/master/Snapshots/ProductSettings2.png"><br/>
3、选择新建的Target。选择Build Settings 搜索Other Linker，在Other Linker Falgs加入-ObjC
<img src="https://raw.githubusercontent.com/JiuDingGame/JDAnySDKForiOS/master/Snapshots/ProductSettings3.png"><br/>

以上三部为公共配置。每新增一个渠道SDK都是如此。不同之处在后面列出来<br/>


##玖鼎SDK所需要配置
1、链接库如下</br>
1 .JDAnySDK.framework</br>
2. JDSDK.framework</br>
<img src="https://raw.githubusercontent.com/JiuDingGame/JDAnySDKForiOS/master/Snapshots/JdLibList.png"><br/>
其中也要加到Embed Framework
<img src="https://raw.githubusercontent.com/JiuDingGame/JDAnySDKForiOS/master/Snapshots/JdEmbedFramework.png"><br/>
2、资源文件如下</br>
1. JDSDK.xcassets</br>

<img src="https://raw.githubusercontent.com/JiuDingGame/JDAnySDKForiOS/master/Snapshots/JdCopyBundleResoureces.png"><br/>

3、info.plist配置
选择玖鼎项目下的info.plist右键选择Open As -> Source Code
在最下面添加如下代码


```objective-c
	<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSAllowsArbitraryLoads</key>
		<true/>
	</dict>
	<key>NSCameraUsageDescription</key>
	<string>需要使用相机</string>
	<key>NSPhotoLibraryUsageDescription</key>
	<string>需要使用相册</string>
```


<img src="https://raw.githubusercontent.com/JiuDingGame/JDAnySDKForiOS/master/Snapshots/JdInfoplist.png"><br/>

> ### 注意 
玖鼎SDK 支付订单时的productId字段需要与apple后台支付参数productId对应上。

在Build Phases下加入Run Script如下代码

```
APP_PATH="${TARGET_BUILD_DIR}/${WRAPPER_NAME}"

# This script loops through the frameworks embedded in the application and
# removes unused architectures.
find "$APP_PATH" -name '*.framework' -type d | while read -r FRAMEWORK
do
FRAMEWORK_EXECUTABLE_NAME=$(defaults read "$FRAMEWORK/Info.plist" CFBundleExecutable)
FRAMEWORK_EXECUTABLE_PATH="$FRAMEWORK/$FRAMEWORK_EXECUTABLE_NAME"
echo "Executable is $FRAMEWORK_EXECUTABLE_PATH"

EXTRACTED_ARCHS=()

for ARCH in $ARCHS
do
echo "Extracting $ARCH from $FRAMEWORK_EXECUTABLE_NAME"
lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
done

echo "Merging extracted architectures: ${ARCHS}"
lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"
rm "${EXTRACTED_ARCHS[@]}"

echo "Replacing original executable with thinned version"
rm "$FRAMEWORK_EXECUTABLE_PATH"
mv "$FRAMEWORK_EXECUTABLE_PATH-merged" "$FRAMEWORK_EXECUTABLE_PATH"

done
```


系统要求
==============
该项目最低支持 `iOS 8.0` 和 `Xcode 7.0`。


许可证
==============
JDSDK 使用 MIT 许可证，详情见 LICENSE 文件。
