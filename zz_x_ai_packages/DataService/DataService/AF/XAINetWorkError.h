//
//  XAINetWorkError.h
//  DataService
//
//  Created by zz on 2025/12/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, XAINetWorkErrorCode) {
    //预留
    TDNetWorkErrorCodeXX = 0
};

@interface XAINetWorkError : NSObject

//错误码
@property(nonatomic,assign)XAINetWorkErrorCode code;
//错误信息
@property(nonatomic,assign)NSString* msg;

@end

NS_ASSUME_NONNULL_END
