//
//  ViewController.m
//  SkillTest
//
//  Created by Александр on 12.02.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "ApiFile.h"

@interface ViewController ()
@end


@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self getListTags];
    self.mytableview.dataSource = self;
    self.mytableview.delegate = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.arr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"segue1"]) {
        NSIndexPath *indexPath = [self.mytableview indexPathForSelectedRow];
        SecondViewController *sv = (SecondViewController *)segue.destinationViewController;
        sv.str = self.arr[indexPath.row];
    }
}

-(void)getListTags {
    TagDownloadBlock completionBlock = ^(NSMutableArray* array){
        self.arr = array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.mytableview reloadData];
        });
    };
    [APIClass getTags:completionBlock];
}

- (IBAction)unwindToTag:(UIStoryboardSegue *)unwindSegue{
}


@end


