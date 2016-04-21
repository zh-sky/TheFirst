//
//  ZYLPhohoController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLPhohoController.h"
#import "Header.h"
#import <AVFoundation/AVFoundation.h>
#import <ImageIO/ImageIO.h>
#import <QuartzCore/QuartzCore.h>

typedef enum{
    isFrontCamera = 0,
    isBackCamera
} cameraType;

typedef enum{
    AutoFlash = 0,
    CloseFlash,
    OpenFlash
}flashModel;

@interface ZYLPhohoController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,AVCaptureAudioDataOutputSampleBufferDelegate, UIImagePickerControllerDelegate >

{
    UIImage *_photo;
    BOOL _isFontCamera;
}

@property (strong, nonatomic) AVCaptureSession           *session;       // 捕获会话
@property (nonatomic, strong) AVCaptureStillImageOutput  *captureOutput; // 输出设备
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;  // 取景器


@property (nonatomic, strong) NSDictionary *DataArray;

@end

@implementation ZYLPhohoController
{
    UIImageView *image;
    UIImageView *blowimage;
    UIImageView *backimage;
    UIScrollView *scrollview;
    UIButton *btn1;
    UIButton *btn2;
    UILabel *lable1;
    UILabel *lable2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self downloadData];
    [self createUI];
}
- (AVCaptureSession *)session
{
    if (_session == nil) {
        _session = [[AVCaptureSession alloc] init];
    }
    return _session;
}

-(void)createUI{
    

    backimage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 300, 300)];
    [self.view addSubview:backimage];
    
    blowimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ViewWidth, ViewHight - 250)];
    [self.view addSubview:blowimage];
    blowimage.hidden = YES;
    
    
    image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ViewWidth, ViewHight - 250)];
    [self.view addSubview:image];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    
    btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.adjustsImageWhenHighlighted = NO;
    [btn1 setImage:[UIImage imageNamed:@"try-icon-photograph"] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(50, ViewHight - 250, 100, 100);
    [self.view addSubview:btn1];
    [btn1 addTarget:self action:@selector(takephoho:) forControlEvents:UIControlEventTouchUpInside];
    lable1 = [[UILabel alloc] initWithFrame:CGRectMake(0, ViewHight - 150, 200, 30)];
    [self.view addSubview:lable1];
    lable1.text = @"相机";
    lable1.textAlignment = NSTextAlignmentCenter;
    lable1.textColor = [UIColor whiteColor];
    
    btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.adjustsImageWhenHighlighted = NO;
    [btn2 setImage:[UIImage imageNamed:@"bendi"] forState:UIControlStateNormal];
     btn2.frame = CGRectMake(250, ViewHight - 250, 100, 100);
    [self.view addSubview:btn2];
    [btn2 addTarget:self action:@selector(selectphoho) forControlEvents:UIControlEventTouchUpInside];
    
    lable2 = [[UILabel alloc] initWithFrame:CGRectMake(200, ViewHight - 150, 200, 30)];
    [self.view addSubview:lable2];
    lable2.text = @"选取照片";
    lable2.textAlignment = NSTextAlignmentCenter;
    lable2.textColor = [UIColor whiteColor];
}

-(void)takephoho:(UIButton *)sender{
    
    [self.session stopRunning];
    [_previewLayer removeFromSuperlayer];
    sender.selected = !sender.selected;
    _isFontCamera = !_isFontCamera;
    [self setupCamera];
    btn1.hidden = YES;
    btn2.hidden = YES;
    lable1.hidden = YES;
    lable2.hidden = YES;
    [self takePhoho];

    
}

-(void)takePhoho{
    UIButton *btnCam = [[UIButton alloc]initWithFrame:CGRectMake(150, ViewHight - 150, 100, 50)];
    [btnCam setTitle:@"拍照" forState:UIControlStateNormal];
    [btnCam setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnCam addTarget:self action:@selector(getPhoto:) forControlEvents:UIControlEventTouchUpInside];
    [btnCam setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:btnCam];
    

}



// 获取图片
- (void)getPhoto:(UIButton *)btn
{
    btn.hidden = YES;

    //根据设备输出获得连接
    AVCaptureConnection *captureConnection=[_captureOutput connectionWithMediaType:AVMediaTypeVideo];
    //根据连接取得设备输出的数据
    [_captureOutput captureStillImageAsynchronouslyFromConnection:captureConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        NSLog(@"%@",error);
        if (imageDataSampleBuffer) {
            
            
            NSData *imageData=[AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            backimage.image=[UIImage imageWithData:imageData];
            
            UIButton *btnCam = [[UIButton alloc]initWithFrame:CGRectMake(150, ViewHight - 150, 100, 50)];
            [btnCam setTitle:@"保存" forState:UIControlStateNormal];
            [btnCam setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btnCam addTarget:self action:@selector(savepoho:) forControlEvents:UIControlEventTouchUpInside];
            [btnCam setBackgroundColor:[UIColor whiteColor]];
            [self.view addSubview:btnCam];
            
            [_session stopRunning];
            
        }
        
    }];

    
}

-(void)saveimage:(UIImage *)image{
    UIImageWriteToSavedPhotosAlbum(_photo, nil, nil, nil);
}



// 初始化相机

- (void)setupCamera
{
    AVCaptureDevice *captureDevice = [self getVideoInputCamera:(_isFontCamera ? isFrontCamera : isBackCamera)];
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:nil];
    if ([self.session canAddInput:deviceInput]){
        [_session addInput:deviceInput];
    }
    
    // 预览视图(取景器)
    _previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    [_previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    CALayer *preLayer = [[self view] layer];
    [preLayer setMasksToBounds:YES];
    image.backgroundColor= [UIColor clearColor];
    [_previewLayer setFrame:backimage.frame];
    [preLayer insertSublayer:_previewLayer atIndex:0];
    [_session startRunning];
    
    // 创建一个输出设备,并将它添加到会话
    _captureOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG,AVVideoCodecKey,nil];
    _captureOutput.outputSettings = outputSettings;
    [_session addOutput:_captureOutput];
}
#pragma mark VideoCapture
- (AVCaptureDevice *)getVideoInputCamera:(cameraType )cameraType
{
    //获取(后置/前置)摄像头设备
    NSArray *cameras = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in cameras){
        switch (cameraType) {
            case isFrontCamera:
                if (device.position == AVCaptureDevicePositionFront)
                    return device;
                break;
            case isBackCamera:
                if (device.position == AVCaptureDevicePositionBack)
                    return device;
                break;
            default:
                break;
        }
    }
    return [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
}


-(void)selectphoho{
    // 点击屏幕, 跳转到相册
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    // 设置代理
    picker.delegate = self;
    
    // 资源类型
    /**
     UIImagePickerControllerSourceTypePhotoLibrary, // 相册
     UIImagePickerControllerSourceTypeCamera,       // 相机
     UIImagePickerControllerSourceTypeSavedPhotosAlbum // 图库
     */
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:nil];

    [self susses];
    
}

#pragma mark ------------ 协议方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    // 选择媒体回调
    
    // 获取选中的图片
    UIImage *images = info[UIImagePickerControllerOriginalImage];
    
    backimage.image = images;
    backimage.contentMode = UIViewContentModeScaleToFill;
    image.backgroundColor = [UIColor clearColor];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}

-(void)susses{
    
    btn1.hidden = YES;
    btn2.hidden = YES;
    lable1.hidden = YES;
    lable2.hidden = YES;
    
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(150, ViewHight - 150, 100, 50)];
    [self.view addSubview:btn];
    [btn setTitle:@"完成保存" forState:UIControlStateNormal];

    [btn addTarget:self action:@selector(savepoho:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


//合成图片
-(void)savepoho:(UIButton *)btn{
    NSLog(@"保存");
    btn.hidden = YES;

    image.hidden = YES;
    blowimage.hidden = NO;
    
  
    NSArray *array = _DataArray[@"modelList"];
    NSDictionary *dict = array[0];
    NSArray *array1 = dict[@"bgList"];
    NSDictionary *dict1 = array1[0];
    NSString *xx = dict1[@"eye1Left"];
    NSString *yy = dict1[@"eye1Top"];
    CGFloat x = xx.floatValue-20;
    CGFloat y = yy.floatValue -20;
    
    NSString *ww = dict1[@"bgImgWidth"];
    NSString *hh = dict1[@"bgImgHeight"];
    
    CGFloat w = ViewWidth;
    CGFloat h = ViewWidth/ww.floatValue*hh.floatValue;
 
    
    blowimage.frame = CGRectMake(0, 0, w, h);
    
    UIGraphicsBeginImageContext(blowimage.frame.size);
    
    // Draw image1
    [backimage.image drawInRect:CGRectMake(x/2, y/2-20, 300, 300) ];
    
    
    // Draw image2
    [blowimage.image drawInRect:blowimage.frame];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    image.image = resultingImage;
    //写到相册
    UIImageWriteToSavedPhotosAlbum(image.image, nil, nil, NULL);
    
    
    
}



//下载数据
-(void)downloadData{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:_phohourl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
       
        
        _DataArray = dict;
        [self refeshUI];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

-(void)refeshUI{
    
    NSArray *array = _DataArray[@"modelList"];
    NSDictionary *dict = array[0];
    NSArray *array1 = dict[@"bgList"];
    NSDictionary *dict1 = array1[0];
    [image sd_setImageWithURL:[NSURL URLWithString:dict1[@"bgImgUrl"]]];
    
    image.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"FittingDetailBg"]];
    
    [blowimage sd_setImageWithURL:[NSURL URLWithString:dict[@"modelImgUrl"]]];
}


@end
