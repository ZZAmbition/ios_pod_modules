//
//  XAINetWorkError.h
//  DataService
//
//  Created by zz on 2025/12/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



typedef NS_ENUM(NSUInteger, TDNetWorkErrorType) {
    TDNetWorkErrorTypeUnknown = 0,
    TDNetWorkErrorTypeNetworkUnavailable = 1,     // 网络不可用
    TDNetWorkErrorTypeTimeout = 2,                // 请求超时
    TDNetWorkErrorTypeServerError = 3,            // 请求/服务器错误
    TDNetWorkErrorTypeResponseError = 4,          // 响应结果报错、根据服务器返回的错误码判断错误
    TDNetWorkErrorTypeParseFailed = 5             // 数据解析失败，空值
};
//服务器自定义错误码
typedef NS_ENUM(NSUInteger, XAINetWorkErrorCode) {
    //预留
    TDNetWorkErrorCodeXX = 0
};

@interface XAINetWorkError : NSObject

//错误类型
@property(nonatomic,assign)TDNetWorkErrorType type;
//http code
@property(nonatomic,assign)NSInteger stateCode;
//服务器code
@property(nonatomic,assign)XAINetWorkErrorCode code;
//错误信息
@property(nonatomic,strong)NSString* msg;

@property(nonatomic,strong)NSError *error;

@end

NS_ASSUME_NONNULL_END
