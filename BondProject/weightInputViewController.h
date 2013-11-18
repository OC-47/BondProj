//
//  weightInputViewController.h
//  BondProject
//
//  Created by Miwa Oshiro on 2013/11/19.
//  Copyright (c) 2013年 Miwa Oshiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface weightInputViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *weight;

- (IBAction)weightSave:(id)sender;

@end
