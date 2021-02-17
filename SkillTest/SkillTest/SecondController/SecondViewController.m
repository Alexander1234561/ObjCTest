//
//  SecondViewController.m
//  SkillTest
//
//  Created by Александр on 16.02.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

#import "SecondViewController.h"
#import "CollectionViewCell.h"
#import "ThirdViewController.h"
#import "ApiFile.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getListPhotos];
    self.myCollection.dataSource = self;
    self.myCollection.delegate = self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"image" forIndexPath:indexPath];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
    cell.image.image = [UIImage imageWithData: [APIClass getPhotoFromURL:self.arr[indexPath.row]]];
    }];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}

-(void)getListPhotos {
    PhotosDownloadBlock completionBlock = ^(NSMutableArray* array){
        self.arr = array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myCollection reloadData];
        });
    };
    [APIClass getPhotos:self.str : completionBlock];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"segue2"]) {
        NSIndexPath *selectedIndexPath = [self.myCollection indexPathForCell:sender];
        ThirdViewController *sv = (ThirdViewController *)segue.destinationViewController;
        sv.str = self.arr[selectedIndexPath.row];
    }
}

- (IBAction)unwindToTag:(UIStoryboardSegue *)unwindSegue
{}

@end
