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
//  GTLBooksVolume.m
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   Books API (books/v1)
// Description:
//   Lets you search for books and manage your Google Books library.
// Documentation:
//   https://developers.google.com/books/docs/v1/getting_started
// Classes:
//   GTLBooksVolume (0 custom class methods, 11 custom properties)
//   GTLBooksVolumeAccessInfo (0 custom class methods, 11 custom properties)
//   GTLBooksVolumeLayerInfo (0 custom class methods, 1 custom properties)
//   GTLBooksVolumeRecommendedInfo (0 custom class methods, 1 custom properties)
//   GTLBooksVolumeSaleInfo (0 custom class methods, 7 custom properties)
//   GTLBooksVolumeSearchInfo (0 custom class methods, 1 custom properties)
//   GTLBooksVolumeUserInfo (0 custom class methods, 8 custom properties)
//   GTLBooksVolumeVolumeInfo (0 custom class methods, 20 custom properties)
//   GTLBooksVolumeAccessInfoEpub (0 custom class methods, 3 custom properties)
//   GTLBooksVolumeAccessInfoPdf (0 custom class methods, 3 custom properties)
//   GTLBooksVolumeLayerInfoLayersItem (0 custom class methods, 2 custom properties)
//   GTLBooksVolumeSaleInfoListPrice (0 custom class methods, 2 custom properties)
//   GTLBooksVolumeSaleInfoRetailPrice (0 custom class methods, 2 custom properties)
//   GTLBooksVolumeUserInfoUserUploadedVolumeInfo (0 custom class methods, 1 custom properties)
//   GTLBooksVolumeVolumeInfoDimensions (0 custom class methods, 3 custom properties)
//   GTLBooksVolumeVolumeInfoImageLinks (0 custom class methods, 6 custom properties)
//   GTLBooksVolumeVolumeInfoIndustryIdentifiersItem (0 custom class methods, 2 custom properties)

#import "GTLBooksVolume.h"

#import "GTLBooksDownloadAccessRestriction.h"
#import "GTLBooksReadingPosition.h"
#import "GTLBooksReview.h"

// ----------------------------------------------------------------------------
//
//   GTLBooksVolume
//

@implementation GTLBooksVolume
@dynamic accessInfo, ETag, identifier, kind, layerInfo, recommendedInfo,
         saleInfo, searchInfo, selfLink, userInfo, volumeInfo;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map =
    [NSDictionary dictionaryWithObjectsAndKeys:
      @"etag", @"ETag",
      @"id", @"identifier",
      nil];
  return map;
}

+ (void)load {
  [self registerObjectClassForKind:@"books#volume"];
}

@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeAccessInfo
//

@implementation GTLBooksVolumeAccessInfo
@dynamic accessViewStatus, country, downloadAccess, embeddable, epub, pdf,
         publicDomain, textToSpeechPermission, viewability, viewOrderUrl,
         webReaderLink;
@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeLayerInfo
//

@implementation GTLBooksVolumeLayerInfo
@dynamic layers;

+ (NSDictionary *)arrayPropertyToClassMap {
  NSDictionary *map =
    [NSDictionary dictionaryWithObject:[GTLBooksVolumeLayerInfoLayersItem class]
                                forKey:@"layers"];
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeRecommendedInfo
//

@implementation GTLBooksVolumeRecommendedInfo
@dynamic explanation;
@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeSaleInfo
//

@implementation GTLBooksVolumeSaleInfo
@dynamic buyLink, country, isEbook, listPrice, onSaleDate, retailPrice,
         saleability;
@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeSearchInfo
//

@implementation GTLBooksVolumeSearchInfo
@dynamic textSnippet;
@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeUserInfo
//

@implementation GTLBooksVolumeUserInfo
@dynamic isInMyBooks, isPreordered, isPurchased, isUploaded, readingPosition,
         review, updated, userUploadedVolumeInfo;
@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeVolumeInfo
//

@implementation GTLBooksVolumeVolumeInfo
@dynamic authors, averageRating, canonicalVolumeLink, categories,
         contentVersion, descriptionProperty, dimensions, imageLinks,
         industryIdentifiers, infoLink, language, mainCategory, pageCount,
         previewLink, printType, publishedDate, publisher, ratingsCount,
         subtitle, title;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map =
    [NSDictionary dictionaryWithObject:@"description"
                                forKey:@"descriptionProperty"];
  return map;
}

+ (NSDictionary *)arrayPropertyToClassMap {
  NSDictionary *map =
    [NSDictionary dictionaryWithObjectsAndKeys:
      [NSString class], @"authors",
      [NSString class], @"categories",
      [GTLBooksVolumeVolumeInfoIndustryIdentifiersItem class], @"industryIdentifiers",
      nil];
  return map;
}

@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeAccessInfoEpub
//

@implementation GTLBooksVolumeAccessInfoEpub
@dynamic acsTokenLink, downloadLink, isAvailable;
@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeAccessInfoPdf
//

@implementation GTLBooksVolumeAccessInfoPdf
@dynamic acsTokenLink, downloadLink, isAvailable;
@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeLayerInfoLayersItem
//

@implementation GTLBooksVolumeLayerInfoLayersItem
@dynamic layerId, volumeAnnotationsVersion;
@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeSaleInfoListPrice
//

@implementation GTLBooksVolumeSaleInfoListPrice
@dynamic amount, currencyCode;
@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeSaleInfoRetailPrice
//

@implementation GTLBooksVolumeSaleInfoRetailPrice
@dynamic amount, currencyCode;
@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeUserInfoUserUploadedVolumeInfo
//

@implementation GTLBooksVolumeUserInfoUserUploadedVolumeInfo
@dynamic processingState;
@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeVolumeInfoDimensions
//

@implementation GTLBooksVolumeVolumeInfoDimensions
@dynamic height, thickness, width;
@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeVolumeInfoImageLinks
//

@implementation GTLBooksVolumeVolumeInfoImageLinks
@dynamic extraLarge, large, medium, small, smallThumbnail, thumbnail;
@end


// ----------------------------------------------------------------------------
//
//   GTLBooksVolumeVolumeInfoIndustryIdentifiersItem
//

@implementation GTLBooksVolumeVolumeInfoIndustryIdentifiersItem
@dynamic identifierProperty, type;

+ (NSDictionary *)propertyToJSONKeyMap {
  NSDictionary *map =
    [NSDictionary dictionaryWithObject:@"identifier"
                                forKey:@"identifierProperty"];
  return map;
}

@end
