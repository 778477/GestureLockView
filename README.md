# GMYGestureLockView
- - -

手势解锁在交互体验上比输入键盘密码来得方便。



## CocoaPods
- - -

GMYGestureLockView can be installed using [CocoaPods](https://cocoapods.org/) to install `GMYGestureLockView` by adding it to your `Podfile`:

```
source 'https://github.com/778477/github-podspecs'

target 'GestureLockViewDemo' do
	platform :ios, '7.0'
pod 'GMYGestureLockView', '1.0.0.0'
end

```


## Usage
- - -

```
CGFloat viewWitdth = [UIScreen mainScreen].bounds.size.width;
GMYGestureLockView *lockView = [[GMYGestureLockView alloc] initWithFrame:CGRectMake((viewWitdth - 320)/2, 200, 320, 320)
                                                             nodeNormalColor:[UIColor grayColor]
                                                           nodeSelectedColor:[UIColor redColor]];
            
```

`@property (nonatomic, strong) UIColor *gestureStrokeColor;` Set the UserGesturePath StrokeColor, default value like nodeSelectedColor(**BlueColor**)

`@property (nonatomic, assign) CGFloat gestureLineWidth;` Set the UserGesturePath LineWidth,default is **4**



### Delegate
- - -

`GMYGestureLockView` will call the delegate when user gesture touch end.


```
@protocol GMYGestureLockDelegate <NSObject>
- (void)userGestureDrawedLockValue:(NSUInteger)lockVal;
@end

@property (nonatomic, weak) id<GMYGestureLockDelegate> delegate;
```
