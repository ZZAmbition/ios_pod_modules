//
//  XAINetWorkResponse.h
//  DataService
//
//  Created by zz on 2025/12/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//服务器自定义响应码
typedef NS_ENUM(NSUInteger, XAINetWorkResponseCode) {
    //预留
    XAINetWorkResponseStateXX = 0
};


@interface XAINetWorkResponse : NSObject

//http code
@property(nonatomic,assign)NSInteger stateCode;
//服务器code
@property(nonatomic,assign)XAINetWorkResponseCode code;
//服务器消息
@property(nonatomic,strong)NSString* msg;

@property(nonatomic,strong)id result;



@end

NS_ASSUME_NONNULL_END
