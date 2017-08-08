//
//  HHZFileHashTool.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/25.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

/*
 来自 YYKit的 FileHash类
 */

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// File hash algorithm type
typedef NS_OPTIONS (NSUInteger, HHZFileHashType) {
    HHZFileHashTypeMD2     = 1 << 0, ///< MD2 hash
    HHZFileHashTypeMD4     = 1 << 1, ///< MD4 hash
    HHZFileHashTypeMD5     = 1 << 2, ///< MD5 hash
    HHZFileHashTypeSHA1    = 1 << 3, ///< SHA1 hash
    HHZFileHashTypeSHA224  = 1 << 4, ///< SHA224 hash
    HHZFileHashTypeSHA256  = 1 << 5, ///< SHA256 hash
    HHZFileHashTypeSHA384  = 1 << 6, ///< SHA384 hash
    HHZFileHashTypeSHA512  = 1 << 7, ///< SHA512 hash
};

/**
 Utility for computing hashes of file with high performance and low memory usage.
 See `HHZFileHashType` for all supported hash (checksum) type.
 
 Sample Code:
 
 HHZFileHashTool *hash = [HHZFileHashTool hashForFile:@"/tmp/Xcode6.dmg" types:HHZFileHashTypeMD5 | HHZFileHashTypeSHA1];
 NSLog(@"md5:%@ sha1:%@", hash.md5String, hash.sha1String);
 
 */

@interface HHZFileHashTool : NSObject
/**
 *  获得FileHashTool对象
 *
 *  @param filePath 文件地址
 *  @param types    Hash类型
 *
 *  @return
 */
+(nullable HHZFileHashTool *)hashForFile:(NSString *)filePath types:(HHZFileHashType)types;

/**
 *  获得FileHashTool对象
 *
 *  @param filePath 文件地址
 *  @param types    Hash类型
 *  @param block    回调
 *
 *  @return 
 */
+(nullable HHZFileHashTool *)hashForFile:(NSString *)filePath types:(HHZFileHashType)types usingBlock:(nullable void (^)(UInt64 totalSize,UInt64 processedSize, BOOL *stop))block;

@property (nonatomic, readonly) HHZFileHashType types; ///< hash type

@property (nullable, nonatomic, strong, readonly) NSString *md2String; ///< md2 hash string in lowercase
@property (nullable, nonatomic, strong, readonly) NSString *md4String; ///< md4 hash string in lowercase
@property (nullable, nonatomic, strong, readonly) NSString *md5String; ///< md5 hash string in lowercase
@property (nullable, nonatomic, strong, readonly) NSString *sha1String; ///< sha1 hash string in lowercase
@property (nullable, nonatomic, strong, readonly) NSString *sha224String; ///< sha224 hash string in lowercase
@property (nullable, nonatomic, strong, readonly) NSString *sha256String; ///< sha256 hash string in lowercase
@property (nullable, nonatomic, strong, readonly) NSString *sha384String; ///< sha384 hash string in lowercase
@property (nullable, nonatomic, strong, readonly) NSString *sha512String; ///< sha512 hash string in lowercase

@property (nullable, nonatomic, strong, readonly) NSData *md2Data; ///< md2 hash
@property (nullable, nonatomic, strong, readonly) NSData *md4Data; ///< md4 hash
@property (nullable, nonatomic, strong, readonly) NSData *md5Data; ///< md5 hash
@property (nullable, nonatomic, strong, readonly) NSData *sha1Data; ///< sha1 hash
@property (nullable, nonatomic, strong, readonly) NSData *sha224Data; ///< sha224 hash
@property (nullable, nonatomic, strong, readonly) NSData *sha256Data; ///< sha256 hash
@property (nullable, nonatomic, strong, readonly) NSData *sha384Data; ///< sha384 hash
@property (nullable, nonatomic, strong, readonly) NSData *sha512Data; ///< sha512 hash

@end

NS_ASSUME_NONNULL_END
