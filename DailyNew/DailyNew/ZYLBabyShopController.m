//
//  ZYLBabyShopController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLBabyShopController.h"
#import "ZYLBabyHeard.h"
#import "ZYLBabyHeaderModel.h"
#import "ZYLBabyCellModel.h"
#import "ZYLBabyCell.h"
#import "ZYLWEBController.h"
#import "ZYLSHOPController.h"
#import "ZYLShopFoot.h"
#import "ZYLShopFootModel.h"
#import "ZYLFOOTModel.h"
#import "ZYLTypeController.h"
#import "UMSocial.h"


@interface ZYLBabyShopController ()<UITableViewDataSource,UITableViewDelegate,babyShopdelegate>

@property (nonatomic, strong) NSMutableArray *headerArray;

@property (nonatomic, strong) NSMutableArray *lastCellArray;

@end

@implementation ZYLBabyShopController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];
    
    
    [self downloadData];
    
    self.TableView.bounces = NO;
    // Do any additional setup after loading the view.
}

//下载数据
-(void)downloadData{
    
    
    NSMutableArray *ArrayData = [NSMutableArray array];
    
    _headerArray = [NSMutableArray array];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *url = [NSString stringWithFormat:@"%@&itemId=%@&sessionData=%@",BaBySHOP_PAGE,_itemIdstr,_sessionDatastr];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        [ZJModelTool createModelWithDictionary:dict modelName:@"name"];
        ZYLBabyHeaderModel *headerModel = [ZYLBabyHeaderModel babyHeaderModelWithDict:dict];
        [_headerArray addObject:headerModel];
        
        [self tableViewHeard];
        
        NSArray *thumArray = dict[@"thumbnails"];
        for (NSDictionary *thumDict in thumArray) {
//        [ZJModelTool createModelWithDictionary:thumDict modelName:@"name"];
            
            ZYLBabyCellModel *model = [ZYLBabyCellModel babyModelWithDict:thumDict];
            
            CGFloat h = ScreenWidth / model.width.floatValue * model.height.floatValue ;
            
            model.cellHeight = h;
            
            [ArrayData addObject:model];
            
        }
        self.DataArray = ArrayData;
        [self.TableView reloadData];
        
        NSArray *recommenArray = dict[@"recommendItems"];
        
        NSMutableArray *footArray = [NSMutableArray array];
        
        for (NSDictionary *recommenDict in recommenArray) {
//            [ZJModelTool createModelWithDictionary:thumDict modelName:@"name"];
            
            ZYLShopFootModel *model = [ZYLShopFootModel shopFootModelWithDict:recommenDict];
            [footArray addObject:model];
        }
        
        
        NSArray *tagsArray = dict[@"tags"];
        
        _lastCellArray = [NSMutableArray array];
        for (NSDictionary *tagsDict in tagsArray) {
//                [ZJModelTool createModelWithDictionary:tagsDict modelName:@"name"];
            ZYLFOOTModel *model = [ZYLFOOTModel FootModelWithDict:tagsDict];
            [_lastCellArray addObject:model];
        }
        

        
        [self setFoot:footArray lastCell:_lastCellArray];
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

    
    
}

//设置尾部
-(void)setFoot:(NSArray *)footArray lastCell:(NSArray *)lastArray{
    ZYLShopFoot *shopFoot = [ZYLShopFoot shopFootWith:CGRectMake(0, 0, ScreenWidth, 1000)];
    
    shopFoot.imageArray = footArray;
    shopFoot.TypeArray = lastArray;
    shopFoot.blockUM = ^(){
        
        [UMSocialSnsService presentSnsIconSheetView:self appKey:@"5556a53667e58e1bb500661d" shareText:@"分享内容" shareImage:[UIImage imageNamed:@"分享图片"] shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQQ,UMShareToQzone,UMShareToSms,UMShareToEmail,nil] delegate:nil];
        
    };
    
    shopFoot.changToBaby = ^(NSString *shopid, NSString *itenid){
        
        
        ZYLBabyShopController *babyshop = [[ZYLBabyShopController alloc] init];
        
        babyshop.itemIdstr = itenid;
        babyshop.sessionDatastr = shopid;
        babyshop.title = @"宝贝详情";
        [self.navigationController pushViewController:babyshop animated:YES
         ];
        
    };
    
    
    shopFoot.allData = _headerArray[0];
    shopFoot.changToBuy = ^(NSString *url){
        
        ZYLWEBController *su = [[ZYLWEBController alloc] init];
        su.url = url;
        [self.navigationController pushViewController:su animated:YES];
        
    };
    
    shopFoot.changtoType = ^(NSString *typeurl, NSString *title){
        
        ZYLTypeController *type = [[ZYLTypeController alloc] init];
        
        type.title = title;
        
        type.typeurl = typeurl;
        
        [self.navigationController pushViewController:type animated:YES];
        
    };
    
    self.TableView.tableFooterView = shopFoot;
}



-(void)tableViewHeard{
    ZYLBabyHeard *header = [ZYLBabyHeard babyHeardWithView];
    
    header.model = _headerArray[0];
    

    header.delegate = self;
    header.blockUM = ^(){
         [UMSocialSnsService presentSnsIconSheetView:self appKey:@"5556a53667e58e1bb500661d" shareText:@"分享内容" shareImage:[UIImage imageNamed:@"分享图片"] shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToWechatSession,UMShareToWechatTimeline,UMShareToQQ,UMShareToQzone,UMShareToSms,UMShareToEmail,nil] delegate:nil];
    };
    
    self.TableView.tableHeaderView = header;
}

-(void)changPage:(NSString *)urlName{
    
    ZYLWEBController *su = [[ZYLWEBController alloc] init];
    su.url = urlName;
    [self.navigationController pushViewController:su animated:YES];
}

//进入店铺
-(void)changPageInShop:(NSString *)shopUrl WithShopName:(NSString *)name{
    
    ZYLSHOPController *shop = [[ZYLSHOPController alloc] init];
    
    shop.shopurl = shopUrl;
    ZYLBabyHeaderModel *model = _headerArray[0];
    
    shop.title =[ NSString stringWithFormat:@"【%@】",model.shopName];
    shop.shopname = model.shopName;
    
    [self.navigationController pushViewController:shop animated:YES];
    
    
}

-(void)setNav{
    
    UIBarButtonItem *leftbtn = [ZYLCreateNavButton createNavButtonbackImage:@"menuLeftCellBg" image:@"left" title:nil target:self action:@selector(backPage)];
    
    self.navigationItem.leftBarButtonItem = leftbtn;
    
}

-(void)backPage{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}






-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.DataArray.count ;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    ZYLBabyCell *cell = [ZYLBabyCell babyCellWithTableView:tableView];
    
    cell.model = self.DataArray[indexPath.row];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
 
    
    ZYLBabyCellModel *model = self.DataArray[indexPath.row];
    return model.cellHeight;
}

@end
