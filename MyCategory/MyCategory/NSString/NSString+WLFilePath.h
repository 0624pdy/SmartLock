//
//  NSString+WLFilePath.h
//  MyCategory
//
//  Created by MG_PDY on 2019/9/9.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 
 苹果官方文档:
 https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/FileSystemOverview/FileSystemOverview.html
 在iOS系统的安全机制，每个APP都有自己的文件目录，且只能访问自己的文件目录。该机制被称为沙盒机制。
 
 3B90C2BE-0FEC-4103-99E2-EAC703662B8A/Documents
                                     /Library/Caches
                                             /Preferences
                                     /tmp
 
 Printing description of homePath:
 /Users/a/Library/Developer/CoreSimulator/Devices/D1E5E757-72C8-4C68-B20E-40A24C83A1F2/data/Containers/Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A
 Printing description of documentPath:
 /Users/a/Library/Developer/CoreSimulator/Devices/D1E5E757-72C8-4C68-B20E-40A24C83A1F2/data/Containers/Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A/Documents
 Printing description of libraryPath:
 /Users/a/Library/Developer/CoreSimulator/Devices/D1E5E757-72C8-4C68-B20E-40A24C83A1F2/data/Containers/Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A/Library
 Printing description of cachesPath:
 /Users/a/Library/Developer/CoreSimulator/Devices/D1E5E757-72C8-4C68-B20E-40A24C83A1F2/data/Containers/Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A/Library/Caches
 Printing description of applicationSupportPath:
 /Users/a/Library/Developer/CoreSimulator/Devices/D1E5E757-72C8-4C68-B20E-40A24C83A1F2/data/Containers/Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A/Library/Application Support
 Printing description of preferencePath:
 /Users/a/Library/Developer/CoreSimulator/Devices/D1E5E757-72C8-4C68-B20E-40A24C83A1F2/data/Containers/Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A/Library/PreferencePanes
 Printing description of temPath:
 /Users/a/Library/Developer/CoreSimulator/Devices/D1E5E757-72C8-4C68-B20E-40A24C83A1F2/data/Containers/Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A/tmp/
 
 */


@interface NSString (WLFilePath)

/**
 *  沙盒根目录
 *
 *  /Users/.../Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A
 */
@property (nonatomic,class,readonly) NSString *homeDirectory;

/**
 *  document目录
 *
 *  保存用户创建的文档文件的目录，用户可以通过文件分享分享该目录下的文件。在iTunes和iCloud备份时会备份该目录。建议保存你希望用户看得见的文件。
 *
 *  /Users/.../Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A/Documents
 */
@property (nonatomic,class,readonly) NSString *documentDirectory;

/**
 *  library目录
 *
 *  苹果不建议在该目录下保存任何用户相关数据，而是保存APP运行需要的修改数据，当然用户可以根据自己的实际需要进行保存。
    该目录下默认有两个子目录，为Caches、Preferences。根据文档还有另外两个系统预存放文件的子目录，分别是Application Support、Frameworks。用户还可以自己根据需要创建相应的目录。该目录下除Caches目录外，
    在iTunes和iCloud备份时会备份除Caches目录外的其他所有目录。
 *
 *  /Users/.../Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A/Library
 */
@property (nonatomic,class,readonly) NSString *libraryDirectory;

/**
 *  caches目录
 *
 *  建议保存数据缓存使用。在用户的磁盘空间已经使用完毕时有可能删除该目录下的文件，在APP使用期间不会删除，APP没有运行时系统有可能进行删除。需要持久化的数据建议不要保存在该目录下，以免系统强制删除。
 *
 *  /Users/.../Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A/Library/Caches
 */
@property (nonatomic,class,readonly) NSString *cachesDirectory;

/**
 *  application support目录
 *
 *  建议用来存储除用户数据相关以外的所有文件，如游戏的新关卡。在iTunes和iCloud备份时会备份该目录。
 *
 *  /Users/.../Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A/Library/Application Support
 */
@property (nonatomic,class,readonly) NSString *applicationSupportDirectory;

/**
 *  preference目录
 *
 *  用户偏好存储目录，在使用NSUserDefaults或者CFPreferences接口保存的数据保存在该目录下，编程人员不需要对该目录进行管理。在iTunes和iCloud备份时会备份该目录。
 *
 *  /Users/.../Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A/Library/PreferencePanes
 */
@property (nonatomic,class,readonly) NSString *preferenceDirectory;

/**
 *  temporary目录
 *
 *  苹果建议该目录用来保存临时使用的数据，编程人员应该在数据长时间内不使用时主动删除该目录下的文件，在APP没有运行期间，系统可能删除该目录下的文件。在iTunes和iCloud备份时不会备份该目录。
 *
 *  /Users/.../Data/Application/3B90C2BE-0FEC-4103-99E2-EAC703662B8A/tmp/
 */
@property (nonatomic,class,readonly) NSString *temporaryDirectory;

+ (NSString *)wl_directoryWithType:(NSSearchPathDirectory)directory;

+ (NSString *)wl_documentPathWithComponent:(NSString *)component;

@end
