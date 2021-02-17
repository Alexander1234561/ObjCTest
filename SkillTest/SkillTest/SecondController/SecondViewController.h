//
//  SecondViewController.h
//  SkillTest
//
//  Created by Александр on 16.02.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollection;
@property NSMutableArray *arr;
@property NSString *str;
typedef void (^PhotosDownloadBlock) (NSMutableArray* arr);
@end
