// Copyright 2020-present 650 Industries. All rights reserved.

#import <expo-image/EXImageViewManager.h>
#import <expo-image/EXImageView.h>
#import <SDWebImageSVGKitPlugin/SDImageSVGKCoder.h>
#import <SDWebImage/SDImageCodersManager.h>

@implementation EXImageViewManager

RCT_EXPORT_MODULE(ExpoImage)

+ (void)initialize
{
  SDImageSVGKCoder *svgCoder = [SDImageSVGKCoder sharedCoder];
  if (![[SDImageCodersManager sharedManager].coders containsObject:svgCoder]) {
    [[SDImageCodersManager sharedManager] addCoder:svgCoder];
  }
}

RCT_EXPORT_VIEW_PROPERTY(source, NSDictionary)

RCT_EXPORT_VIEW_PROPERTY(onLoadStart, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onProgress, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onError, RCTDirectEventBlock)
RCT_EXPORT_VIEW_PROPERTY(onLoad, RCTDirectEventBlock)

- (UIView *)view
{
  return [[EXImageView alloc] init];
}

@end
