//
//  ViewController.m
//  downPhoto
//
//  Created by 赵凯 on 2017/1/24.
//  Copyright © 2017年 赵凯. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource> {
    CGFloat imgH;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *img;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    imgH = [[UIScreen mainScreen] bounds].size.width/1.6;
    
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    _tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.contentInset = UIEdgeInsetsMake(imgH, 0, 0, 0);
    
    _img = [[UIImageView alloc] initWithFrame:CGRectMake(0, -imgH, [[UIScreen mainScreen] bounds].size.width, imgH)];
    [_img setImage:[UIImage imageNamed:@"test"]];
    _img.contentMode = UIViewContentModeScaleAspectFill;
    [_tableView addSubview:_img];
    
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"UITableViewCell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    cell.textLabel.text =  [NSString stringWithFormat:@"cell-%ld",indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGPoint point = scrollView.contentOffset;
    NSLog(@"pointX=%f,pointY=%f",point.x,point.y);
    if (point.y < -imgH) {
        CGRect rect = _img.frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        _img.frame = rect;
    }
}

@end
