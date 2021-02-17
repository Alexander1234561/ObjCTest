//
//  ApiFile.m
//  SkillTest
//
//  Created by Александр on 16.02.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiFile.h"
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "SecondViewController.h"

@interface APIClass ()

@end

@implementation APIClass

//Статический метод для получения популярных тегов.
+(void) getTags:(TagDownloadBlock)completionBlock {

    NSString *urlString = @"https://www.flickr.com/services/rest/?method=flickr.tags.getHotList&api_key=455d07e4f46d04837a3ff8765124888d&period=day&count=10&format=json&nojsoncallback=1";
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableArray *myArray = [NSMutableArray array];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    NSLog(@"Finished fetching course");
    
    NSError *err;
    NSDictionary *courseJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
    
    if (err) {
        NSLog(@"Failed Serialize into JSON");
    }
    
    //Получение данных из JSON
    for (NSDictionary *courseDict in courseJSON[@"hottags"][@"tag"]) {
        [myArray addObject:courseDict[@"_content"]];
    }
        
    //Вызов completiton для обновления таблицы и получения массива тегов
    completionBlock(myArray);
        
}] resume];
}

//Статический метод для получения фотографий по тегу
+ (void) getPhotos:(NSString*) str : (PhotosDownloadBlock)completionBlock{
    
    NSString *urlString = [NSString stringWithFormat:@"https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=455d07e4f46d04837a3ff8765124888d&tags=%@&format=json&nojsoncallback=1", str];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableArray *myArray = [NSMutableArray array];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Finished fetching course");
        
        NSError *err;
        NSDictionary *courseJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if (err) {
            NSLog(@"Failed Serialize into JSON");
        }
        
        //Получение данных из JSON
        for (NSDictionary *courseDict in courseJSON[@"photos"][@"photo"]) {
            
            NSString *str = [NSString stringWithFormat:@"https://farm%@.staticflickr.com/%@/%@_%@.jpg", courseDict[@"farm"], courseDict[@"server"], courseDict[@"id"], courseDict[@"secret"]];
            [myArray addObject:str];
        }
        
        //Вызов completiton для обновления таблицы и получения массива адресов фотографий
        completionBlock(myArray);
        
    }] resume];
}

//Получение фотографий по адресу
+(NSData*) getPhotoFromURL:(NSString*) str {
    return [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: str]];
}

@end

