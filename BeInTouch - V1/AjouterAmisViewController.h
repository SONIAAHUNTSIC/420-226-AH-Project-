//
//  AjouterAmisViewController.h
//  BeInTouch - V1
//
//  Created by Aliou GUEYE on 14.04.16.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AjouterAmisViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *txtId;
@property (nonatomic) NSString *idUtilisateur;
- (IBAction)btnAjouter:(id)sender;

@end
