/* Copyright (c) 2012 Google Inc.
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
//  GTLShoppingModelExtras.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   Search API For Shopping (shopping/v1)
// Description:
//   Lets you search over product data.
// Documentation:
//   https://developers.google.com/shopping-search/v1/getting_started
// Classes:
//   GTLShoppingModelExtras (0 custom class methods, 2 custom properties)
//   GTLShoppingModelExtrasFacetRulesItem (0 custom class methods, 1 custom properties)
//   GTLShoppingModelExtrasRankingRulesItem (0 custom class methods, 1 custom properties)

#import "GTLShoppingModelExtras.h"

// ----------------------------------------------------------------------------
//
//   GTLShoppingModelExtras
//

@implementation GTLShoppingModelExtras
@dynamic facetRules, rankingRules;

+ (NSDictionary *)arrayPropertyToClassMap {
  NSDictionary *map =
    [NSDictionary dictionaryWithObjectsAndKeys:
      [GTLShoppingModelExtrasFacetRulesItem class], @"facetRules",
      [GTLShoppingModelExtrasRankingRulesItem class], @"rankingRules",
      nil];
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLShoppingModelExtrasFacetRulesItem
//

@implementation GTLShoppingModelExtrasFacetRulesItem
@dynamic name;
@end


// ----------------------------------------------------------------------------
//
//   GTLShoppingModelExtrasRankingRulesItem
//

@implementation GTLShoppingModelExtrasRankingRulesItem
@dynamic name;
@end
