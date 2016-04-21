//
//  ZYLSnsCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSnsCell.h"
#import "Header.h"

@interface ZYLSnsCell()
@property (weak, nonatomic) IBOutlet UIImageView *picurl;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *disc;
@property (weak, nonatomic) IBOutlet UILabel *Day;

@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@end

@implementation ZYLSnsCell

+(id)snsCellWithView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil ] lastObject];
}


#pragma mark 重写setFrame方法，自己调整cell的frame
- (void)setFrame:(CGRect)frame
{
    // tableView边框的宽度 #define kTableBorderWidth 5
    // 更改x、宽度
    frame.origin.x = 5;
    frame.size.width -= 5 * 2;
    
    // 更改顶部间距、每个cell之间的间距
    frame.origin.y += 5;
    frame.size.height -= 5;
    
    [super setFrame:frame];
}


-(void)setModel:(ZYLSnsModel *)model{
    
    _model = model;
    
    [_picurl sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];
    
    _picurl.layer.cornerRadius = 5;
    
    
    NSString *str = [NSString stringWithFormat:@"今日 %@",model.nReplies];

    _Day.text = str;
    _disc.text = model.newest[@"content_without_pics"];
    _title.text = model.title;
    
    
}

-(void)setBackImage:(UIImageView *)backImage{
    _backImage = backImage;
    backImage.layer.cornerRadius = 10;
    
}



@end
