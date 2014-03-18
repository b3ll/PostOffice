//
//  iOSPushrPreferencesController.m
//  iOSPushrPreferences
//
//  Created by Adam Bell on 2013-05-19.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "iOSPushrPreferencesController.h"
#import <Preferences/PSSpecifier.h>
#import "GTLMirror.h"
#import "GTMOAuth2ViewControllerTouch.h"

#define kSetting_Example_Name @"NameOfAnExampleSetting"
#define kSetting_Example_Value @"ValueOfAnExampleSetting"

#define kSetting_TemplateVersion_Name @"TemplateVersionExample"
#define kSetting_TemplateVersion_Value @"1.0"

#define kUrl_FollowOnTwitter @"https://twitter.com/b3ll"
#define kUrl_VisitWebSite @"http://iosopendev.com"

#define kPrefs_Path @"/var/mobile/Library/Preferences"
#define kPrefs_KeyName_Key @"key"
#define kPrefs_KeyName_Defaults @"defaults"

#define CLIENT_ID @""
#define CLIENT_SECRET @""

@implementation iOSPushrPreferencesController

- (void)showGoogleSignin:(id)sender
{
    NSDictionary *prefs = [[NSDictionary alloc] initWithContentsOfFile:[kPrefs_Path stringByAppendingPathComponent:@"ca.adambell.postoffice.plist"]];
    NSString *clientID = prefs[@"clientID"];
    NSString *clientSecret = prefs[@"clientSecret"];
    
    if (clientID == nil || clientID.length == 0 || clientSecret == nil || clientSecret.length == 0) {
        return;
    }
    
    GTMOAuth2Authentication *auth = [GTMOAuth2ViewControllerTouch authForGoogleFromKeychainForName:@"Pushr-iOS-OAuth"
                                                                                          clientID:clientID
                                                                                      clientSecret:clientSecret];
    if (auth != nil)
    {
        
        GTMOAuth2ViewControllerTouch *vc = [[GTMOAuth2ViewControllerTouch alloc] initWithScope:@"https://www.googleapis.com/auth/glass.timeline"
                                                                                      clientID:clientID
                                                                                  clientSecret:clientSecret
                                                                              keychainItemName:@"Pushr-iOS-OAuth"
                                                                             completionHandler:^(GTMOAuth2ViewControllerTouch *viewController, GTMOAuth2Authentication *_auth, NSError *error) {
                                                                                 
                                                                                 [[(UIViewController *)self navigationController] popViewControllerAnimated:YES];
                                                                                 
                                                                              
                                                                             }];
        
        [[(UIViewController *)self navigationController] pushViewController:vc animated:YES];        
   }
    else
    {
        // [self postNotificationWithAuth:auth fromApplication:@"iMessage" withMessage:@"This is a test."];
    }
}

- (void)signout:(id)sender
{
    [GTMOAuth2ViewControllerTouch removeAuthFromKeychainForName:@"Pushr-iOS-OAuth"];
}

- (id)getValueForSpecifier:(PSSpecifier*)specifier
{
	id value = nil;
	
	NSDictionary *specifierProperties = [specifier properties];
	NSString *specifierKey = [specifierProperties objectForKey:kPrefs_KeyName_Key];
	
	// get 'value' with code only
	if ([specifierKey isEqual:kSetting_TemplateVersion_Name])
	{
		value = kSetting_TemplateVersion_Value;
	}
	else if ([specifierKey isEqual:kSetting_Example_Name])
	{
		value = kSetting_Example_Value;
	}
	// ...or get 'value' from 'defaults' plist or (optionally as a default value) with code
	else
	{
		// get 'value' from 'defaults' plist (if 'defaults' key and file exists)
		NSMutableString *plistPath = [[NSMutableString alloc] initWithString:[specifierProperties objectForKey:kPrefs_KeyName_Defaults]];
		if (plistPath)
		{
			NSDictionary *dict = (NSDictionary*)[self initDictionaryWithFile:&plistPath asMutable:NO];
			
			id objectValue = [dict objectForKey:specifierKey];
			
			if (objectValue)
			{
				value = [NSString stringWithFormat:@"%@", objectValue];
				NSLog(@"read key '%@' with value '%@' from plist '%@'", specifierKey, value, plistPath);
			}
			else
			{
				NSLog(@"key '%@' not found in plist '%@'", specifierKey, plistPath);
			}			
		}
	}
	
	return value;
}

- (void)setValue:(id)value forSpecifier:(PSSpecifier*)specifier;
{
	NSDictionary *specifierProperties = [specifier properties];
	NSString *specifierKey = [specifierProperties objectForKey:kPrefs_KeyName_Key];
	
	// use 'value' with code only
	if ([specifierKey isEqual:kSetting_Example_Name])
	{
		// do something here with 'value'...
	}
	// ...or save 'value' to 'defaults' plist and (optionally) with code
	else
	{
		// save 'value' to 'defaults' plist (if 'defaults' key exists)
		NSMutableString *plistPath = [[NSMutableString alloc] initWithString:[specifierProperties objectForKey:kPrefs_KeyName_Defaults]];
		if (plistPath)
		{
			NSMutableDictionary *dict = (NSMutableDictionary*)[self initDictionaryWithFile:&plistPath asMutable:YES];
			[dict setObject:value forKey:specifierKey];
			[dict writeToFile:plistPath atomically:YES];

			NSLog(@"saved key '%@' with value '%@' to plist '%@'", specifierKey, value, plistPath);
		}
		
		// use 'value' with code
		if ([specifierKey isEqual:kSetting_Example_Name])
		{
			// do something here with 'value'...
		}
	}
}

- (id)initDictionaryWithFile:(NSMutableString**)plistPath asMutable:(BOOL)asMutable
{
	if ([*plistPath hasPrefix:@"/"])
		*plistPath = [NSString stringWithFormat:@"%@.plist", *plistPath];
	else
		*plistPath = [NSString stringWithFormat:@"%@/%@.plist", kPrefs_Path, *plistPath];
	
	Class class;
	if (asMutable)
		class = [NSMutableDictionary class];
	else
		class = [NSDictionary class];
	
	id dict;	
	if ([[NSFileManager defaultManager] fileExistsAtPath:*plistPath])
		dict = [[class alloc] initWithContentsOfFile:*plistPath];	
	else
		dict = [[class alloc] init];
	
	return dict;
}

- (void)followOnTwitter:(PSSpecifier*)specifier
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:kUrl_FollowOnTwitter]];
}

- (void)visitWebSite:(PSSpecifier*)specifier
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:kUrl_VisitWebSite]];
}

- (id)specifiers
{
	if (_specifiers == nil)
		_specifiers = [self loadSpecifiersFromPlistName:@"iOSPushrPreferences" target:self];
	
	return _specifiers;
}

- (id)init
{
	if ((self = [super init]))
	{
	}
	
	return self;
}

@end