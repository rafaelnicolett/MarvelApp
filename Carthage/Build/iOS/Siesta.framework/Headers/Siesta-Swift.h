// Generated by Apple Swift version 3.0.2 (swiftlang-800.0.63 clang-800.0.42.1)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import Foundation;
@import ObjectiveC;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"

@interface NSArray (SWIFT_EXTENSION(Siesta))
@end


@interface NSDictionary (SWIFT_EXTENSION(Siesta))
@end

@class BOSService;

@interface NSRegularExpression (SWIFT_EXTENSION(Siesta))
- (BOOL (^ _Nonnull)(NSURL * _Nonnull))configurationPattern:(BOSService * _Nonnull)service;
@end


@interface NSRegularExpression (SWIFT_EXTENSION(Siesta))
@end


@interface NSRegularExpression (SWIFT_EXTENSION(Siesta))
/**
  Matches URLs if this regular expression matches any substring of the URL’s full, absolute form.
  Note that, unlike the simpler wildcard form of \code
  String.configurationPattern(for:)
  \endcode, the regular expression is <em>not</em>
  matched relative to the Service’s base URL. The match is performed against the full URL: scheme, host, path,
  query string and all.
  Note also that this implementation matches substrings. Include \code
  ^
  \endcode and \code
  $
  \endcode if you want your pattern to match
  against the entire URL.
*/
- (BOOL (^ _Nonnull)(NSURL * _Nonnull))configurationPatternFor:(BOSService * _Nonnull)service;
/**
  :nodoc:
*/
@property (nonatomic, readonly, copy) NSString * _Nonnull configurationPatternDescription;
@end


/**
  An in-memory cache of a RESTful resource, plus information about the status of network requests related to it.
  This class answers three basic questions about a resource:
  <ul>
    <li>
      What is the latest data for the resource this device has retrieved, if any?
    </li>
    <li>
      Did the last attempt to load it result in an error?
    </li>
    <li>
      Is there a request in progress?
    </li>
  </ul>
  …and allows multiple observer to register to be notified whenever the answers to any of these
  questions changes.
*/
SWIFT_CLASS_NAMED("Resource")
@interface BOSResource : NSObject
/**
  The API to which this resource belongs. Provides configuration defaults and instance uniqueness.
*/
@property (nonatomic, readonly, strong) BOSService * _Nonnull service;
/**
  The canoncial URL of this resource.
*/
@property (nonatomic, readonly, copy) NSURL * _Nonnull url;
/**
  The time of the most recent update to either \code
  latestData
  \endcode or \code
  latestError
  \endcode.
*/
@property (nonatomic, readonly) NSTimeInterval timestamp;
/**
  True if any load requests (i.e. from calls to \code
  load(...)
  \endcode and \code
  loadIfNeeded()
  \endcode)
  for this resource are in progress.
*/
@property (nonatomic, readonly) BOOL isLoading;
/**
  True if any requests for this resource are in progress.
*/
@property (nonatomic, readonly) BOOL isRequesting;
/**
  True if the resource’s local state is up to date according to staleness configuration.
  “Up to date” means that either:
  <ul>
    <li>
      the resource has data (i.e. \code
      latestData
      \endcode is not nil),
    </li>
    <li>
      the last request succeeded (i.e. \code
      latestError
      \endcode <em>is</em> nil), and
    </li>
    <li>
      the timestamp on \code
      latestData
      \endcode is more recent than \code
      expirationTime
      \endcode seconds ago,
    </li>
  </ul>
  …or:
  <ul>
    <li>
      the last request failed (i.e. \code
      latestError
      \endcode is not nil), and
    </li>
    <li>
      the timestamp on \code
      latestError
      \endcode is more recent than \code
      retryTime
      \endcode seconds ago.
    </li>
  </ul>
*/
@property (nonatomic, readonly) BOOL isUpToDate;
/**
  If this resource has no observers, cancels all \code
  loadRequests
  \endcode.
*/
- (void)cancelLoadIfUnobserved;
/**
  Convenience to call \code
  cancelLoadIfUnobserved()
  \endcode after a delay. Useful for situations such as table view scrolling
  where views are being rapidly discarded and recreated, and you no longer need the resource, but want to give other
  views a chance to express interest in it before canceling any requests.
  The \code
  callback
  \endcode is called aftrer the given delay, regardless of whether the request was cancelled.
*/
- (void)cancelLoadIfUnobservedAfterDelay:(NSTimeInterval)delay then:(void (^ _Nonnull)(void))callback;
/**
  Convenience method to replace the \code
  content
  \endcode of \code
  latestData
  \endcode without altering the content type or other headers.
  If this resource has no content, this method sets the content type to \code
  application/binary
  \endcode.
*/
- (void)overrideLocalContentWith:(id _Nonnull)content;
/**
  Forces the next call to \code
  loadIfNeeded()
  \endcode to trigger a request, even if the current content is fresh.
  Leaves the current values of \code
  latestData
  \endcode and \code
  latestError
  \endcode intact (including their timestamps).
  Use this if you know the current content is stale, but don’t want to trigger a network request right away.
  Any update to \code
  latestData
  \endcode or \code
  latestError
  \endcode — including a call to \code
  overrideLocalData(...)
  \endcode or
  \code
  overrideLocalContent(...)
  \endcode — clears the invalidation.
  seealso:
  \code
  wipe()
  \endcode
*/
- (void)invalidate;
/**
  Resets this resource to its pristine state, as if newly created.
  <ul>
    <li>
      Sets \code
      latestData
      \endcode to nil.
    </li>
    <li>
      Sets \code
      latestError
      \endcode to nil.
    </li>
    <li>
      Cancels all resource requests in progress.
    </li>
  </ul>
  Observers receive a \code
  newData
  \endcode event. Requests in progress call completion hooks with a cancellation error.
  seealso:
  \code
  invalidate()
  \endcode
*/
- (void)wipe;
/**
  :nodoc:
*/
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


@interface BOSResource (SWIFT_EXTENSION(Siesta))
- (BOOL (^ _Nonnull)(NSURL * _Nonnull))configurationPattern:(BOSService * _Nonnull)service;
@end


@interface BOSResource (SWIFT_EXTENSION(Siesta))
@end

@class BOSRequest;

@interface BOSResource (SWIFT_EXTENSION(Siesta))
- (BOSRequest * _Nonnull)load;
- (BOSRequest * _Nullable)loadIfNeeded;
@end

@protocol BOSResourceObserver;

@interface BOSResource (SWIFT_EXTENSION(Siesta))
- (nonnull instancetype)addObserver:(id <BOSResourceObserver> _Nonnull)observerAndOwner;
- (nonnull instancetype)addObserver:(id <BOSResourceObserver> _Nonnull)objcObserver owner:(id _Nonnull)owner;
- (nonnull instancetype)addObserverWithOwner:(id _Nonnull)owner callback:(void (^ _Nonnull)(BOSResource * _Nonnull, NSString * _Nonnull))block;
@end


@interface BOSResource (SWIFT_EXTENSION(Siesta))
- (void)overrideLocalContent:(id _Nonnull)content;
@end


@interface BOSResource (SWIFT_EXTENSION(Siesta))
/**
  Returns the resource with the given string appended to the path of this resource’s URL, with a joining slash
  inserted if necessary.
  Use this method for hierarchical resource navigation. The typical use case is constructing a resource URL from
  path components and IDs:
  \code
  let resource = service.resource("/widgets")
  resource.child("123").child("details")
    //→ /widgets/123/details

  \endcodeThis method <em>always</em> returns a subpath of the receiving resource. It does not apply any special
  interpretation to strings such \code
  ./
  \endcode, \code
  //
  \endcode or \code
  ?
  \endcode that have significance in other URL-related
  situations. Special characters are escaped when necessary, and otherwise ignored. See
  <a href="https://bustoutsolutions.github.io/siesta/specs/#ResourcePathsSpec">\code
  ResourcePathsSpec
  \endcode</a>
  for details.
  seealso:
  \code
  relative(_:)
  \endcode
*/
- (BOSResource * _Nonnull)child:(NSString * _Nonnull)subpath;
/**
  Returns the resource with the given URL, using this resource’s URL as the base if it is a relative URL.
  This method interprets strings such as \code
  .
  \endcode, \code
  ..
  \endcode, and a leading \code
  /
  \endcode or \code
  //
  \endcode as relative URLs. It resolves its
  parameter much like an \code
  href
  \endcode attribute in an HTML document. Refer to
  <a href="https://bustoutsolutions.github.io/siesta/specs/#ResourcePathsSpec">\code
  ResourcePathsSpec
  \endcode</a>
  for details.
  seealso:

  <ul>
    <li>
      \code
      optionalRelative(_:)
      \endcode
    </li>
    <li>
      \code
      child(_:)
      \endcode
    </li>
  </ul>
*/
- (BOSResource * _Nonnull)relative:(NSString * _Nonnull)href;
/**
  Returns \code
  relative(href)
  \endcode if \code
  href
  \endcode is present, and nil if \code
  href
  \endcode is nil.
  This convenience method is useful for resolving URLs returned as part of a JSON response body:
  \code
  let href = resource.jsonDict["owner"] as? String  // href is an optional
  if let ownerResource = resource.optionalRelative(href) {
    ...
  }

  \endcode*/
- (BOSResource * _Nullable)optionalRelative:(NSString * _Nullable)href;
/**
  Returns this resource with the given parameter added or changed in the query string.
  If \code
  value
  \endcode is an empty string, the parameter goes in the query string with no value (e.g. \code
  ?foo
  \endcode).
  If \code
  value
  \endcode is nil, the parameter is removed.
  There is no support for parameters with an equal sign but an empty value (e.g. \code
  ?foo=
  \endcode).
  There is also no support for repeated keys in the query string (e.g. \code
  ?foo=1&foo=2
  \endcode).
  If you need to circumvent either of these restrictions, you can create the query string yourself and pass
  it to \code
  relative(_:)
  \endcode instead of using \code
  withParam(_:_:)
  \endcode.
  Note that \code
  Service
  \endcode gives out unique \code
  Resource
  \endcode instances according to the full URL in string form, and thus
  considers query string parameter order significant. Therefore, to ensure that you get the same \code
  Resource
  \endcode
  instance no matter the order in which you specify parameters, \code
  withParam(_:_:)
  \endcode sorts all parameters by name.
  Note that <em>only</em> \code
  withParam(_:_:)
  \endcode does this sorting; if you use other methods to create query strings, it is
  up to you to canonicalize your parameter order.
*/
- (BOSResource * _Nonnull)withParam:(NSString * _Nonnull)name value:(NSString * _Nullable)value;
@end


@interface BOSResource (SWIFT_EXTENSION(Siesta))
@end


@interface BOSResource (SWIFT_EXTENSION(Siesta))
/**
  Matches this specific resource when passed as a pattern to \code
  Service.configure(...)
  \endcode.
*/
- (BOOL (^ _Nonnull)(NSURL * _Nonnull))configurationPatternFor:(BOSService * _Nonnull)service;
/**
  :nodoc:
*/
@property (nonatomic, readonly, copy) NSString * _Nonnull configurationPatternDescription;
@end


@interface BOSResource (SWIFT_EXTENSION(Siesta))
@end


@interface BOSResource (SWIFT_EXTENSION(Siesta))
/**
  Removes all observers owned by the given object.
*/
- (void)removeObserversOwnedBy:(id _Nullable)owner;
@end

@class NSMutableURLRequest;

@interface BOSResource (SWIFT_EXTENSION(Siesta))
- (BOSRequest * _Nonnull)requestWithMethod:(NSString * _Nonnull)method requestMutation:(void (^ _Nullable)(NSMutableURLRequest * _Nonnull))requestMutation;
- (BOSRequest * _Nonnull)requestWithMethod:(NSString * _Nonnull)method;
- (BOSRequest * _Nonnull)requestWithMethod:(NSString * _Nonnull)method data:(NSData * _Nonnull)data contentType:(NSString * _Nonnull)contentType requestMutation:(void (^ _Nullable)(NSMutableURLRequest * _Nonnull))requestMutation;
- (BOSRequest * _Nonnull)requestWithMethod:(NSString * _Nonnull)method text:(NSString * _Nonnull)text;
- (BOSRequest * _Nonnull)requestWithMethod:(NSString * _Nonnull)method text:(NSString * _Nonnull)text contentType:(NSString * _Nonnull)contentType encoding:(NSUInteger)encoding requestMutation:(void (^ _Nullable)(NSMutableURLRequest * _Nonnull))requestMutation;
- (BOSRequest * _Nonnull)requestWithMethod:(NSString * _Nonnull)method json:(NSObject * _Nullable)json;
- (BOSRequest * _Nonnull)requestWithMethod:(NSString * _Nonnull)method json:(NSObject * _Nullable)json contentType:(NSString * _Nonnull)contentType requestMutation:(void (^ _Nullable)(NSMutableURLRequest * _Nonnull))requestMutation;
- (BOSRequest * _Nonnull)requestWithMethod:(NSString * _Nonnull)method urlEncoded:(NSDictionary<NSString *, NSString *> * _Nonnull)params requestMutation:(void (^ _Nullable)(NSMutableURLRequest * _Nonnull))requestMutation;
- (BOSRequest * _Nonnull)loadUsingRequest:(BOSRequest * _Nonnull)req;
@end

@class BOSEntity;
@class BOSError;

@interface BOSResource (SWIFT_EXTENSION(Siesta))
@property (nonatomic, readonly, strong) BOSEntity * _Nullable latestData;
@property (nonatomic, readonly, strong) BOSError * _Nullable latestError;
@property (nonatomic, readonly, strong) NSDictionary * _Nonnull jsonDict;
@property (nonatomic, readonly, strong) NSArray * _Nonnull jsonArray;
@property (nonatomic, readonly, copy) NSString * _Nonnull text;
- (void)overrideLocalData:(BOSEntity * _Nonnull)entity;
@end


/**
  A set of logically connected RESTful resources. Resources within a service share caching, configuration, and a
  “same URL → same resource” uniqueness guarantee.
  You will typically create a separate instance of \code
  Service
  \endcode for each REST API you use. You can either subclass
  \code
  Service
  \endcode or encapsulte it inside a wrapper. Regardless, to reap the benefits of Siesta, you’ll want to ensure that
  all the observers of an API share a single instance.
  You can optionally specify a \code
  baseURL
  \endcode, which allows you to get endpoints by path: \code
  service.resource("/foo")
  \endcode.
  Specifying a \code
  baseURL
  \endcode does <em>not</em> limit the service only to subpaths of that URL. Its one and only purpose is to be
  the starting point for \code
  resource(_:)
  \endcode.
  Note that \code
  baseURL
  \endcode is only a convenience, and is optional.
  If you want to group multiple base URLs in a single \code
  Service
  \endcode instance, use \code
  resource(baseURL:path:)
  \endcode.
  If you want to feed your service arbitrary URLs with no common root, use \code
  resource(absoluteURL:)
  \endcode.
*/
SWIFT_CLASS_NAMED("Service")
@interface BOSService : NSObject
/**
  The root URL of the API. If nil, then \code
  resource(_:)
  \endcode will only accept absolute URLs.
*/
@property (nonatomic, readonly, copy) NSURL * _Nullable baseURL;
/**
  Returns the unique resource with the given path appended to the path component of \code
  baseURL
  \endcode.
  A leading slash is optional, and has no effect:
  \code
  service.resource("users")   // same
  service.resource("/users")  // thing

  \endcodenote:

  The \code
  path
  \endcode parameter is simply appended to \code
  baseURL
  \endcode’s path, and is <em>never</em> interpreted as a URL. Strings
  such as \code
  ..
  \endcode, \code
  //
  \endcode, \code
  ?
  \endcode, and \code
  https:
  \endcode have no special meaning; they go directly into the resulting
  resource’s path, with escaping if necessary.
  If you want to pass an absolute URL, use \code
  resource(absoluteURL:)
  \endcode.
  If you want to pass a relative URL to be resolved against \code
  baseURL
  \endcode, use \code
  resource("/").relative(relativeURL)
  \endcode.
*/
- (BOSResource * _Nonnull)resource:(NSString * _Nonnull)path;
/**
  Signals that all resources need to recompute their configuration next time they need it.
  Because the \code
  configure(...)
  \endcode methods accept an arbitrary closure, it is possible that the results of
  that closure could change over time. However, resources cache their configuration after it is computed. Therefore,
  if you do anything that would change the result of a configuration closure, you must call
  \code
  invalidateConfiguration()
  \endcode in order for the changes to take effect.
  <em>《insert your functional programming purist rant here if you so desire》</em>
  Note that you do <em>not</em> need to call this method after calling any of the \code
  configure(...)
  \endcode methods.
  You only need to call it if one of the previously passed closures will now behave differently.
  For example, to make a header track the value of a modifiable property:
  \code
  var flavor: String? {
    didSet { invalidateConfiguration() }
  }

  init() {
    super.init(baseURL: "https://api.github.com")
    configure {
      $0.headers["Flavor-of-the-month"] = self.flavor  // NB: use weak self if service isn’t a singleton
    }
  }

  \endcodeNote that this method does <em>not</em> immediately recompute all existing configurations. This is an inexpensive call.
  Configurations are computed lazily, and the (still relatively low) performance impact of recomputation is spread
  over subsequent resource interactions.
*/
- (void)invalidateConfiguration;
/**
  Wipes the state of all this service’s resources. Typically used to handle logout.
  Applies to resources matching the predicate, or all resources by default.
*/
- (void)wipeResourcesMatching:(SWIFT_NOESCAPE BOOL (^ _Nonnull)(BOSResource * _Nonnull))predicate;
/**
  Wipes the state of a subset of this service’s resources, matching based on URLs (instead of \code
  Resource
  \endcode instances).
  Useful for making shared predicates that you can pass to both \code
  configure(...)
  \endcode and this method.
*/
- (void)wipeResourcesWithURLsMatching:(SWIFT_NOESCAPE BOOL (^ _Nonnull)(NSURL * _Nonnull))predicate;
/**
  Soft limit on the number of resources cached in memory. If the internal cache size exceeds this limit, Siesta
  flushes all unused resources. Note that any resources still in use — i.e. retained outside of Siesta — will remain
  in the cache, no matter how many there are.
*/
@property (nonatomic) NSInteger cachedResourceCountLimit;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


@interface BOSService (SWIFT_EXTENSION(Siesta))
- (void)wipeResourcesMatchingURLWithPredicate:(SWIFT_NOESCAPE BOOL (^ _Nonnull)(NSURL * _Nonnull))predicate;
@end


@interface BOSService (SWIFT_EXTENSION(Siesta))
- (BOSResource * _Nonnull)resourceWithAbsoluteURL:(NSURL * _Nullable)url;
- (BOSResource * _Nonnull)resourceWithAbsoluteURLString:(NSString * _Nullable)url;
@end


@interface NSURLSession (SWIFT_EXTENSION(Siesta))
@end


@interface NSURLSessionConfiguration (SWIFT_EXTENSION(Siesta))
@end


SWIFT_CLASS_NAMED("_objc_Entity")
@interface BOSEntity : NSObject
@property (nonatomic, strong) id _Nonnull content;
@property (nonatomic, copy) NSString * _Nonnull contentType;
@property (nonatomic, copy) NSString * _Nullable charset;
@property (nonatomic, copy) NSString * _Nullable etag;
@property (nonatomic, readonly) NSTimeInterval timestamp;
- (nonnull instancetype)initWithContent:(id _Nonnull)content contentType:(NSString * _Nonnull)contentType headers:(NSDictionary<NSString *, NSString *> * _Nonnull)headers OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithContent:(id _Nonnull)content contentType:(NSString * _Nonnull)contentType;
- (NSString * _Nullable)header:(NSString * _Nonnull)key;
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end

@class NSError;

SWIFT_CLASS_NAMED("_objc_Error")
@interface BOSError : NSObject
@property (nonatomic) NSInteger httpStatusCode;
@property (nonatomic, strong) NSError * _Nullable cause;
@property (nonatomic, copy) NSString * _Nonnull userMessage;
@property (nonatomic, strong) BOSEntity * _Nullable entity;
@property (nonatomic, readonly) NSTimeInterval timestamp;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


@interface BOSError (SWIFT_EXTENSION(Siesta))
@end


SWIFT_CLASS_NAMED("_objc_Request")
@interface BOSRequest : NSObject
- (BOSRequest * _Nonnull)onCompletion:(void (^ _Nonnull)(BOSEntity * _Nullable, BOSError * _Nullable))objcCallback;
- (BOSRequest * _Nonnull)onSuccess:(void (^ _Nonnull)(BOSEntity * _Nonnull))objcCallback;
- (BOSRequest * _Nonnull)onNewData:(void (^ _Nonnull)(BOSEntity * _Nonnull))objcCallback;
- (BOSRequest * _Nonnull)onNotModified:(void (^ _Nonnull)(void))objcCallback;
- (BOSRequest * _Nonnull)onFailure:(void (^ _Nonnull)(BOSError * _Nonnull))objcCallback;
- (BOSRequest * _Nonnull)onProgress:(void (^ _Nonnull)(float))objcCallback;
- (void)cancel;
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


SWIFT_PROTOCOL_NAMED("_objc_ResourceObserver")
@protocol BOSResourceObserver
- (void)resourceChanged:(BOSResource * _Nonnull)resource event:(NSString * _Nonnull)event;
@optional
- (void)resourceRequestProgress:(BOSResource * _Nonnull)resource progress:(double)progress;
- (void)stoppedObservingResource:(BOSResource * _Nonnull)resource;
@end

#pragma clang diagnostic pop
