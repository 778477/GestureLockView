# GMYGestureLockView
- - -

手势解锁在交互体验上比输入键盘密码来得方便。

## Screenshot
- - -

![snapshot](https://raw.githubusercontent.com/778477/GestureLockView/master/snapshot.png)
![snapshot1](https://raw.githubusercontent.com/778477/GestureLockView/master/snapshot1.png)


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

`@property (nonatomic, strong) UIColor *gestureStrokeColor;` 

Set the UserGesturePath StrokeColor, default value like nodeSelectedColor(**BlueColor**)


`@property (nonatomic, assign) CGFloat gestureLineWidth;` 

Set the UserGesturePath LineWidth,default value is **4**



### Delegate
- - -

`GMYGestureLockView` will call the delegate when user gesture touch end.


```
@protocol GMYGestureLockDelegate <NSObject>
- (void)userGestureDrawedLockValue:(NSUInteger)lockVal;
@end

@property (nonatomic, weak) id<GMYGestureLockDelegate> delegate;
```


# MIT License
- - -

```
The MIT License (MIT)

Copyright (c) 2016 Nicejinux

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```