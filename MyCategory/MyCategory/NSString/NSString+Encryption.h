//
//  NSString+Encryption.h
//  MyCategory
//
//  Created by MG_PDY on 2019/4/8.
//  Copyright © 2019 彭端阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encryption)

/**
 *  MD5加密方法
 *  @brief 由于MD5加密是不可逆的,多用来进行验证
 */
- (NSString *)md5_string;

// 32位小写
- (NSString *)MD5_forLower32;
// 32位大写
- (NSString *)MD5_forUpper32;
// 16为大写
- (NSString *)MD5_forUpper16;
// 16位小写
- (NSString *)MD5_forLower16;


/**
 *  SHA1加密方式
 */
- (NSString *)sha1_string;


/**
 *  URLEncode
 */
- (NSString *)URLEncodedString;

/**
 *  URLDecode
 */
- (NSString *)URLDecodedString;




#pragma mark - Base64加密解密

/** 对一个字符串进行base64编码 */
- (NSString *)base64EncodedString;
/** 对一个字符串进行base解码 */
- (NSString *)base64DecodedString;

@end





@interface NSData (AESEncrypt)

//加密
- (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv;

//解密
- (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv;

@end
