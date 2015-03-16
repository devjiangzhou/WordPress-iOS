#import "WPUITestCase.h"
#import <Foundation/Foundation.h>
#import "WordPressTestCredentials.h"

@implementation WPUITestCase

- (void) login
{
    [tester clearTextFromAndThenEnterText:oneStepUser intoViewWithAccessibilityIdentifier:@"Username / Email"];
    [tester clearTextFromAndThenEnterText:oneStepPassword intoViewWithAccessibilityIdentifier:@"Password"];
    [tester tapViewWithAccessibilityLabel:@"Sign In"];
    
    [tester waitForTimeInterval:3];
    
    if ([tester tryFindingViewWithAccessibilityLabel:@"new-editor-modal-dismiss-button" error:nil]) {
        [tester tapViewWithAccessibilityLabel:@"new-editor-modal-dismiss-button"];
    }
}

- (void) loginOther
{
    [tester clearTextFromAndThenEnterText:twoStepUser intoViewWithAccessibilityIdentifier:@"Username / Email"];
    [tester clearTextFromAndThenEnterText:twoStepPassword intoViewWithAccessibilityIdentifier:@"Password"];
    [tester tapViewWithAccessibilityLabel:@"Sign In"];
    
    [tester waitForTimeInterval:3];
    if ([tester tryFindingViewWithAccessibilityLabel:@"new-editor-modal-dismiss-button" error:nil]) {
        [tester tapViewWithAccessibilityLabel:@"new-editor-modal-dismiss-button"];
    }

}

- (void) logout
{
    if ([tester tryFindingViewWithAccessibilityLabel:@"new-editor-modal-dismiss-button" error:nil]) {
        [tester tapViewWithAccessibilityLabel:@"new-editor-modal-dismiss-button"];
    }
    [tester tapViewWithAccessibilityLabel:@"Me"];
    [tester waitForTimeInterval:1];
    [tester tapViewWithAccessibilityLabel:@"Disconnect from WordPress.com"];
    [tester waitForTimeInterval:1];
    [tester tapViewWithAccessibilityLabel:@"Sign Out"];
    [tester waitForTimeInterval:1];
}

- (void) logoutIfNeeded {
    if(![tester tryFindingViewWithAccessibilityIdentifier:@"Username / Email" error:nil]){
        [self logout];
    }
}


@end