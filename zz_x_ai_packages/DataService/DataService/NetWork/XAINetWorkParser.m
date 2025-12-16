//
//  XAINetWorkParser.m
//  DataService
//
//  Created by zz on 2025/12/8.
//

#import "XAINetWorkParser.h"
#import <YYModel/YYModel.h>
@implementation XAINetWorkParser

- (void)parse:(id)response resultClass:(Class)resultClass resultKey:(NSString *)resultKey success:(XAINetWorkSuccessHandler)successHandler failure:(XAINetWorkFailureHandler)failureHandler {
    NSDictionary *responseDic = response;
    NSDictionary *responseStatus = responseDic[@"response_status"];
    id responseData = responseDic[@"response_data"];
    NSNumber *status = responseStatus[@"status"];
    NSString *msg = responseStatus[@"msg"];
    if (status.intValue != 0) {
        XAINetWorkError *error = [XAINetWorkError new];
        error.type = TDNetWorkErrorTypeResponseError;
        error.code = status.intValue;
        error.msg = msg;
        failureHandler(error);
    }else{
        if ([responseData isKindOfClass:[NSDictionary class]]) {
            NSDictionary *responseDic = responseData;
            XAINetWorkResponse *response = [XAINetWorkResponse new];
            id result = resultKey.length > 0 ? responseDic[resultKey] : responseDic;
            if (resultClass != Nil) {
                if ([result isKindOfClass:[NSDictionary class]]) {
                    response.result = [resultClass yy_modelWithDictionary:result];
                } else if ([result isKindOfClass:[NSArray class]]){
                    response.result = [NSArray yy_modelArrayWithClass:resultClass json:result];
                }else{
                    response.result = result;
                }
            }else{
                response.result = result;
            }
            successHandler(response);
        
        }else if ([responseData isKindOfClass:[NSArray class]]) {
            NSArray *responseArray = responseData;
            XAINetWorkResponse *response = [XAINetWorkResponse new];
            if (resultClass != Nil) {
                response.result = [NSArray yy_modelArrayWithClass:resultClass json:responseArray];
            }else{
                response.result = responseArray;
            }
            successHandler(response);
        
        }else {
            XAINetWorkResponse *response = [XAINetWorkResponse new];
            response.result = responseData;
            successHandler(response);
        }
    }
}

@end
