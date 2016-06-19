//
//  BSAlertView.h
//  LoveCook
//
//  Created by hjpraul on 13-8-18.
//  Copyright (c) 2013年 lovecook. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AlertViewPresentationStyle){
	AlertViewPresentationStyleNone,
	AlertViewPresentationStylePop,
	AlertViewPresentationStyleFade,
	AlertViewPresentationStylePush,
};

typedef NS_ENUM(NSInteger, AlertViewDismissalStyle){
	AlertViewDismissalStyleNone,
	AlertViewDismissalStyleZoomIn,
	AlertViewDismissalStyleZoomOut,
	AlertViewDismissalStyleFade,
	AlertViewDismissalStylePush,
};

typedef NS_ENUM(NSInteger, AlertViewEnterDirection){
	AlertViewEnterDirectionFromTop,
	AlertViewEnterDirectionFromRight,
	AlertViewEnterDirectionFromBottom,
	AlertViewEnterDirectionFromLeft,
};

typedef NS_ENUM(NSInteger, AlertViewExitDirection){
	AlertViewExitDirectionToTop,
	AlertViewExitDirectionToRight,
	AlertViewExitDirectionToBottom,
	AlertViewExitDirectionToLeft,
};

typedef NS_ENUM(NSInteger, AlertViewPosition){
    AlertViewPositionTop,
    AlertViewPositionRight,
    AlertViewPositionBottom,
    AlertViewPositionLeft,
    AlertViewPositionCenter,
};

@interface BSAlertView : UIView
@property(nonatomic, assign) BOOL enableClickBGToDismiss;
@property(nonatomic, assign) AlertViewPresentationStyle presentationStyle;
@property(nonatomic, assign) AlertViewDismissalStyle dismissalStyle;
// 仅当presentationStyle为AlertViewPresentationStylePush时需要设置
@property(nonatomic, assign) AlertViewEnterDirection enterDirection;
// 仅当dismissalStyle为AlertViewDismissalStylePush时需要设置
@property(nonatomic, assign) AlertViewExitDirection exitDirection;
@property(nonatomic, assign) AlertViewPosition position;
@property(nonatomic, copy) void (^dismissBlock)(void);

@property (nonatomic, retain) UIWindow *previousWindow;

- (void)show;
- (void)showWithStyle:(AlertViewPresentationStyle)presentationStyle;

- (void)dismiss;
- (void)dismissWithStyle:(AlertViewDismissalStyle)dismissalStyle;
@end
