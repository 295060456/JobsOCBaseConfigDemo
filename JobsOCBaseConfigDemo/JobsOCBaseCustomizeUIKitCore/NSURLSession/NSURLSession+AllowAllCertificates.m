//
//  NSURLSession+AllowAllCertificates.m
//  FM
//
//  Created by Admin on 25/11/2024.
//

#import "NSURLSession+AllowAllCertificates.h"

@implementation NSURLSession (AllowAllCertificates)

+(BOOL)setAllowsAnyHTTPSCertificateForHost:(NSString *)host{
    return YES;
}

@end
