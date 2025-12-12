//
//  XAINetWorkResponse.h
//  DataService
//
//  Created by zz on 2025/12/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, XAINetWorkResponseState) {
    //预留
    XAINetWorkResponseStateXX = 0
};


@interface XAINetWorkResponse : NSObject

//状态码
@property(nonatomic,assign)XAINetWorkResponseState state;

@property(nonatomic,assign)NSString* msg;

@property(nonatomic,strong)id result;


@end

NS_ASSUME_NONNULL_END
