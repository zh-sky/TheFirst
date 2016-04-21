//
//  ZYLTrysCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLTrysCell.h"
#import "Header.h"


@interface ZYLTrysCell()



@end

@implementation ZYLTrysCell
{
    UIImageView *image;
    UILabel *title;
}



+(id)trysCellWithTableView:(UITableView *)tableView{
    
    
    NSString *str = @"cell";
    ZYLTrysCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[ZYLTrysCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self createUI];
    }
    return self;
}

-(void)createUI{
    
    image = [[UIImageView alloc] init];
    [self addSubview:image];
    
    title = [[UILabel alloc] init];
    [image addSubview:title];
    title.layer.cornerRadius = 5;
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont systemFontOfSize:20];
    title.textAlignment = NSTextAlignmentCenter;
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"faceMix_bg"]];
    
    
}


-(void)setModel:(ZYLTrysModel *)model{
    
    _model = model;
    
    CGFloat w = ScreenWidth/2.0 - 10;
    CGFloat h = model.cellHeight - 10;
    CGFloat x = 5;
    CGFloat y = 5;
   
    image.frame = CGRectMake(x, y, w, h);
    [image sd_setImageWithURL:[NSURL URLWithString:model.mainImgUrl]];
    
    title.frame = CGRectMake(0, image.frame.size.height - 30, image.frame.size.width, 30);
    title.text = model.title;
 
    
}




@end
