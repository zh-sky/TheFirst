//
//  ZYLSnsRowsCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSnsRowsCell.h"
#import "Header.h"

@interface ZYLSnsRowsCell ()
@property (weak, nonatomic) IBOutlet UILabel *titlecontent;
@property (weak, nonatomic) IBOutlet UIImageView *headurl;
@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *detailTime;
@property (weak, nonatomic) IBOutlet UILabel *replyLable;
@end

@implementation ZYLSnsRowsCell

+(id)snsRowsCellWithView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil ] lastObject];
}

-(void)setModel:(ZYLSnsRowsModel *)model{
    _model = model;
    
    _titlecontent.text = model.contentWithoutPics;
    [_headurl sd_setImageWithURL:[NSURL URLWithString:model.userHeadUrl]];
    _name.text = model.nickName;
    _detailTime.text = model.dealTimeInfo;
    _replyLable.text = model.reply.stringValue;
    
    if (model.picUrls.count>=3){
        for (int i = 0; i<3; i++){
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(35+i*105, 70, 85, 85)];
            image.backgroundColor = [UIColor redColor];
            [image sd_setImageWithURL:[NSURL URLWithString:model.picUrls[i]]];
        [self addSubview:image];
            if (i==2) {
                UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(45, 60, 40, 20)];
                [image addSubview:lable];
                lable.alpha = 0.7;
                lable.text = [NSString stringWithFormat:@"共%lu张",(unsigned long)model.picUrls.count];
                lable.backgroundColor = [UIColor grayColor];
                lable.font = [UIFont systemFontOfSize:12];
            }
        }
        
        
        
    }
    else{
        for (int i = 0; i<model.picUrls.count; i++) {
            UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(35+i*105, 70, 85, 85)];
            [self addSubview:image];
            [image sd_setImageWithURL:[NSURL URLWithString:model.picUrls[i]]];
            image.backgroundColor = [UIColor redColor];
        }
    }
        
}

@end
