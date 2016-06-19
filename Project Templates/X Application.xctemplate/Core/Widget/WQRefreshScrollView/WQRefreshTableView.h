//
//  WQRefreshTableView.h
//  DNF
//
//  Created by Jayla on 16/2/3.
//  Copyright © 2016年 anzogame. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WQRefreshTableViewDelegate;

@interface WQRefreshTableView : UITableView
@property (weak, nonatomic) IBOutlet id<WQRefreshTableViewDelegate> refreshDelegate;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (assign, nonatomic) NSUInteger pageSize;
@property (assign, nonatomic) NSUInteger pageIndex;

@property (assign, nonatomic) BOOL allowShowBlank;
@property (strong, nonatomic) UIImage *blankImage;
@property (strong, nonatomic) NSString *blankTitle;
@property (strong, nonatomic) NSString *blankMessage;

- (void)refreshData;
@end

@protocol WQRefreshTableViewDelegate <NSObject>
@optional
- (void)tableView:(WQRefreshTableView *)tableView
         pageSize:(NSUInteger)pageSize
        pageIndex:(NSUInteger)pageIndex
          success:(void (^)(NSArray *list))success
          failure:(void (^)(NSError *error))failure;

@end