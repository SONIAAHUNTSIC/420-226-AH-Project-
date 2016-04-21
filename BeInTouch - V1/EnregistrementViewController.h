//
//  EnregistrementViewController.h
//  BeInTouch
//
//  Created by Aliou GUEYE on 10.04.16.
//  Copyright (c) 2016 Luno&&Co.inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EnregistrementViewController : UIViewController <UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIDatePicker *datePicker;
    UIPickerView *picker;
    NSArray *dataArray;
    UIImagePickerController *pickerPhoto;
    UIImagePickerController *pickerPhoto2;
    UIImage *image;
    IBOutlet UIImageView *imageView;
}
@property (strong, nonatomic) IBOutlet UITextField *textPrenom;
@property (strong, nonatomic) IBOutlet UITextField *textNom;
@property (strong, nonatomic) IBOutlet UITextField *textSexe;
@property (strong, nonatomic) IBOutlet UITextField *textDateNaissance;
@property (strong, nonatomic) IBOutlet UITextField *textCourriel;
@property (strong, nonatomic) IBOutlet UITextField *textTelephone;


- (IBAction)PrendreUnePhoto;
- (IBAction)ChoisirUnePhoto;


@property (nonatomic) NSString *idUtilisateur;
@property (nonatomic) NSString *idEnregistre;



@end
