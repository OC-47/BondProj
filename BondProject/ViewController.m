//
//  ViewController.m
//  BondProject
//
//  Created by Miwa Oshiro on 2013/11/19.
//  Copyright (c) 2013年 Miwa Oshiro. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"

sqlite3* db;


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //DBファイルのパス
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString *dir   = [paths objectAtIndex:0];
    
    //DBファイルがあるかどうか確認
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    
    if (![fileManager fileExistsAtPath:[dir stringByAppendingPathComponent:@"diet.db"]])
    {
        //なければ新規作成
        FMDatabase *db= [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"diet.db"]];
        
        NSString *createWeightDataTable = @"CREATE TABLE weight (id INTEGER PRIMARY KEY AUTOINCREMENT,weight TEXT,date TEXT);";
        NSString *createCalorieDataTable = @"CREATE TABLE calorie_data (id INTEGER PRIMARY KEY AUTOINCREMENT,calorie_title TEXT,calorie_cal INTEGER,calorie_num INTEGER,date TEXT);";
        NSString *createExerciseDataTable = @"CREATE TABLE exercise_data (id INTEGER PRIMARY KEY AUTOINCREMENT,exercise_title TEXT,exercise_cal INTEGER,exercise_num INTEGER,date TEXT);";
        
        [db open];
        [db executeUpdate:createWeightDataTable];
        [db executeUpdate:createCalorieDataTable];
        [db executeUpdate:createExerciseDataTable];
        [db close];
    }
}

@end
