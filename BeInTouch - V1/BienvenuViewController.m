//
//  BienvenuViewController.m
//  BeInTouch - V1
//
//  Created by Aliou GUEYE on 14.04.16.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import "BienvenuViewController.h"

@interface BienvenuViewController ()

@end

@implementation BienvenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)returnFromInfos:(UIStoryboardSegue*) segue{
    
}

-(IBAction)returnFromAjouterAmis:(UIStoryboardSegue*) segue{
    
}

-(IBAction)returnFromVoirAmis:(UIStoryboardSegue*) segue{
    
}

-(IBAction)returnFromChatRoom:(UIStoryboardSegue*) segue{
    
}


@end
