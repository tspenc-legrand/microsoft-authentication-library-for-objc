//------------------------------------------------------------------------------
//
// Copyright (c) Microsoft Corporation.
// All rights reserved.
//
// This code is licensed under the MIT License.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files(the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and / or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions :
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//------------------------------------------------------------------------------

#import "MSALTenantProfile.h"
#import "MSALTenantProfile+Internal.h"
#import "MSALAuthority.h"
#import "MSALAuthorityFactory.h"

@implementation MSALTenantProfile

- (instancetype)initWithUserObjectId:(NSString *)userObjectId
                            tenantId:(NSString *)tenantId
                           authority:(MSALAuthority *)authority
                        isHomeTenant:(BOOL)isHomeTenant
                              claims:(NSDictionary *)claims
{
    self = [super init];
    
    if (self)
    {
        _userObjectId = userObjectId;
        _tenantId = tenantId;
        _authority = authority;
        _isHomeTenant = isHomeTenant;
        _claims = claims;
    }
    
    return self;
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone
{
    MSALTenantProfile *tenantProfile = [[self.class allocWithZone:zone] init];
    tenantProfile->_userObjectId = [_userObjectId copyWithZone:zone];
    tenantProfile->_tenantId = [_tenantId copyWithZone:zone];
    tenantProfile->_authority = [MSALAuthorityFactory authorityFromUrl:_authority.url context:nil error:nil];
    tenantProfile->_isHomeTenant = _isHomeTenant;
    tenantProfile->_claims = [[NSDictionary alloc] initWithDictionary:_claims copyItems:YES];
    return tenantProfile;
}

@end
