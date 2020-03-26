//
//  QLBookMarkVC.m
//  QLReader
//
//  Created by Yimmm on 2020/3/26.
//  Copyright © 2020 Yimmm. All rights reserved.
//

#import "QLBookMarkVC.h"
static  NSString *markCell = @"markCell";

@interface QLBookMarkVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tabView;

@end

@implementation QLBookMarkVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addObserver:self forKeyPath:@"readModel.marks" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.tabView];
    // Do any additional setup after loading the view.
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [_tabView reloadData];
    [QLReadBookModel updateLocalModel:_readModel url:_readModel.resource]; //本地保存
}

#pragma mark - setter getter | init

-(UITableView *)tabView
{
    if (!_tabView) {
        _tabView = [[UITableView alloc] init];
        _tabView.delegate = self;
        _tabView.dataSource = self;
        _tabView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tabView.separatorColor = [UIColor darkGrayColor];
    }
    return _tabView;
}



#pragma mark - UITableView Delagete DataSource && Delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ViewFrameSize(self.view).width, 50)];
    myView.backgroundColor = [UIColor lightGrayColor];
    UILabel * markLabel = [[UILabel alloc]initWithFrame:myView.bounds];
    [myView addSubview:markLabel];
    
    markLabel.textAlignment = NSTextAlignmentCenter;
    markLabel.text = @"书签翻页";
    markLabel.textColor = [UIColor cyanColor];
    markLabel.font = [UIFont systemFontOfSize:20];
    
    return myView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.f;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _readModel.marks.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:markCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:markCell];
    }

    cell.textLabel.text = [_readModel.marks[indexPath.row].recordModel.chapterModel stringOfPage:_readModel.marks[indexPath.row].recordModel.page];

    cell.detailTextLabel.text = _readModel.marks[indexPath.row].recordModel.chapterModel.title;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  70.f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if ([self.delegate respondsToSelector:@selector(catalogDidSelectChapter:page:)]) {
        [self.delegate catalogDidSelectChapter:_readModel.marks[indexPath.row].recordModel.chapter page:_readModel.marks[indexPath.row].recordModel.page];
    }
//    [self dismissViewControllerAnimated:YES completion:nil];

}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_readModel.marks removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
}
-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"readModel.marks"];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _tabView.frame = self.view.bounds;
}

@end
