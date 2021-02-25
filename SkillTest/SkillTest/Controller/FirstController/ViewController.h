//
//  ViewController.h
//  SkillTest
//
//  Created by Александр on 12.02.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiFile.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *mytableview;
@property NSMutableArray *arr;
typedef void (^TagDownloadBlock) (NSMutableArray* arr);
@end
