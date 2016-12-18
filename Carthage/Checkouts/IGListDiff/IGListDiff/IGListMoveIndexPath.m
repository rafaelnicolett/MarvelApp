/**
 * Copyright (c) 2016-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "IGListMoveIndexPath.h"
#import "IGListMoveIndexPathInternal.h"

#import <IGListDiff/IGListMacros.h>

@implementation IGListMoveIndexPath

- (instancetype)initWithFrom:(NSIndexPath *)from to:(NSIndexPath *)to {
    NSParameterAssert(from != nil);
    NSParameterAssert(to != nil);
    if (self = [super init]) {
        _from = from;
        _to = to;
    }
    return self;
}

- (NSUInteger)hash {
    return [_from hash] ^ [_to hash];
}

- (BOOL)isEqual:(id)object {
    if (object == self) {
        return YES;
    }
    if ([object isKindOfClass:[IGListMoveIndexPath class]]) {
        NSIndexPath *f1 = self.from, *f2 = [object from];
        NSIndexPath *t1 = self.to, *t2 = [object to];
        return [f1 isEqual:f2] && [t1 isEqual:t2];
    }
    return NO;
}

- (NSComparisonResult)compare:(id)object {
    return [[self from] compare:[object from]];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@ %p; from: %@; to: %@;>", NSStringFromClass(self.class), self, self.from, self.to];
}

@end
