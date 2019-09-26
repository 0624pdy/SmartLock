//
//  WLBluetoothManager.h
//  SmartLock
//
//  Created by MG_PDY on 2019/9/27.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreBluetooth/CoreBluetooth.h>

@class WLBluetoothManager;
typedef void(^WLBluetoothBlock_Peripheral)(WLBluetoothManager *theManager, CBPeripheral *peripheral);

@interface WLBluetoothManager : NSObject

+ (instancetype)sharedManager;

- (void)startScanning;

@property (nonatomic,strong) CBCentralManager *centralManager;
@property (nonatomic,copy) WLBluetoothBlock_Peripheral block_didDiscoverPeripheral;
@property (nonatomic,copy) WLBluetoothBlock_Peripheral block_didConnectPeripheral;
@property (nonatomic,copy) WLBluetoothBlock_Peripheral block_didDisconnectPeripheral;

@end
