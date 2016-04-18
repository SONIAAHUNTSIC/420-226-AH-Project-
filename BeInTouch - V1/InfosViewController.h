//
//  InfosViewController.h
//  BeInTouch - V1
//
//  Created by Aliou GUEYE on 14.04.16.
//  Copyright (c) 2016 collegeahuntsic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfosViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblIdUtilisateur;
@property (strong, nonatomic) IBOutlet UITextField *textPrenom;
@property (strong, nonatomic) IBOutlet UITextField *textNom;
@property (strong, nonatomic) IBOutlet UITextField *textSexe;
@property (strong, nonatomic) IBOutlet UITextField *textDateNaissance;
@property (strong, nonatomic) IBOutlet UITextField *textCourriel;
@property (strong, nonatomic) IBOutlet UITextField *textTelephone;

@end
