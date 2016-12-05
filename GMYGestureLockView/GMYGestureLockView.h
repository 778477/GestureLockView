//
//  GMYGestureLockView.h
//  GAG
//
//  Created by miaoyou.gmy on 16/8/7.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  用户绘制好解锁图案的回调，参数为 无符号整形数值
 *  unlocked callback with array<unsigned>
 */
@protocol GMYGestureLockDelegate <NSObject>
- (void)userGestureDrawedLockValue:(NSArray<NSNumber *> *)lockVals;
@end

@interface GMYGestureLockView : UIView
@property (nonatomic, weak) id<GMYGestureLockDelegate> delegate;
@property (nonatomic, strong) UIColor *gestureStrokeColor; // 用户手势轨迹线 颜色
@property (nonatomic, assign) CGFloat gestureLineWidth;    // 用户手势轨迹线 宽度

/**
 *  指定初始化方法 初始化用户手势解锁界面
 *
 *  @param frame       位置,大小
 *  @param lockNodeNumber   解锁节点个数  默认值为9(defalt value: 9)
 *  @param normalCol   解锁节点未选中颜色 默认值为灰色(defalut value: grayColor)
 *  @param selecrColor 解锁节点选中颜色   默认值为蓝色(defalut value: blueColor)
 *
 *  @return 手势解锁界面
 */
- (instancetype)initWithFrame:(CGRect)frame
               lockNodeNumber:(int)lockNodeNumber
              nodeNormalColor:(UIColor *)normalColor
            nodeSelectedColor:(UIColor *)selectColor NS_DESIGNATED_INITIALIZER;

@end
