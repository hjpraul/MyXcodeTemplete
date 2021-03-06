//
//  WQRefreshTableView.m
//  DNF
//
//  Created by Jayla on 16/2/3.
//  Copyright © 2016年 anzogame. All rights reserved.
//

#import "WQRefreshTableView.h"
#import "UIView+Blank.h"

@interface WQRefreshTableView ()

@end

@implementation WQRefreshTableView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self awakeFromNib];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self awakeFromNib];
    }
    return self;
}

- (void)awakeFromNib {
    self.pageSize = 10;
    self.pageIndex = 0;
    self.allowShowBlank = YES;
    self.blankImage = [UIImage imageNamed:@"login_logo"];
    self.blankTitle = nil;
    self.blankMessage = @"无数据";
}

- (void)setRefreshDelegate:(id<WQRefreshTableViewDelegate>)refreshDelegate {
    _refreshDelegate = refreshDelegate;
    
    if ([self.refreshDelegate respondsToSelector:@selector(tableView:pageSize:pageIndex:success:failure:)]) {
        [self addRefreshHeader];
    }
}

/**********************************************************************/
#pragma mark - Private
/**********************************************************************/

- (void)addRefreshHeader {
    if (self.mj_header) {
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSUInteger pageIndex = 1;
        [self.refreshDelegate tableView:weakSelf pageSize:weakSelf.pageSize pageIndex:pageIndex success:^(NSArray *list) {
            weakSelf.pageIndex = pageIndex;
            [weakSelf.mj_header endRefreshing];
            weakSelf.dataArray = [list mutableCopy];
            [weakSelf reloadData];
            
            [weakSelf addRefreshFooter];
            if (list.count < weakSelf.pageSize) {
                [weakSelf.mj_footer endRefreshingWithNoMoreData];
            } else {
                [weakSelf.mj_footer endRefreshing];
            }
            
            if (weakSelf.allowShowBlank && weakSelf.dataArray.count==0) {
                weakSelf.mj_footer.hidden = YES;
                [weakSelf showBlankWithImage:weakSelf.blankImage title:weakSelf.blankTitle message:weakSelf.blankMessage action:nil];
            } else {
                weakSelf.mj_footer.hidden = NO;
                [weakSelf dismissBlank];
            }
        } failure:^(NSError *error) {
            [weakSelf.mj_header endRefreshing];
            
            NSString *message = error.localizedDescription?:weakSelf.blankMessage;
            if (weakSelf.allowShowBlank && weakSelf.dataArray.count==0) {
                weakSelf.mj_footer.hidden = YES;
                [weakSelf showBlankWithImage:weakSelf.blankImage title:weakSelf.blankTitle message:message action:nil];
            } else {
                weakSelf.mj_footer.hidden = NO;
                [weakSelf dismissBlank];
                [message toast];
            }
        }];
    }];
    self.mj_header = header;
}

- (void)addRefreshFooter {
    if (self.mj_footer) {
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        NSUInteger pageIndex = weakSelf.pageIndex + 1;
        [self.refreshDelegate tableView:weakSelf pageSize:weakSelf.pageSize pageIndex:pageIndex success:^(NSArray *list) {
            weakSelf.pageIndex = pageIndex;
            [weakSelf.mj_footer endRefreshing];
            [weakSelf.dataArray addObjectsFromArray:list];
            [weakSelf reloadData];
            
            if (list.count < weakSelf.pageSize) {
                [weakSelf.mj_footer endRefreshingWithNoMoreData];
            } else {
                [weakSelf.mj_footer endRefreshing];
            }
            
            if (weakSelf.allowShowBlank && weakSelf.dataArray.count==0) {
                weakSelf.mj_footer.hidden = YES;
                [weakSelf showBlankWithImage:weakSelf.blankImage title:weakSelf.blankTitle message:weakSelf.blankMessage action:nil];
            } else {
                weakSelf.mj_footer.hidden = NO;
                [weakSelf dismissBlank];
            }
        } failure:^(NSError *error) {
            [weakSelf.mj_footer endRefreshing];
            
            NSString *message = error.localizedDescription?:weakSelf.blankMessage;
            if (weakSelf.allowShowBlank && weakSelf.dataArray.count==0) {
                weakSelf.mj_footer.hidden = YES;
                [weakSelf showBlankWithImage:weakSelf.blankImage title:weakSelf.blankTitle message:message action:nil];
            } else {
                weakSelf.mj_footer.hidden = NO;
                [weakSelf dismissBlank];
                [message toast];
            }
        }];
    }];
    self.mj_footer = footer;
}

/**********************************************************************/
#pragma mark - Public
/**********************************************************************/

- (void)refreshData {
    [self.mj_header beginRefreshing];
}

@end
