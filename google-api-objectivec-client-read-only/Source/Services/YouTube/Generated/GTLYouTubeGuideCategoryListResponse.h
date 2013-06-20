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
//  GTLYouTubeGuideCategoryListResponse.h
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   YouTube Data API (youtube/v3)
// Description:
//   Programmatic access to YouTube features.
// Documentation:
//   https://developers.google.com/youtube/v3
// Classes:
//   GTLYouTubeGuideCategoryListResponse (0 custom class methods, 4 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

@class GTLYouTubeGuideCategory;

// ----------------------------------------------------------------------------
//
//   GTLYouTubeGuideCategoryListResponse
//

// A paginated list of guide categories returned as the response to a
// youtube.guideCategories.list call.

// This class supports NSFastEnumeration over its "items" property. It also
// supports -itemAtIndex: to retrieve individual objects from "items".

@interface GTLYouTubeGuideCategoryListResponse : GTLCollectionObject

// The ETag of the response.
@property (copy) NSString *ETag;

// Serialized EventId of the request which produced this response.
@property (copy) NSString *eventId;

// A list of categories that can be associated with YouTube channels. In this
// map, the category ID is the map key, and its value is the corresponding
// guideCategory resource.
@property (retain) NSArray *items;  // of GTLYouTubeGuideCategory

// The type of the API response. For this operation, the value will be
// youtube#guideCategoryListResponse.
@property (copy) NSString *kind;

@end
