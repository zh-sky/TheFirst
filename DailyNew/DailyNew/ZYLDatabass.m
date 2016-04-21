//
//  ZYLDatabass.m
//  DailyNew
//
//  Created by qianfeng on 15/11/4.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "ZYLDatabass.h"
#import "FMDatabase.h"

@interface ZYLDatabass ()
{
    FMDatabase *_database;
}
@end

@implementation ZYLDatabass

+(id)sharedInstance{
    static ZYLDatabass *dm = nil;
    if (dm == nil) {
        dm = [[ZYLDatabass alloc]init];
    }
    return dm;
}

-(instancetype)init{
    if (self = [super init]) {
        [self configDatabase];
    }
    return self;
}

-(void)configDatabase{
    
    NSString *path = [NSString stringWithFormat:@"%@/Documents/record.rdb",NSHomeDirectory()];
    
    //打开或者创建数据库
    _database = [[FMDatabase alloc]initWithPath:path];
    
    if (!_database.open) {
        NSLog(@"打开失败");
        return;
    }
    
    //创建数据表
    NSString *sql = @"create table if not exists Data(iconId,iconUrl,price,changurl)";
    BOOL b = [_database executeUpdate:sql];
    if (!b) {
        NSLog(@"创建表失败");
        return;
    }
    NSLog(@"数据库ok");
}

//记录保存
-(void)addRecordWithAppModel:(ZYLModel *)model recordId:(NSString *)typeid{
    if ([self isExistsRecordWithAppModel:model recordId:typeid]) {
        NSLog(@"已经保存过了");
        return;
    }
    NSString *sql = @"insert into Data(iconId,iconUrl,price,changurl) values(?,?,?,?)";
    
    BOOL b = [_database executeUpdate:sql,model.iconId,model.iconurl,model.price,model.changurl,typeid];
    if (!b) {
        NSLog(@"添加数据失败");
        return;
    }
    
}

//数据库的删除
-(void)removeRecordWithAppModel:(ZYLModel *)model recordId:(NSString *)typeid{
    NSString *sql = @"delete from Data where iconId = ?";
    bool b = [_database executeUpdate:sql,model.iconId,typeid];
    if (!b) {
        NSLog(@"删除数据失败");
        return;
    }
}

//查看是否存在
-(BOOL)isExistsRecordWithAppModel:(ZYLModel *)model recordId:(NSString *)typeid{
    NSString *sql = @"select * from Data where iconId = ?";
    FMResultSet *result = [_database executeQuery:sql,model.iconId,typeid];
    while ([result next]) {
        return YES;
    }
    return NO;
}

//获取所有数据
-(NSArray *)recordWithRecordId:(NSString *)typeid{
    
    NSMutableArray *marr = [[NSMutableArray alloc]init];
    NSString *sql = @"select * from Data where iconId = ?";
    FMResultSet *result = [_database executeQuery:sql,typeid];
    while ([result next]) {
        
        ZYLModel *moedel = [[ZYLModel alloc]init];
        moedel.iconId = [result stringForColumn:@"applicationId"];
        moedel.iconurl = [result stringForColumn:@"iconUrl"];
        moedel.price = [result stringForColumn:@"name"];
        moedel.changurl = [result stringForColumn:@"changurl"];
        
        [marr addObject:moedel];
    }
    return marr;
}


@end
