//
//  CalorieInputViewController.m
//  BondProject
//
//  Created by Miwa Oshiro on 2013/11/19.
//  Copyright (c) 2013年 Miwa Oshiro. All rights reserved.
//

#import "CalorieInputViewController.h"
#import "FMDatabase.h"

sqlite3* db;

@interface CalorieInputViewController ()

@end

@implementation CalorieInputViewController

@synthesize calTitle;
@synthesize calCal;
@synthesize calNum;

@synthesize exeTitle;
@synthesize exeCal;
@synthesize exeNum;


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

    
    
    
}


- (IBAction)calSave:(id)sender {
    
    
    NSString *calorie_title = self.calTitle.text;
    
    float calorie_cal_f = [self.calCal.text floatValue];
    NSNumber *calorie_cal = [NSNumber numberWithFloat:calorie_cal_f];
    
    float calorie_num_f = [self.calNum.text floatValue];
    NSNumber *calorie_num = [NSNumber numberWithFloat:calorie_num_f];
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir   = [paths objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    
    
    
    if ([fileManager fileExistsAtPath:[dir stringByAppendingPathComponent:@"diet.db"]])
    {
        FMDatabase *db= [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"diet.db"]];
        
        [db open]; //DB開く
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat  = @"yyyy-MM-dd HH:mm:ss";
        NSString *strDate = [df stringFromDate:[NSDate date]];
        
        [db executeUpdate:@"insert into calorie_data (calorie_title,calorie_cal,calorie_num,date) values (?,?,?,?);",calorie_title,calorie_cal,calorie_num,strDate];
        
        NSLog(@"Error %@ - %d", [db lastErrorMessage], [db lastErrorCode]);
        [db close];
    }

}
- (IBAction)exeSave:(id)sender {
    
    
    NSString *exercise_title = self.exeTitle.text;
    
    float exercise_cal_f = [self.exeCal.text floatValue];
    NSNumber *exercise_cal = [NSNumber numberWithFloat:exercise_cal_f];
    
    float exercise_num_f = [self.exeNum.text floatValue];
    NSNumber *exercise_num = [NSNumber numberWithFloat:exercise_num_f];
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir   = [paths objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    
    
    
    if ([fileManager fileExistsAtPath:[dir stringByAppendingPathComponent:@"diet.db"]])
    {
        FMDatabase *db= [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"diet.db"]];
        
        [db open]; //DB開く
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat  = @"yyyy-MM-dd HH:mm:ss";
        NSString *strDate = [df stringFromDate:[NSDate date]];
        
        [db executeUpdate:@"insert into exercise_data (exercise_title,exercise_cal,exercise_num,date) values (?,?,?,?);",exercise_title,exercise_cal,exercise_num,strDate];
        
        NSLog(@"Error %@ - %d", [db lastErrorMessage], [db lastErrorCode]);
        [db close];
    }
    

}
@end
