//
//  ApiFile.h
//  SkillTest
//
//  Created by Александр on 17.02.2021.
//  Copyright © 2021 Александр. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface APIClass : NSObject

typedef void (^TagDownloadBlock) (NSMutableArray* arr);
typedef void (^PhotosDownloadBlock) (NSMutableArray* arr);
+(void)getTags:(TagDownloadBlock)completionBlock;
+(void)getPhotos: (NSString*)str : (PhotosDownloadBlock)completionBlock;
+(NSData *)getPhotoFromURL: (NSString*)str;

@end
