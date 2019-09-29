//
//  WLBluetoothManager.m
//  SmartLock
//
//  Created by MG_PDY on 2019/9/27.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import "WLBluetoothManager.h"

@interface WLBluetoothManager () < CBCentralManagerDelegate >

@end

@implementation WLBluetoothManager

+ (instancetype)sharedManager {
    static WLBluetoothManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[WLBluetoothManager alloc] init];
        [manager defaultSetup];
    });
    return manager;
}
- (void)defaultSetup {
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:NULL];
//    if (manager.authorization == CBManagerAuthorizationNotDetermined) {
//            [manager scanForPeripheralsWithServices:@[] options:nil];
//        } else if (manager.authorization == CBManagerAuthorizationAllowedAlways) {
//            NSLog(@"蓝牙可用");
//        } else {
//            NSLog(@"蓝牙不可用");
//            [UIAlertController showAlertInVC:self
//                                       title:@"title"
//                                     message:@"message"
//                                      cancel:@"取消"
//                                      others:nil
//                                      action:^(UIAlertController *theVC, NSInteger actionIndex, NSString *actionTitle)
//            {
//
//            }];
//        }
}




#pragma mark -

- (void)startScan {
    [self.centralManager scanForPeripheralsWithServices:nil options:nil];
}
- (void)stopScan {
    [self.centralManager stopScan];
}
- (void)currentState:(WLBluetoothBlock_State)block {
    _block_stateChanged = block;
    
    [self callbackState];
}
- (void)callbackState {
    if (_block_stateChanged) {
        if (@available(iOS 13.0, *)) {
            CBManagerState state = self.centralManager.state;
            _block_stateChanged(self, (state == CBManagerStatePoweredOn));
        } else if (@available(iOS 10.0, *)) {
            CBManagerState state = self.centralManager.state;
            _block_stateChanged(self, (state == CBCentralManagerStatePoweredOn));
        } else {
            
        }
    }
}




#pragma mark - CBCentralManagerDelegate

/*!
*  @method centralManagerDidUpdateState:
*
*  @param central  The central manager whose state has changed.
*
*  @discussion     Invoked whenever the central manager's state has been updated. Commands should only be issued when the state is
*                  <code>CBCentralManagerStatePoweredOn</code>. A state below <code>CBCentralManagerStatePoweredOn</code>
*                  implies that scanning has stopped and any connected peripherals have been disconnected. If the state moves below
*                  <code>CBCentralManagerStatePoweredOff</code>, all <code>CBPeripheral</code> objects obtained from this central
*                  manager become invalid and must be retrieved or discovered again.
*
*  @see            state
*
*/
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    switch (central.state) {
        case CBManagerStateUnknown:
            NSLog(@">>>初始的时候是未知的（刚刚创建的时候）");
            break;
        case CBManagerStateResetting:
            NSLog(@">>>正在重置状态");
            break;
        case CBManagerStateUnsupported:
            NSLog(@">>>设备不支持的状态");
            break;
        case CBManagerStateUnauthorized:
            NSLog(@">>>设备未授权状态");
            break;
        case CBManagerStatePoweredOff:
            NSLog(@">>>设备关闭状态");
            break;
        case CBManagerStatePoweredOn: {
            NSLog(@">>>设备开启状态 -- 可用状态");
            
            //扫描外设
            [self startScan];
        }
            break;
        default:
            break;
    }
    [self callbackState];
}

/*!
*  @method centralManager:willRestoreState:
*
*  @param central      The central manager providing this information.
*  @param dict            A dictionary containing information about <i>central</i> that was preserved by the system at the time the app was terminated.
*
*  @discussion            For apps that opt-in to state preservation and restoration, this is the first method invoked when your app is relaunched into
*                        the background to complete some Bluetooth-related task. Use this method to synchronize your app's state with the state of the
*                        Bluetooth system.
*
*  @seealso            CBCentralManagerRestoredStatePeripheralsKey;
*  @seealso            CBCentralManagerRestoredStateScanServicesKey;
*  @seealso            CBCentralManagerRestoredStateScanOptionsKey;
*
*/
- (void)centralManager:(CBCentralManager *)central willRestoreState:(NSDictionary<NSString *, id> *)dict {
    
}

/*!
 *  @method centralManager:didDiscoverPeripheral:advertisementData:RSSI:
 *
 *  @param central              The central manager providing this update.
 *  @param peripheral           A <code>CBPeripheral</code> object.
 *  @param advertisementData    A dictionary containing any advertisement and scan response data.
 *  @param RSSI                 The current RSSI of <i>peripheral</i>, in dBm. A value of <code>127</code> is reserved and indicates the RSSI
 *                                was not available.
 *
 *  @discussion                 This method is invoked while scanning, upon the discovery of <i>peripheral</i> by <i>central</i>. A discovered peripheral must
 *                              be retained in order to use it; otherwise, it is assumed to not be of interest and will be cleaned up by the central manager. For
 *                              a list of <i>advertisementData</i> keys, see {@link CBAdvertisementDataLocalNameKey} and other similar constants.
 *
 *  @seealso                    CBAdvertisementData.h
 *
 */
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *, id> *)advertisementData RSSI:(NSNumber *)RSSI {
    NSLog(@"发现外设：%@", peripheral);
    
    if (_block_didDiscoverPeripheral) {
        _block_didDiscoverPeripheral(self, peripheral);
    }
    
    [central stopScan];
}

/*!
 *  @method centralManager:didConnectPeripheral:
 *
 *  @param central      The central manager providing this information.
 *  @param peripheral   The <code>CBPeripheral</code> that has connected.
 *
 *  @discussion         This method is invoked when a connection initiated by {@link connectPeripheral:options:} has succeeded.
 *
 */
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    if (_block_didConnectPeripheral) {
        _block_didConnectPeripheral(self, peripheral);
    }
}

/*!
 *  @method centralManager:didFailToConnectPeripheral:error:
 *
 *  @param central      The central manager providing this information.
 *  @param peripheral   The <code>CBPeripheral</code> that has failed to connect.
 *  @param error        The cause of the failure.
 *
 *  @discussion         This method is invoked when a connection initiated by {@link connectPeripheral:options:} has failed to complete. As connection attempts do not
 *                      timeout, the failure of a connection is atypical and usually indicative of a transient issue.
 *
 */
- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error {
    
}

/*!
 *  @method centralManager:didDisconnectPeripheral:error:
 *
 *  @param central      The central manager providing this information.
 *  @param peripheral   The <code>CBPeripheral</code> that has disconnected.
 *  @param error        If an error occurred, the cause of the failure.
 *
 *  @discussion         This method is invoked upon the disconnection of a peripheral that was connected by {@link connectPeripheral:options:}. If the disconnection
 *                      was not initiated by {@link cancelPeripheralConnection}, the cause will be detailed in the <i>error</i> parameter. Once this method has been
 *                      called, no more methods will be invoked on <i>peripheral</i>'s <code>CBPeripheralDelegate</code>.
 *
 */
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error {
    if (_block_didDisconnectPeripheral) {
        _block_didDisconnectPeripheral(self, peripheral);
    }
}

/*!
 *  @method centralManager:connectionEventDidOccur:forPeripheral:
 *
 *  @param central      The central manager providing this information.
 *  @param event        The <code>CBConnectionEvent</code> that has occurred.
 *  @param peripheral   The <code>CBPeripheral</code> that caused the event.
 *
 *  @discussion         This method is invoked upon the connection or disconnection of a peripheral that matches any of the options provided in {@link registerForConnectionEventsWithOptions:}.
 *
 */
- (void)centralManager:(CBCentralManager *)central connectionEventDidOccur:(CBConnectionEvent)event forPeripheral:(CBPeripheral *)peripheral NS_AVAILABLE_IOS(13_0) {
    
}

/*!
 *  @method centralManager:didUpdateANCSAuthorizationForPeripheral:
 *
 *  @param central      The central manager providing this information.
 *  @param peripheral   The <code>CBPeripheral</code> that caused the event.
 *
 *  @discussion         This method is invoked when the authorization status changes for a peripheral connected with {@link connectPeripheral:} option {@link CBConnectPeripheralOptionRequiresANCS}.
 *
 */
- (void)centralManager:(CBCentralManager *)central didUpdateANCSAuthorizationForPeripheral:(CBPeripheral *)peripheral NS_AVAILABLE_IOS(13_0) {
    
}

@end
