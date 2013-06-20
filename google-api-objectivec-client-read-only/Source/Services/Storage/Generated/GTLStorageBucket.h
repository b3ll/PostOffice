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
//  GTLStorageBucket.h
//

// ----------------------------------------------------------------------------
// NOTE: This file is generated from Google APIs Discovery Service.
// Service:
//   Cloud Storage API (storage/v1beta2)
// Description:
//   Lets you store and retrieve potentially-large, immutable data objects.
// Documentation:
//   https://developers.google.com/storage/docs/json_api/
// Classes:
//   GTLStorageBucket (0 custom class methods, 16 custom properties)
//   GTLStorageBucketCorsItem (0 custom class methods, 4 custom properties)
//   GTLStorageBucketLogging (0 custom class methods, 2 custom properties)
//   GTLStorageBucketOwner (0 custom class methods, 2 custom properties)
//   GTLStorageBucketVersioning (0 custom class methods, 1 custom properties)
//   GTLStorageBucketWebsite (0 custom class methods, 2 custom properties)

#if GTL_BUILT_AS_FRAMEWORK
  #import "GTL/GTLObject.h"
#else
  #import "GTLObject.h"
#endif

@class GTLStorageBucketAccessControl;
@class GTLStorageBucketCorsItem;
@class GTLStorageBucketLogging;
@class GTLStorageBucketOwner;
@class GTLStorageBucketVersioning;
@class GTLStorageBucketWebsite;
@class GTLStorageObjectAccessControl;

// ----------------------------------------------------------------------------
//
//   GTLStorageBucket
//

// A bucket.

@interface GTLStorageBucket : GTLObject

// Access controls on the bucket.
@property (retain) NSArray *acl;  // of GTLStorageBucketAccessControl

// The bucket's Cross-Origin Resource Sharing (CORS) configuration.
@property (retain) NSArray *cors;  // of GTLStorageBucketCorsItem

// Default access controls to apply to new objects when no ACL is provided.
@property (retain) NSArray *defaultObjectAcl;  // of GTLStorageObjectAccessControl

// HTTP 1.1 Entity tag for the bucket.
@property (copy) NSString *ETag;

// The ID of the bucket.
// identifier property maps to 'id' in JSON (to avoid Objective C's 'id').
@property (copy) NSString *identifier;

// The kind of item this is. For buckets, this is always storage#bucket.
@property (copy) NSString *kind;

// The location of the bucket. Object data for objects in the bucket resides in
// physical storage within this region. Typical values are US and EU. Defaults
// to US. See the developer's guide for the authoritative list.
@property (copy) NSString *location;

// The bucket's logging configuration, which defines the destination bucket and
// optional name prefix for the current bucket's logs.
@property (retain) GTLStorageBucketLogging *logging;

// The metadata generation of this bucket.
@property (retain) NSNumber *metageneration;  // longLongValue

// The name of the bucket.
@property (copy) NSString *name;

// The owner of the bucket. This will always be the project team's owner group.
@property (retain) GTLStorageBucketOwner *owner;

// The URI of this bucket.
@property (copy) NSString *selfLink;

// The bucket's storage class. This defines how objects in the bucket will be
// stored and determines the SLA and the cost of storage. Can be STANDARD or
// DRA. Defaults to STANDARD.
@property (copy) NSString *storageClass;

// Creation time of the bucket in RFC 3339 format.
@property (retain) GTLDateTime *timeCreated;

// The bucket's versioning configuration.
@property (retain) GTLStorageBucketVersioning *versioning;

// The bucket's website configuration.
@property (retain) GTLStorageBucketWebsite *website;

@end


// ----------------------------------------------------------------------------
//
//   GTLStorageBucketCorsItem
//

@interface GTLStorageBucketCorsItem : GTLObject

// The value, in seconds, to return in the Access-Control-Max-Age header used in
// preflight responses.
@property (retain) NSNumber *maxAgeSeconds;  // intValue

// The list of HTTP methods on which to include CORS response headers, e.g. GET,
// OPTIONS, POST. Note, "*" is permitted in the list of methods, and means "any
// method".
@property (retain) NSArray *method;  // of NSString

// The list of Origins eligible to receive CORS response headers. Note: "*" is
// permitted in the list of origins, and means "any Origin".
@property (retain) NSArray *origin;  // of NSString

// The list of HTTP headers other than the simple response headers to give
// permission for the user-agent to share across domains.
@property (retain) NSArray *responseHeader;  // of NSString

@end


// ----------------------------------------------------------------------------
//
//   GTLStorageBucketLogging
//

@interface GTLStorageBucketLogging : GTLObject

// The destination bucket where the current bucket's logs should be placed.
@property (copy) NSString *logBucket;

// A prefix for log object names.
@property (copy) NSString *logObjectPrefix;

@end


// ----------------------------------------------------------------------------
//
//   GTLStorageBucketOwner
//

@interface GTLStorageBucketOwner : GTLObject

// The entity, in the form group-groupId.
@property (copy) NSString *entity;

// The ID for the entity.
@property (copy) NSString *entityId;

@end


// ----------------------------------------------------------------------------
//
//   GTLStorageBucketVersioning
//

@interface GTLStorageBucketVersioning : GTLObject

// While set to true, versioning is fully enabled for this bucket.
@property (retain) NSNumber *enabled;  // boolValue

@end


// ----------------------------------------------------------------------------
//
//   GTLStorageBucketWebsite
//

@interface GTLStorageBucketWebsite : GTLObject

// Behaves as the bucket's directory index where missing objects are treated as
// potential directories.
@property (copy) NSString *mainPageSuffix;

// The custom object to return when a requested resource is not found.
@property (copy) NSString *notFoundPage;

@end
