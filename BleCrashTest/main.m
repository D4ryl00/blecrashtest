//
//  main.m
//  BleCrashTest
//
//  Created by Rémi BARBERO on 11/02/2022.
//

#import <Foundation/Foundation.h>

#import "BleManager.h"

int main(int argc, char **argv) {
    BleManager *bleManager __unused = [[BleManager alloc] init];

    // run loop
    BOOL done = NO;

    do
    {
        SInt32    result = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 10, YES);

        if ((result == kCFRunLoopRunStopped) || (result == kCFRunLoopRunFinished)) {
            done = YES;
        }
    }
    while (!done);

    NSLog(@"finished");
    return 0;
}
