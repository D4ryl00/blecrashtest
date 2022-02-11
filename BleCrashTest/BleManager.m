//
//  BleManager.m
//  BleCrashTest
//
//  Created by Rémi BARBERO on 11/02/2022.
//

#import "BleManager.h"

@implementation BleManager

- (instancetype __nonnull) init {
    self = [super init];

    if (self) {
        NSLog(@"Init CBCentralManager");
//        _cManager = [[CBCentralManager alloc]
//                     initWithDelegate:self
//                     queue:dispatch_queue_create("CentralManager", DISPATCH_QUEUE_SERIAL)
//                     options:@{CBCentralManagerOptionShowPowerAlertKey:[NSNumber numberWithBool:NO]}];

        // replace by this works
        _cManager = [[CBCentralManager alloc]
                     initWithDelegate:self
                     queue:nil
                     options:@{CBCentralManagerOptionShowPowerAlertKey:[NSNumber numberWithBool:NO]}];
    }

    return self;
}

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    NSLog(@"didConnectPeripheral called");
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    NSLog(@"didFailToConnectPeripheral called");
}

- (void)centralManager:(CBCentralManager *)central
 didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    NSLog(@"didDiscoverPeripheral called");
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    NSLog(@"didDisconnectPeripheral called");
}

- (void)centralManagerDidUpdateState:(nonnull CBCentralManager *)central {
    NSLog(@"centralManagerDidUpdateState called");
}

@end
