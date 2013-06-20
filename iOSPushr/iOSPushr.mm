//
//  iOSPushr.mm
//  iOSPushr
//
//  Created by Adam Bell on 2013-05-19.
//  Copyright (c) 2013 Adam Bell. All rights reserved.
//

// CaptainHook by Ryan Petrich
// see https://github.com/rpetrich/CaptainHook/

#import <Foundation/Foundation.h>
#import "CaptainHook/CaptainHook.h"
#import "GTLMirror.h"
#import "GTMOAuth2ViewControllerTouch.h"

#define CLIENT_ID @"ID"
#define CLIENT_SECRET @"SECRET"

#include <notify.h>

@class SBBulletinBannerView;

@interface SBBulletinBannerItem : NSObject
- (NSString *)title;
- (NSString *)message;
- (NSString *)_appName;
@end

@interface SBAwayBulletinListItem : NSObject
- (NSString *)title;
- (NSString *)message;
- (NSString *)subtitle;
@end

@interface SBBulletinBannerView : UIView
@end

@interface iOSPushr : NSObject
{
    
}
@property (nonatomic, strong) GTLServiceMirror *mirrorService;

@end

@implementation iOSPushr

+ (id)sharedInstance
{    
    __strong static id _sharedSelf = nil;
    
    static dispatch_once_t D = 0;

    dispatch_once(&p, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

- (void)presentGoogleSigninFromViewController:(UIViewController *)controller
{
    
    GTMOAuth2Authentication *auth = [GTMOAuth2ViewControllerTouch authForGoogleFromKeychainForName:@"Pushr-iOS-OAuth"
                                                                                          clientID:CLIENT_ID
                                                                                      clientSecret:CLIENT_SECRET];
    if (auth == nil)
    {
        
        GTMOAuth2ViewControllerTouch *vc = [[GTMOAuth2ViewControllerTouch alloc] initWithScope:@"https://www.googleapis.com/auth/glass.timeline"
                                                                                      clientID:CLIENT_ID
                                                                                  clientSecret:CLIENT_SECRET
                                                                              keychainItemName:@"Pushr-iOS-OAuth"
                                                                             completionHandler:^(GTMOAuth2ViewControllerTouch *viewController, GTMOAuth2Authentication *_auth, NSError *error) {
                                                                                 
                                                                                 self.mirrorService.authorizer = auth;
                                                                                 
                                                                                 [controller dismissViewControllerAnimated:YES completion:nil];
                                                                             }];
        
        [controller presentViewController:vc animated:YES completion:nil];
    }
    else
    {
        self.mirrorService.authorizer = auth;
    }
}

- (void)postNotificationFromApplication:(NSString *)application withMessage:(NSString *)message andBanner:(SBBulletinBannerItem *)view
{
    _mirrorService = [[GTLServiceMirror alloc] init];
    
    NSLog(@"POSTING NOTIFICATION");
    GTMOAuth2Authentication *auth = [GTMOAuth2ViewControllerTouch authForGoogleFromKeychainForName:@"Pushr-iOS-OAuth"
                                                                                          clientID:CLIENT_ID
                                                                                      clientSecret:CLIENT_SECRET];
    self.mirrorService.authorizer = auth;
    
    GTLMirrorTimelineItem *item = [[GTLMirrorTimelineItem alloc] init];
    item.title = application;
    item.html = [NSString stringWithFormat:@"<article><section><p class=\"blue\">%@:%@</h1><br><br><p>%@</p></section></article>", application, [view title] != nil ? [view title] : @"", message];
    item.bundleId = @"ca.adambell.iOSPushr";
    GTLMirrorNotificationConfig *notificationConfig = [[GTLMirrorNotificationConfig alloc] init];
    notificationConfig.level = @"DEFAULT";
    item.notification = notificationConfig;
    
    GTLMirrorMenuItem *deleteButton = [[GTLMirrorMenuItem alloc] init];
    deleteButton.action = @"DELETE";
    item.menuItems = @[deleteButton];
    
    
    GTLQueryMirror *post = [GTLQueryMirror queryForTimelineInsertWithObject:item
                                                           uploadParameters:nil];
    
    [self.mirrorService executeQuery:post
                   completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
                       NSLog(@"posted");
                       NSLog(@"ticket: %@", ticket);
                       NSLog(@"obj: %@", object);
                       NSLog(@"error: %@", error);
                       NSLog(@"%@", [(GTLMirrorTimelineItem *)object html]);
                   }];
}

@end


CHDeclareClass(SBBulletinBannerView); // declare class

CHDeclareClass(SBAwayBulletinListItem);

CHDeclareClass(SBBulletinBannerItem);

static NSString *old_message = nil;

CHOptimizedMethod2(self, SBAwayBulletinListItem *, SBAwayBulletinListItem, initWithBulletin, id, arg1, andObserver, id, arg2)
{
    id hax = CHSuper2(SBAwayBulletinListItem, initWithBulletin, arg1, andObserver, arg2);
    if ([[hax message] rangeOfString:@"Loading"].location == NSNotFound)
    {
        if (old_message == nil || ![[hax message] isEqualToString:old_message])
        {
            old_message = [hax message];
            [[iOSPushr sharedInstance] postNotificationFromApplication:@"" withMessage:[hax message] andBanner:hax];
        }
    }
        
    return hax;
}

CHOptimizedMethod3(self, SBBulletinBannerItem *, SBBulletinBannerItem, _initWithSeedBulletin, id, arg1, additionalBulletins, id, arg2, andObserver, id, arg3)
{
    SBBulletinBannerItem *hax = CHSuper3(SBBulletinBannerItem, _initWithSeedBulletin, arg1, additionalBulletins, arg2, andObserver, arg3);
    
    if ([[hax message] rangeOfString:@"Loading"].location == NSNotFound)
    {
        if (old_message == nil || ![[hax message] isEqualToString:old_message])
        {
            old_message = [hax message];
            [[iOSPushr sharedInstance] postNotificationFromApplication:[hax _appName] withMessage:[hax message] andBanner:hax];
        }
    }
    
    return hax;
}


CHConstructor // code block that runs immediately upon load
{
	@autoreleasepool
	{
        CHLoadLateClass(SBBulletinBannerItem);
        CHLoadLateClass(SBAwayBulletinListItem);
        
        CHHook2(SBAwayBulletinListItem, initWithBulletin, andObserver);
        CHHook3(SBBulletinBannerItem, _initWithSeedBulletin, additionalBulletins, andObserver);
	}
}
