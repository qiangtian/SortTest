//
//  SortViewController.m
//  SortTest
//
//  Created by 西安旺豆电子 on 2018/7/11.
//  Copyright © 2018年 TQ. All rights reserved.
//

#import "SortViewController.h"
#import "Configer.h"

@interface SortViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) NSArray *numArray;

@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.titleArray = @[@"冒泡排序",@"选择排序",@"快速排序",@"插入排序", @"其他"];
    [self.view addSubview:self.tableView];
    
    self.numArray= @[@(2), @(5), @(4), @(1), @(3)];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellidentifier = @"cellidintifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self bubbleSort:self.numArray];
            break;
        case 1:
            [self selectionSort:self.numArray];
            break;
        case 2:
            [self quickSortArry:self.numArray withleftIndex:0 rightIndex:_numArray.count -1];
            break;
        case 3:
            [self insertionSort:self.numArray];
            break;
            
        default:
            break;
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64 + 10, kScreenW, kScreenH - kNAV_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 50;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _tableView;
}


#pragma mark - bubble sort
/**
 *  冒泡排序
 */
//  比较相邻两元素大小，将大的放右边，以此循环。空间：O(n^2)时间O(n^2)
- (void)bubbleSort:(NSArray *)array {
    
    NSMutableArray *muarray = [array mutableCopy];
    NSLog(@" --- %@ --- ", muarray);
    for (int i = 0; i < muarray.count; i++) {
        for (int j = 0; j < muarray.count - 1 - i; j++) {
            NSInteger left = [muarray[j] integerValue];
            NSInteger right = [muarray[j+1] integerValue];
            if (left > right) {
                NSNumber *num = muarray[j];
                muarray[j] = muarray[j+1];
                muarray[j+1] = num;
            }
            NSLog(@" --- %@ --- ", [muarray componentsJoinedByString:@","]);
        }
    }
}

/**
 *   选择排序
 */
//   找最小的，放在第一位，依次循环，平均空间：O(1),时间：O(n^2)
- (void)selectionSort:(NSArray *)array {
    NSMutableArray *muarray = [array mutableCopy];
    NSLog(@" --- %@ --- ", [muarray componentsJoinedByString:@","]);

    for (int i = 0; i < muarray.count; i++) {
        for (int j = i + 1; j < muarray.count; j++) {
            if ([muarray[i] intValue] > [muarray[j] intValue]) {
                NSNumber *tmp = muarray[i];
                muarray[i] = muarray[j];
                muarray[j] = tmp;
            }
        }
        NSLog(@" --- %@ --- ", [muarray componentsJoinedByString:@","]);
    }
}

/**
 *  快速排序
 */
// 设置基数，从最右侧开始，找到比基数小的数，放在左边；从左开始，将比基数大的数，放在右边，递归执行左右两侧
// 平均时间复杂度： O(nlogn)
- (void)quickSortArry:(NSArray *)array
        withleftIndex:(NSInteger )leftIndex
           rightIndex:(NSInteger )rightIndex {
    if (leftIndex > rightIndex) {
        return;
    }
    
    NSMutableArray *muarry = [array mutableCopy];
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    
    // 设置key值，基数
    NSInteger key = [muarry[i] integerValue];

    while (i < j) {
        // 从 最右边开始 将比基数大的值忽略，小的交换到左边
        while (i < j && [muarry[j] integerValue] >= key) {
            j--;
        }
        muarry[i] = muarry[j];
        
        // 从左边开始，比基数小的忽略，大的交换到右边
        while (i < j && [muarry[i] integerValue] <= key) {
            i++;
        }
        muarry[j] = muarry[i];
    }
    
    muarry[i] = @(key);
    NSLog(@" --- %@ --- ", [muarry componentsJoinedByString:@","]);
    
    [self quickSortArry:muarry withleftIndex:leftIndex rightIndex:i-1];
    [self quickSortArry:muarry withleftIndex:i+1 rightIndex:rightIndex];
}


/**
 *  插入排序
 */
- (void)insertionSort:(NSArray *)array {
    NSMutableArray *muarry = [array mutableCopy];
    NSLog(@" --- %@ --- ", [muarry componentsJoinedByString:@","]);

    for (int i = 1; i< muarry.count ; i++) {
        NSInteger tmp = [muarry[i] integerValue];
        for (int j = i-1; j>=0 && tmp < [muarry[j] integerValue]; j--) {
            muarry[j+1] = muarry[j];
            muarry[j] = @(tmp);
        }
        
        NSLog(@" --- %@ --- ", [muarry componentsJoinedByString:@","]);
    }
}













@end
