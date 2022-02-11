//
//  BleManager.h
//  BleCrashTest
//
//  Created by Rémi BARBERO on 11/02/2022.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

NS_ASSUME_NONNULL_BEGIN

@interface BleManager : NSObject <CBCentralManagerDelegate>

@property (nonatomic, strong, nonnull) CBCentralManager* cManager;

@end

NS_ASSUME_NONNULL_END
