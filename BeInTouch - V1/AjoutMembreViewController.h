//
//  AjoutMembreViewController.h
//  BeInTouch - V1
//
//  Created by SONIA IBARRA FLORES on 2016-04-19.
//  Copyright © 2016 collegeahuntsic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AjoutMembreViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

{
    NSMutableArray *myData;
}
@property (strong, nonatomic) IBOutlet UITableView *tv;

@end
