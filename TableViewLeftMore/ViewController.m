//
//  ViewController.m
//  TableViewLeftMore
//
//  Created by 杨苓玉啊 on 17/5/27.
//  Copyright © 2017年 yanglingyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arr;
}
@property (nonatomic, strong)UITableView *demoTable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arr = [NSMutableArray arrayWithObjects:@"1",@"1",@"1",@"1",@"1",@"1", nil];
    [self.view addSubview:self.demoTable];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 115;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 14;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *arrbtn = [[NSMutableArray alloc] init];
    NSArray *title = @[@"delect",@"show",@"update"];
    NSArray *color = @[[UIColor redColor],[UIColor grayColor],[UIColor greenColor]];
    for (int a = 0; a <3; a++) {
        UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:title[a] handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            if (a == 0) {
                [self tableView:tableView changeSelectStyle:UITableViewLeftSelectStyleDelect indexPath:indexPath];
            }else if (a == 1)
            {
                [self tableView:tableView changeSelectStyle:UITableViewLeftSelectStyleShow indexPath:indexPath];
            }
            else if (a ==2)
            [self tableView:tableView changeSelectStyle:UITableViewLeftSelectStyleUpdate indexPath:indexPath];
        }];
        
        action.backgroundColor = color[a];
        [arrbtn addObject:action];
        
    }
    return  (NSArray *)arrbtn;
}

-(void)tableView:(UITableView *)tableView changeSelectStyle:(UITableViewLeftSelectStyle)editingstyle indexPath:(NSIndexPath *)indexPath
{
    if (editingstyle == UITableViewLeftSelectStyleDelect) {
        [arr removeObjectAtIndex:indexPath.section];
        [tableView beginUpdates];
        [tableView deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationMiddle];
        [tableView endUpdates];
    }
    if (editingstyle == UITableViewLeftSelectStyleShow) {
        NSLog(@"+++%ld",(long)editingstyle);
    }
    if (editingstyle == UITableViewLeftSelectStyleUpdate) {
        NSLog(@"+++%ld",(long)editingstyle);
    }
}
#pragma mark - UITableViewDataSource
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [arr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"MyCollectionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = arr[indexPath.section];
    return cell;
}


#pragma mark - set & get
-(UITableView *)demoTable
{
    if (!_demoTable) {
        _demoTable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _demoTable.delegate = self;
        _demoTable.backgroundColor = [UIColor clearColor];
        _demoTable.dataSource = self;
        _demoTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _demoTable;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
