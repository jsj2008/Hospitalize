//
//  NMRefreshGifHeader.m
//  Niox
//
//  Created by zhuenkai on 15/8/7.
//  Copyright (c) 2015年 neusoft. All rights reserved.
//

#import "NMRefreshGifHeader.h"
#import "FCCommonUtil.h"

@interface NMRefreshGifHeader()
@property (weak, nonatomic) UIImageView *gifView;
/** 所有状态对应的动画图片 */
@property (strong, nonatomic) NSMutableDictionary *stateImages;
/** 所有状态对应的动画时间 */
@property (strong, nonatomic) NSMutableDictionary *stateDurations;
@end


@implementation NMRefreshGifHeader

- (void)prepare
{
    [super prepare];
    self.backgroundColor = [FCCommonUtil colorWithHexString:@"F5F5F5"];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=43; i++) {
        NSString *imageName = [NSString stringWithFormat:@"refresh_state_pulling_%zd", i];
        UIImage *image = [self imageNamedFromMyBundle:imageName];
        UIImage *newImage = [FCCommonUtil imageCompressForSize:image targetSize:CGSizeMake(100, 100)];
        if (newImage) {
           [idleImages addObject:newImage];
        }
        
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];
    
    // 设置正在刷新状态的动画图片
    NSMutableArray *refreshImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=23; i++) {
        NSString *imageName = [NSString stringWithFormat:@"refresh_state_refreshing_%zd", i];
        UIImage *image = [self imageNamedFromMyBundle:imageName];
        UIImage *newImage = [FCCommonUtil imageCompressForSize:image targetSize:CGSizeMake(100, 100)];
        if (newImage) {
            [refreshImages addObject:newImage];
        }
        
    }
    // 设置正在刷新状态的动画图片
    [self setImages:refreshImages forState:MJRefreshStateRefreshing];
}
- (UIImage *)imageNamedFromMyBundle:(NSString *)name {
    UIImage *image = [UIImage imageNamed:[@"NMResource.bundle" stringByAppendingPathComponent:name]];
    if (image) {
        return image;
    } else {
        UIImage *image1 = [UIImage imageNamed:[@"EmartFrameWork.framework/NMResource.bundle" stringByAppendingPathComponent:name]];
        if (image1) {
            return image1;
        }else{
            UIImage *image2 = [UIImage imageNamed:[@"Framework/EmartFrameWork.framework/NMResource.bundle" stringByAppendingPathComponent:name]];
            return image2;
        }
    }
}
#pragma mark - 懒加载
- (UIImageView *)gifView
{
    if (!_gifView) {
        UIImageView *gifView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        [self addSubview:_gifView = gifView];
    }
    return _gifView;
}

- (NSMutableDictionary *)stateImages
{
    if (!_stateImages) {
        self.stateImages = [NSMutableDictionary dictionary];
    }
    return _stateImages;
}

- (NSMutableDictionary *)stateDurations
{
    if (!_stateDurations) {
        self.stateDurations = [NSMutableDictionary dictionary];
    }
    return _stateDurations;
}

#pragma mark - 公共方法
- (void)setImages:(NSArray *)images duration:(NSTimeInterval)duration forState:(MJRefreshState)state
{
    if (images == nil) return;
    
    self.stateImages[@(state)] = images;
    self.stateDurations[@(state)] = @(duration);
    
    /* 根据图片设置控件的高度 */
    UIImage *image = [images firstObject];
    if (image.size.height > self.mj_h) {
        self.mj_h = image.size.height;
    }
}

- (void)setImages:(NSArray *)images forState:(MJRefreshState)state
{
    [self setImages:images duration:images.count * 0.03 forState:state];
}

#pragma mark - 实现父类的方法
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    NSArray *images = self.stateImages[@(MJRefreshStateIdle)];
    if (self.state != MJRefreshStateIdle || images.count == 0) return;
    // 停止动画
    [self.gifView stopAnimating];
    // 设置当前需要显示的图片
    NSUInteger index =  images.count * pullingPercent;
    if (index >= images.count) index = images.count - 1;
    self.gifView.image = images[index];
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    self.gifView.frame = self.bounds;
    if (self.stateLabel.hidden && self.lastUpdatedTimeLabel.hidden) {
        self.gifView.contentMode = UIViewContentModeCenter;
    } else {
        self.gifView.contentMode = UIViewContentModeRight;
        self.gifView.mj_w = self.mj_w * 0.5 - 60;
    }
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    // 根据状态做事情
    if (state == MJRefreshStateRefreshing) {
        NSArray *images = self.stateImages[@(state)];
        if (images.count == 0) return;
        
        [self.gifView stopAnimating];
        if (images.count == 1) { // 单张图片
            self.gifView.image = [images lastObject];
        } else { // 多张图片
            self.gifView.animationImages = images;
            self.gifView.animationDuration = [self.stateDurations[@(state)] doubleValue];
            self.gifView.animationRepeatCount = 0;
            [self.gifView startAnimating];
        }
    }
}

@end
