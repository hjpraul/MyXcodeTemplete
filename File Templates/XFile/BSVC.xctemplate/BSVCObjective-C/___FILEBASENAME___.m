//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()
@end

@implementation ___FILEBASENAMEASIDENTIFIER___


#pragma mark - View Controller LifeCyle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([segue.identifier isEqualToString:@"xxx"]) {
//        XXXVC *vc = segue.destinationViewController;
//        vc.account = _account.text;
//    }
}


#pragma mark - Override

#pragma mark - Initial && Refresh
- (void)initView {
    // FIXME:
}

- (void)refreshView {
    // FIXME:
}
#pragma mark - Privat Methods

#pragma mark - Public Methods

#pragma mark - KVO && Notification

#pragma mark - Check input
- (BOOL) checkInput {
    // FIXME:
    return YES;
}

#pragma mark - Action Methods

@end
