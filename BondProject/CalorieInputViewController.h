//
//  CalorieInputViewController.h
//  BondProject
//
//  Created by Miwa Oshiro on 2013/11/19.
//  Copyright (c) 2013年 Miwa Oshiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalorieInputViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *calTitle;
@property (strong, nonatomic) IBOutlet UITextField *calCal;
@property (strong, nonatomic) IBOutlet UITextField *calNum;

- (IBAction)calSave:(id)sender;


@property (strong, nonatomic) IBOutlet UITextField *exeTitle;
@property (strong, nonatomic) IBOutlet UITextField *exeCal;
@property (strong, nonatomic) IBOutlet UITextField *exeNum;

- (IBAction)exeSave:(id)sender;



@end
