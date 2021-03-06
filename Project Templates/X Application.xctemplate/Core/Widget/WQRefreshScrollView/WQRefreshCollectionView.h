//
//  WQRefreshCollectionView.h
//  DNF
//
//  Created by Jayla on 16/2/19.
//  Copyright © 2016年 anzogame. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol WQRefreshCollectionViewDelegate;

@interface WQRefreshCollectionView : UICollectionView
@property (weak, nonatomic) IBOutlet id<WQRefreshCollectionViewDelegate> refreshDelegate;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (assign, nonatomic) NSUInteger pageSize;
@property (assign, nonatomic) NSUInteger pageIndex;

@property (assign, nonatomic) BOOL allowShowBlank;
@property (strong, nonatomic) UIImage *blankImage;
@property (strong, nonatomic) NSString *blankTitle;
@property (strong, nonatomic) NSString *blankMessage;

- (void)refreshData;
@end

@protocol WQRefreshCollectionViewDelegate <NSObject>
@optional
- (void)collectionView:(WQRefreshCollectionView *)collectionView
              pageSize:(NSUInteger)pageSize
             pageIndex:(NSUInteger)pageIndex
               success:(void (^)(NSArray *list))success
               failure:(void (^)(NSError *error))failure;

@end
