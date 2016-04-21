//
//  ZYLNewController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLNewController.h"

#import "ZYLBaseNewsCell.h"
#import "ZYLBaseModel.h"
#import "ZYLNewsFactoryCell.h"
#import "ZYLNewsFactoryModel.h"
#import "ZYLSubjectDetailController.h"
#import "ZYLBabyShopController.h"
#import "ZYLHotPersonController.h"
#import "ZYLTryModel.h"
#import "ZYLSubjectExerciseModel.h"
#import "ZYLWEBController.h"
#import "ZYLHerComModel.h"
#import "UMSocial.h"

@interface ZYLNewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZYLNewController{
    NSString *_nextUrl;
    NSString *_neartime;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self downloadData];
    
    
}

-(void)refeshdata{
    
    [self downloadData];
    [self.TableView setContentOffset:CGPointMake(0, 0) animated:NO];
    
    
}


//下载数据
-(void)downloadData{
    NSMutableArray *ArrayData = [NSMutableArray array];
    
 
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:self.urlPage parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        _nextUrl = dict[@"freshRecord"];
        _neartime = dict[@"nearestItemTips"];
        
        NSArray *f = dict[@"itemList"];
        for (NSDictionary *i in f) {
            //            [ZJModelTool createModelWithDictionary:i modelName:@"name"];
            
            
            ZYLBaseModel *model = [ZYLNewsFactoryModel baseWithDict:i];
            
            
            [ArrayData addObject:model];
            
            
            
            
        }
        self.DataArray = ArrayData;
        [self.TableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark ------------------数据刷新--------------------
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    //偏移量
    if (scrollView.contentOffset.y < -20)
    {
        [self downloadData];
    }
    
    //下拉刷新
    if (self.TableView && scrollView.frame.size.height+scrollView.contentOffset.y > scrollView.contentSize.height +50)
    {
        [self addData];//调用加载方法
    }
    
}


-(void)addData{
    
    
    NSMutableArray *DataAr = [NSMutableArray arrayWithArray:self.DataArray];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    static int start = 10;
    
    if (_neartime) {
        start = 10;
    }
    
    NSString *url = [NSString stringWithFormat:@"%@&freshRecord=%@&start=%d",self.urlPage,_nextUrl,start];
    start += 10;
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        _nextUrl = dict[@"freshRecord"];
        _neartime = nil;
        NSArray *itemArray = dict[@"itemList"];;
        for (NSDictionary *itemDict in itemArray) {
            //            [ZJModelTool createModelWithDictionary:i modelName:@"name"];
            
            
            ZYLBaseModel *model = [ZYLNewsFactoryModel baseWithDict:itemDict];
            
            
            [DataAr addObject:model];
        }
        
        self.DataArray = DataAr;
        [self.TableView reloadData];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    

    
}

#pragma mark -------------------------tableview协议------------------------------

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DataArray.count;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYLBaseModel *model = self.DataArray[indexPath.row];
    
    
    return model.cellHeight;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZYLBaseModel *model = self.DataArray[indexPath.row];
    if ([model.typeName isEqualToString:@"普通商品"]) {
        ZYLBabyShopController *babyShop = [[ZYLBabyShopController alloc] init];
        
        babyShop.itemIdstr = model.itemId;
        babyShop.sessionDatastr = model.sessionData;
        
        babyShop.title = @"宝贝详情";
        
        [self.navigationController pushViewController:babyShop animated:YES];
        
        return;
        

    }
    if ([model.typeName isEqualToString:@"品牌活动"]){
        ZYLWEBController *web = [[ZYLWEBController alloc] init];
        ZYLTryModel *tryModel = (ZYLTryModel *)model;
        web.url = tryModel.shareUrl;
        web.title = model.typeName;
        
        [self.navigationController pushViewController:web animated:YES];
        return;
    }
    if ([model.typeName isEqualToString:@"她社区"]){
        ZYLHerComModel *her = (ZYLHerComModel *)model;
        ZYLWEBController *web = [[ZYLWEBController alloc] init];
        web.url = her.shareUrl;
        web.title = @"每日新款";
        
        [self.navigationController pushViewController:web animated:YES];


        
        return;
        
    }
    if ([model.typeName isEqualToString:@"虚拟试衣"]) {
        ZYLHotPersonController *hotperson = [[ZYLHotPersonController alloc] init];
        ZYLTryModel *tryModel = (ZYLTryModel *)model;
       
        hotperson.title = tryModel.shareDescription;
        
        NSString *str = tryModel.contentUrl;
        NSArray *arry = [str componentsSeparatedByString:@"/"];
        for (NSString *string in arry) {
            if([string rangeOfString:@"menuId="].location !=NSNotFound) {
                str = string;
                
                break;
            }
        }
        
         hotperson.HotUrl = [NSString stringWithFormat:@"%@&%@",Try_FAN,str];
        
        [self.navigationController pushViewController:hotperson animated:YES];
        
        return;
        
        
    }
    
       ZYLSubjectDetailController *subjectDetail = [[ZYLSubjectDetailController alloc] init];
    subjectDetail.title = @"主题活动";
    ZYLSubjectExerciseModel *subject = (ZYLSubjectExerciseModel *)model;
    NSString *str = subject.contentUrl;
    NSString *str2;
    NSArray *arry = [str componentsSeparatedByString:@"/"];
    for (NSString *string in arry) {
        if([string rangeOfString:@"its="].location !=NSNotFound) {
            str = string;
            
        }
        if ([string rangeOfString:@"title="].location !=NSNotFound) {
            NSString *search = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)string, NULL, NULL, kCFStringEncodingUTF8);
            str2 = search;
        }
    }
    
    subjectDetail.subjecturl = [NSString stringWithFormat:@"%@&%@&%@",Subject_Page,str,str2];
    
    [self.navigationController pushViewController:subjectDetail animated:YES];
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYLBaseNewsCell *cell = [ZYLNewsFactoryCell cellWithNews:self.DataArray[indexPath.row] andTableView:tableView];

    cell.blockUM = ^(){
        [UMSocialSnsService presentSnsIconSheetView:self appKey:@"5556a53667e58e1bb500661d" shareText:@"分享内容" shareImage:[UIImage imageNamed:@"分享图片"] shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQQ,UMShareToQzone,UMShareToSms,UMShareToEmail,nil] delegate:nil];
    };
    
    return cell;
}

@end
