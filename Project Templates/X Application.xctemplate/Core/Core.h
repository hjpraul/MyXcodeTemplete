//
//  Core.h
//  LianghuaJifen
//
//  Created by hjpraul on 16/4/29.
//  Copyright © 2016年 hjpraul. All rights reserved.
//

#ifndef Core_h
#define Core_h

#import "Util.h"
// Http
#import "NSError+HTTP.h"
#import "NSObject+HTTP.h"
#import "NSString+HTTP.h"
#import "NSMutableDictionary+HTTP.h"

// Category
#import "NSDate+Component.h"
#import "NSDate+Format.h"
#import "NSObject+JSON.h"
#import "NSNull+Safe.h"
#import "NSString+Format.h"
#import "NSString+Verify.h"
#import "NSString+Coder.h"
#import "NSArray+Filter.h"
#import "UIImage+Create.h"
#import "UIImage+Edit.h"
#import "UIView+Blank.h"
#import "UIView+Edit.h"
#import "UIView+Positioning.h"
#import "UIView+Size.h"
#import "NSObject+JSON.h"

// loading && toast
#import "UIView+Loading.h"
#import "NSString+Toast.h"

// common widget
#import "CommonLine.h"

// Other
#import "DBManager.h"
#import "WQRefreshTableView.h"
#import "WQRefreshCollectionView.h"


#undef	RGB
#define RGB(R,G,B)          [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]
#undef	RGBA
#define RGBA(R,G,B,A)       [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]
#endif /* Core_h */
