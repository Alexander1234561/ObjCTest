//
//  ThirdViewController.m
//  SkillTest
//
//  Created by Александр on 16.02.2021.
//  Copyright © 2021 Александр. All rights reserved.
//

#import "ThirdViewController.h"
#import "ApiFile.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    self.image.image = [UIImage imageWithData:  self.data];
}

@end
