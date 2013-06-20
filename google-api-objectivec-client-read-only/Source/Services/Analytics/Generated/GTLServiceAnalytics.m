/* Copyright (c) 2013 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//
//  GTLServiceAnalytics.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   Google Analytics API (analytics/v3)
// Description:
//   View and manage your Google Analytics data
// Documentation:
//   https://developers.google.com/analytics/
// Classes:
//   GTLServiceAnalytics (0 custom class methods, 0 custom properties)

#import "GTLAnalytics.h"

@implementation GTLServiceAnalytics

#if DEBUG
// Method compiled in debug builds just to check that all the needed support
// classes are present at link time.
+ (NSArray *)checkClasses {
  NSArray *classes = [NSArray arrayWithObjects:
                      [GTLQueryAnalytics class],
                      [GTLAnalyticsAccount class],
                      [GTLAnalyticsAccounts class],
                      [GTLAnalyticsCustomDataSource class],
                      [GTLAnalyticsCustomDataSources class],
                      [GTLAnalyticsDailyUpload class],
                      [GTLAnalyticsDailyUploadAppend class],
                      [GTLAnalyticsDailyUploads class],
                      [GTLAnalyticsExperiment class],
                      [GTLAnalyticsExperiments class],
                      [GTLAnalyticsGaData class],
                      [GTLAnalyticsGoal class],
                      [GTLAnalyticsGoals class],
                      [GTLAnalyticsMcfData class],
                      [GTLAnalyticsProfile class],
                      [GTLAnalyticsProfiles class],
                      [GTLAnalyticsSegment class],
                      [GTLAnalyticsSegments class],
                      [GTLAnalyticsWebproperties class],
                      [GTLAnalyticsWebproperty class],
                      nil];
  return classes;
}
#endif  // DEBUG

- (id)init {
  self = [super init];
  if (self) {
    // Version from discovery.
    self.apiVersion = @"v3";

    // From discovery.  Where to send JSON-RPC.
    // Turn off prettyPrint for this service to save bandwidth (especially on
    // mobile). The fetcher logging will pretty print.
    self.rpcURL = [NSURL URLWithString:@"https://www.googleapis.com/rpc?prettyPrint=false"];
    self.rpcUploadURL = [NSURL URLWithString:@"https://www.googleapis.com/upload/rpc?uploadType=resumable&prettyPrint=false"];
  }
  return self;
}

@end
