//
//  UIView+Blank.h
//  DNF
//
//  Created by Jayla on 16/2/23.
//  Copyright © 2016年 anzogame. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    BlankType_LoadFailure,
    BlankType_NoAttention,
    BlankType_Collect,
    BlankType_Comment,
    BlankType_Topic,
}BlankType;

@interface UIView (Blank)

- (void)showBlankWithImage:(UIImage *)image
                     title:(NSString *)title
                   message:(NSString *)message
                    action:(void (^)(void))action;

- (void)showBlankWithType:(BlankType)type
                    title:(NSString *)title
                  message:(NSString *)message
                   action:(void (^)(void))action;

- (void)dismissBlank;

@end
