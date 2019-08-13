#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "OTPGenerator.h"
#import "IDZSwiftCommonCrypto.h"
#import "IDZSwiftCommonCrypto-umbrella.h"
#import "Pods-OTPGenerator-umbrella.h"

FOUNDATION_EXPORT double OTPGeneratorVersionNumber;
FOUNDATION_EXPORT const unsigned char OTPGeneratorVersionString[];

