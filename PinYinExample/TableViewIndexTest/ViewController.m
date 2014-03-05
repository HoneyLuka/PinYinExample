//
//  ViewController.m
//  TableViewIndexTest
//
//  Created by Shadow on 14-3-4.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "ViewController.h"
#import "NSString+PinYin.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

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
    self.title = @"Test";
    
    [self initDataSource];
}

- (void)initDataSource
{
    NSArray *array = @[@"如果", @"平时", @"跑开", @"((((", @"啦啦羊", @"   s呀才", @"的啊", @"飞吧", @"238237", @"***", @"***", @"***", @"***", @"***", @"***", @"***", @"***", @"***", @"   *#咳嗽", @"啊啊", @"都", @"a哈", @"    ba哈", @"1"];
    self.dataArray = [[array arrayWithPinYinFirstLetterFormat]mutableCopy];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dict = self.dataArray[section];
    NSMutableArray *array = dict[@"content"];
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    NSDictionary *dict = self.dataArray[indexPath.section];
    NSMutableArray *array = dict[@"content"];
    cell.textLabel.text = array[indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *dict = self.dataArray[section];
    NSString *title = dict[@"firstLetter"];
    return title;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *resultArray = [NSMutableArray array];
    for (NSDictionary *dict in self.dataArray) {
        NSString *title = dict[@"firstLetter"];
        [resultArray addObject:title];
    }
    return resultArray;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    //这里是为了指定索引index对应的是哪个section的，默认的话直接返回index就好。其他需要定制的就针对性处理
    
    //以下e.g.实现了将索引0对应到section 1里。其他的正常对应。
    
//    if (index == 0) {
//        return 1;
//    }
//    return index;
    
    return index;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
