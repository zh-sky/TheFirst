//
//  ZYLShopFoot.m
//  DailyNew
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLShopFoot.h"
#import "Header.h"
#import "ZYLShopFootModel.h"
#import "UIButton+WebCache.h"
#import "ZYLFOOTModel.h"

@interface ZYLShopFoot ()



@end

@implementation ZYLShopFoot

+(id)shopFootWith:(CGRect)frame{
    return [[self alloc] initWithFrame:frame];
}

-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}
-(void)createUI{
    
    UIImageView *seperatorLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    [self addSubview:seperatorLine];
    seperatorLine.image = [UIImage imageNamed:@"seperatorLine"];
    
    UIImageView *backimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, ScreenWidth, 60)];
    [self addSubview:backimage];
    backimage.image = [UIImage imageNamed:@"MenuLeftCellSelect"];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:btn1];
    [btn1 setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [btn1 setTitle:@" 分享" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:13];
    btn1.frame = CGRectMake(10, 25, 100, 30);
    btn1.adjustsImageWhenHighlighted = NO;
    [btn1 addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:btn2];
    [btn2 setImage:[UIImage imageNamed:@"fav_normal"] forState:UIControlStateNormal];
    [btn2 setTitle:@" 收藏" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:13];
    btn2.frame = CGRectMake(120, 25, 100, 30);
    [btn2 setImage:[UIImage imageNamed:@"fav_select"] forState:UIControlStateSelected];
    [btn2 setTitle:@" 取消收藏" forState:UIControlStateSelected];
    btn2.adjustsImageWhenHighlighted = NO;
    [btn2 addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:btn3];
    [btn3 setTitle:@"去购买" forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    btn3.frame = CGRectMake(230, 20, 130, 40);
    btn3.backgroundColor = [UIColor blueColor];
    btn3.adjustsImageWhenHighlighted = NO;
    btn3.layer.cornerRadius = 10;
    [btn3 addTarget:self action:@selector(tobuy) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)share{
    if (self.blockUM) {
        self.blockUM();
    }
}

-(void)collect:(UIButton *)btn{
    
    if (btn.selected) {
        btn.selected = NO;
        return;
    }
    btn.selected = YES;
    
}

-(void)tobuy{
    
    if (self.changToBuy) {
        
        self.changToBuy(_allData.buyUrl);
    }
    
}
-(void)setAllData:(ZYLBabyHeaderModel *)allData{
    _allData = allData;
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(10, 90, ScreenWidth, 30)];
    lable.text = [NSString stringWithFormat:@"选款师%@点评",_allData.xksName];
    [self addSubview:lable];
    lable.font = [UIFont systemFontOfSize:20];
}

-(void)setTypeArray:(NSArray *)TypeArray{
    
    _TypeArray = TypeArray;
    
//    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10, 80, 40, 40)];
//    
//    [self addSubview:image];
//    image sd_setImageWithURL:[NSURL URLWithString:<#(NSString *)#>]
    
    
    
    CGFloat w = 0;
    CGFloat h = 130;
    for(int i = 0; i < TypeArray.count; i++){
        ZYLFOOTModel *model = TypeArray[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        btn.tag = i + 60;
        [btn setBackgroundImage:[UIImage imageNamed:@"MenuLeftCellSelect"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //根据字体计算文字大小
        NSDictionary *sttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
        CGFloat length = [model.tagName boundingRectWithSize:CGSizeMake(ScreenWidth, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:sttributes context:nil].size.width;
        
        [btn setTitle:model.tagName forState:UIControlStateNormal];
        
        //设置button的frame
        btn.frame = CGRectMake(10+w, h, length+15, 40);
        
        
        //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
        if(10 + w + length + 15 > ScreenWidth){
            w = 0; //换行时将w置为0
            h = h + btn.frame.size.height + 10;//距离父视图也变化
            btn.frame = CGRectMake(10 + w, h, length + 15, 40);//重设button的frame
        }
        w = btn.frame.size.width + btn.frame.origin.x;
        [self addSubview:btn];
        btn.adjustsImageWhenHighlighted = NO;
        
        [btn addTarget:self action:@selector(changeToBaby:) forControlEvents:UIControlEventTouchUpInside];
    }

    
    /*
     NSArray *arr = @[@"无知",@"风云变幻",@"施耐庵",@"唉",@"西门吹雪",@"呵呵哒",@"快看看",@"窿窿啦啦",@"一杆禽兽狙",@"合欢花",@"暴走大事件",@"非诚勿扰",@"呵呵呵"];
     CGFloat w = 0;//保存前一个button的宽以及前一个button距离屏幕边缘的距离
     CGFloat h = 200;//用来控制button距离父视图的高
     for (int i = 0; i < arr.count; i++) {
     UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
     button.tag = 100 + i;
     button.backgroundColor = [UIColor greenColor];
     [button addTarget:self action:@selector(handleClick:) forControlEvents:UIControlEventTouchUpInside];
     [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
     //根据计算文字的大小
     
     NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
     CGFloat length = [arr[i] boundingRectWithSize:CGSizeMake(320, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
     //为button赋值
     [button setTitle:arr[i] forState:UIControlStateNormal];
     //设置button的frame
     button.frame = CGRectMake(10 + w, h, length + 15 , 30);
     //当button的位置超出屏幕边缘时换行 320 只是button所在父视图的宽度
     if(10 + w + length + 15 > 320){
     w = 0; //换行时将w置为0
     h = h + button.frame.size.height + 10;//距离父视图也变化
     button.frame = CGRectMake(10 + w, h, length + 15, 30);//重设button的frame
     }
     w = button.frame.size.width + button.frame.origin.x;
     [self.view addSubview:button];
     }
     */
    
}

-(void)changeToBaby:(UIButton *)btn{
    
    if (self.changtoType) {
        ZYLFOOTModel *model = _TypeArray[btn.tag - 60];
        NSString *shopUrl = [NSString stringWithFormat:@"%@&tid=%@",TYPE_PAGE,model.tagId];

        self.changtoType(shopUrl,model.tagName);
    }
//    
//    NSString *shopUrl = [NSString stringWithFormat:@"%@&sessionData=%@&shopId=%@",SHOP_PAGE,_model.sessionData,_model.shopId.stringValue];
//    [self.delegate changPageInShop:shopUrl WithShopName:_model.shopName];
    
}

-(void)setImageArray:(NSArray *)imageArray{
    
    _imageArray = imageArray;
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, ScreenWidth, 10)];
    [self addSubview:image];
    image.image = [UIImage imageNamed:@"wavyLine"];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(5, 317, 100, 30)];
    lable.text = @"猜你喜欢";;
    lable.font = [UIFont boldSystemFontOfSize:20];
    [self addSubview:lable];
    
    CGFloat w = ScreenWidth / 3.0;
    CGFloat h = w;
    CGFloat x = w;
    CGFloat y = h;
    NSInteger count = imageArray.count;
    
    for (int i = 0; i < count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        ZYLShopFootModel *model = imageArray[i];
        
        [btn setImage:[UIImage imageNamed:model.imgUrl] forState:UIControlStateNormal];
        [btn sd_setImageWithURL:[NSURL URLWithString:model.imgUrl] forState:UIControlStateNormal];
        btn.adjustsImageWhenHighlighted = NO;
       
        btn.tag = i + 100;
        btn.frame = CGRectMake(i%3*x+5, i/3*(y+40)+355, w-10, h-10);
        [self addSubview:btn];
        
        UILabel *price = [[UILabel alloc] initWithFrame:CGRectMake(i%3*x+5, CGRectGetMaxY(btn.frame)+10, w-10, 20)];
        price.text = [NSString stringWithFormat:@"￥%.2f",model.price.floatValue];
        
        price.textColor = [UIColor redColor];
        price.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:price];
        
        [btn addTarget:self action:@selector(btnToBaby:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
    
}

//跳转宝贝详情
-(void)btnToBaby:(UIButton *)button{
    
    if (self.changToBaby) {
        
        ZYLShopFootModel *model = _imageArray[button.tag - 100];
        
        self.changToBaby(model.shopId.stringValue, model.itemId.stringValue);
    }
    
}

@end
