//
//  Reachability.h
//  MelonBaseModel
//
//  Created by Tomasz Popis on 4/8/2020.
//  Copyright © 2020 Melon-IT. All rights reserved.
//

#ifndef Reachability_h
#define Reachability_h

#import <Foundation/Foundation.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>

typedef enum : NSInteger {
  NotReachable = 0,
  ReachableViaWiFi,
  ReachableViaWWAN
} NetworkStatus;

#pragma mark IPv6 Support

extern NSString *kReachabilityChangedNotification;

@interface Reachability : NSObject

+ (instancetype)reachabilityWithHostName:(NSString *)hostName;
+ (instancetype)reachabilityWithAddress:(const struct sockaddr *)hostAddress;
+ (instancetype)reachabilityForInternetConnection;

#pragma mark reachabilityForLocalWiFi

- (BOOL)startNotifier;
- (void)stopNotifier;

- (NetworkStatus)currentReachabilityStatus;

- (BOOL)connectionRequired;

@end

#endif /* Reachability_h */
