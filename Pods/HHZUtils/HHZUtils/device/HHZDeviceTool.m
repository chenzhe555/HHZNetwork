//
//  HHZDeviceTool.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZDeviceTool.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#include <mach/mach.h>

//获取IP
#import <arpa/inet.h>
#import <ifaddrs.h>

#pragma mark 越狱相关，具体测试的时候再删减
//#include <sys/types.h>
//#include <sys/sysctl.h>
//#include <stdio.h>
//#include <stdlib.h>
//#include <string.h>
//#include <unistd.h>
//#include <sys/ioctl.h>
//#include <sys/socket.h>
//#include <netinet/in.h>
//#include <netdb.h>
//#include <arpa/inet.h>
//#include <sys/sockio.h>
//#include <net/if.h>
//#include <errno.h>
//#include <net/if_dl.h>
//#import "IPAddress.h"

@implementation HHZDeviceTool
+(NSString *)getCurrentVersion
{
    return  [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"];
}

+(NSString *)getPhoneType
{
    static NSString * phoneType;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        size_t size;
        sysctlbyname("hw.machine", NULL, &size, NULL, 0);
        char *machine = (char*)malloc(size);
        sysctlbyname("hw.machine", machine, &size, NULL, 0);
        phoneType= [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    });
    
    return phoneType;
}


+(NSString *)getDeviceSystemVersion
{
    NSString * str = [[UIDevice currentDevice] systemVersion];
    return str;
}

+(NSString *)getPhoneUUID
{
    CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
    NSString * result = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
    CFRelease(uuidRef);
    return result;
}


+(BOOL)isPad
{
    static BOOL isPad;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    });
    return isPad;
}

+(BOOL)isSimulator
{
#if TARGET_OS_SIMULATOR
    return YES;
#else
    return NO;
#endif
}

#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED
+(BOOL)canMakePhoneCalls
{
    __block BOOL canCall;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        canCall = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel://"]];
    });
    return canCall;
}
#endif


+(NSString *)IPAddressWithWifi
{
    return [self ipAddressWithIfaName:@"en0"];
}

+(NSString *)IPAddressWithCell
{
    return [self ipAddressWithIfaName:@"pdp_ip0"];
}

+(NSString *)ipAddressWithIfaName:(NSString *)name {
    if (name.length == 0) return nil;
    NSString *address = nil;
    struct ifaddrs *addrs = NULL;
    if (getifaddrs(&addrs) == 0) {
        struct ifaddrs *addr = addrs;
        while (addr) {
            if ([[NSString stringWithUTF8String:addr->ifa_name] isEqualToString:name]) {
                sa_family_t family = addr->ifa_addr->sa_family;
                switch (family) {
                    case AF_INET: { // IPv4
                        char str[INET_ADDRSTRLEN] = {0};
                        inet_ntop(family, &(((struct sockaddr_in *)addr->ifa_addr)->sin_addr), str, sizeof(str));
                        if (strlen(str) > 0) {
                            address = [NSString stringWithUTF8String:str];
                        }
                    } break;
                        
                    case AF_INET6: { // IPv6
                        char str[INET6_ADDRSTRLEN] = {0};
                        inet_ntop(family, &(((struct sockaddr_in6 *)addr->ifa_addr)->sin6_addr), str, sizeof(str));
                        if (strlen(str) > 0) {
                            address = [NSString stringWithUTF8String:str];
                        }
                    }
                        
                    default: break;
                }
                if (address) break;
            }
            addr = addr->ifa_next;
        }
    }
    freeifaddrs(addrs);
    return address;
}

//#pragma mark 越狱相关
//
//static const char * __jb_app = NULL;
//
//+(BOOL)isPrisonBreak
//{
//    static const char * __jb_apps[] =
//    {
//        "/Application/Cydia.app",
//        "/Application/limera1n.app",
//        "/Application/greenpois0n.app",
//        "/Application/blackra1n.app",
//        "/Application/blacksn0w.app",
//        "/Application/redsn0w.app",
//        NULL
//    };
//
//    __jb_app = NULL;
//
//    // method 1
//    for ( int i = 0; __jb_apps[i]; ++i )
//    {
//        if ( [[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:__jb_apps[i]]] )
//        {
//            __jb_app = __jb_apps[i];
//            return YES;
//        }
//    }
//
//    // method 2
//    if ( [[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"] )
//    {
//        return YES;
//    }
//
//    // method 3
//    if ( 0 == system("ls") )
//    {
//        return YES;
//    }
//
//    return NO;
//}
//
//+(NSString *)prisonBreakVersion
//{
//    if ( __jb_app )
//    {
//        return [NSString stringWithUTF8String:__jb_app];
//    }
//    else
//    {
//        return @"";
//    }
//}
//
//+(NSString *)localIPAddress
//{
//    InitAddresses();
//
//    GetIPAddresses();
//
//    GetHWAddresses();
//
//    return [NSString stringWithFormat:@"%s", ip_names[1]];
//}



#pragma mark 磁盘 内存 CPU信息
+(int64_t)getDiskSpace
{
    NSError * error = nil;
    NSDictionary * dic = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) return -1;
    
    int64_t space =  [dic[NSFileSystemSize] longLongValue];
    if (space < 0) space = -1;
    return space;
}

+(int64_t)getDiskFreeSpace
{
    NSError * error = nil;
    NSDictionary * dic = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) return -1;
    
    int64_t space =  [dic[NSFileSystemFreeSize] longLongValue];
    if (space < 0) space = -1;
    return space;
}

+(int64_t)getDiskUsedSpace
{
    int64_t total = [self getDiskSpace];
    int64_t free = [self getDiskFreeSpace];
    if (total < 0 || free < 0) return -1;
    int64_t used = total - free;
    if (used < 0) used = -1;
    return used;
}



+(int64_t)getTotalMemory
{
    int64_t memory = [[NSProcessInfo processInfo] physicalMemory];
    if (memory < -1) memory = -1;
    return memory;
}

+(int64_t)getUsedMemory
{
    return [self getMemery:1];
}

+(int64_t)getFreeMemory
{
    return [self getMemery:2];
}

+(int64_t)getActiveMemory
{
    return [self getMemery:3];
}

+(int64_t)getInactiveMemory
{
    return [self getMemery:4];
    
}

+(int64_t)getWiredMemory
{
    return [self getMemery:5];
}

+(int64_t)getPurgableMemory
{
    return [self getMemery:6];
}

+(int64_t)getMemery:(int)type
{
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t page_size;
    vm_statistics_data_t vm_stat;
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    if (kern != KERN_SUCCESS) return -1;
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    if (kern != KERN_SUCCESS) return -1;
    
    switch (type) {
        case 1:
        {
            return page_size * (vm_stat.active_count + vm_stat.inactive_count + vm_stat.wire_count);
        }
            break;
        case 2:
        {
            return vm_stat.free_count * page_size;
        }
            break;
        case 3:
        {
            return vm_stat.active_count * page_size;
        }
            break;
        case 4:
        {
            return vm_stat.inactive_count * page_size;
        }
            break;
        case 5:
        {
            return vm_stat.wire_count * page_size;
        }
            break;
        case 6:
        {
            return vm_stat.purgeable_count * page_size;
        }
            break;
        default:
            break;
    }
    return -1;
}


+(NSUInteger)getCPUCount
{
    return [NSProcessInfo processInfo].activeProcessorCount;
}

+(CGFloat)getCPUUsage
{
    CGFloat cpuUsage = 0;
    NSArray * cpus = [self cpuUsagePerProcessor];
    if (cpus.count == 0) return -1;
    for (NSNumber * num in cpus) {
        cpuUsage += num.floatValue;
    }
    return cpuUsage;
}

+(NSArray *)cpuUsagePerProcessor {
    processor_info_array_t _cpuInfo, _prevCPUInfo = nil;
    mach_msg_type_number_t _numCPUInfo, _numPrevCPUInfo = 0;
    unsigned _numCPUs;
    NSLock *_cpuUsageLock;
    
    int _mib[2U] = { CTL_HW, HW_NCPU };
    size_t _sizeOfNumCPUs = sizeof(_numCPUs);
    int _status = sysctl(_mib, 2U, &_numCPUs, &_sizeOfNumCPUs, NULL, 0U);
    if (_status)
        _numCPUs = 1;
    
    _cpuUsageLock = [[NSLock alloc] init];
    
    natural_t _numCPUsU = 0U;
    kern_return_t err = host_processor_info(mach_host_self(), PROCESSOR_CPU_LOAD_INFO, &_numCPUsU, &_cpuInfo, &_numCPUInfo);
    if (err == KERN_SUCCESS) {
        [_cpuUsageLock lock];
        
        NSMutableArray *cpus = [NSMutableArray new];
        for (unsigned i = 0U; i < _numCPUs; ++i) {
            Float32 _inUse, _total;
            if (_prevCPUInfo) {
                _inUse = (
                          (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER])
                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM])
                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE])
                          );
                _total = _inUse + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE]);
            } else {
                _inUse = _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE];
                _total = _inUse + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE];
            }
            [cpus addObject:@(_inUse / _total)];
        }
        
        [_cpuUsageLock unlock];
        if (_prevCPUInfo) {
            size_t prevCpuInfoSize = sizeof(integer_t) * _numPrevCPUInfo;
            vm_deallocate(mach_task_self(), (vm_address_t)_prevCPUInfo, prevCpuInfoSize);
        }
        return cpus;
    } else {
        return nil;
    }
}

@end
