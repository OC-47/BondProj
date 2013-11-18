//
//  weightInputViewController.m
//  BondProject
//
//  Created by Miwa Oshiro on 2013/11/19.
//  Copyright (c) 2013年 Miwa Oshiro. All rights reserved.
//

#import "weightInputViewController.h"
#import "FMDatabase.h"


@interface weightInputViewController ()

@end

@implementation weightInputViewController

@synthesize weight;

sqlite3* db;

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

- (IBAction)weightSave:(id)sender {
    
    float weight_f = [self.weight.text floatValue];
    NSNumber *weight_num = [NSNumber numberWithFloat:weight_f];
    
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
        
        [db executeUpdate:@"insert into weight (weight,date) values (?,?);",weight_num,strDate];
        NSLog(@"%@",weight);
        
        NSLog(@"Error %@ - %d", [db lastErrorMessage], [db lastErrorCode]);
        [db close];
    }
}
@end
