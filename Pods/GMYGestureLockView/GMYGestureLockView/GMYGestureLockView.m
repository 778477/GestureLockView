//
//  GMYGestureLockView.m
//  GAG
//
//  Created by miaoyou.gmy on 16/8/7.
//  Copyright © 2016年 miaoyou.gmy. All rights reserved.
//

#import "GMYGestureLockView.h"

typedef NS_ENUM(NSUInteger, GMYGestureLockNodeState) {
    GMYGestureLockNodeStateUnSelect = 1,
    GMYGestureLockNodeStateSelected ,
};

@interface GMYGestureLockViewNode : UIView
@property (nonatomic, assign) GMYGestureLockNodeState state;
@property (nonatomic, assign) NSUInteger nodeValue;

- (instancetype)initWithFrame:(CGRect)frame
                  normalColor:(UIColor *)normalColor
                selectedColor:(UIColor *)selectColor NS_DESIGNATED_INITIALIZER;
@end

@implementation GMYGestureLockViewNode{
    UIColor *_normalCol;
    UIColor *_selectedCol;
    UIView *_core;
}

#pragma mark - left Cycle
- (instancetype)init{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame normalColor:[UIColor grayColor] selectedColor:[UIColor blueColor]];
}


- (instancetype)initWithFrame:(CGRect)frame normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectColor{
    self = [super initWithFrame:frame];
    
    if(self){
        _normalCol = normalColor ? normalColor : [UIColor grayColor];
        _selectedCol = selectColor ? selectColor : [UIColor blueColor];
        
        _state = GMYGestureLockNodeStateUnSelect;
        
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = frame.size.width / 2;
        self.layer.borderColor = _normalCol.CGColor;
        self.layer.borderWidth = 2.f;
        
        _core = [[UIView alloc] initWithFrame:CGRectMake(frame.size.width/4, frame.size.width/4, frame.size.width/2, frame.size.height/2)];
        _core.layer.masksToBounds = YES;
        _core.layer.cornerRadius = _core.frame.size.width / 2;
        _core.backgroundColor = _normalCol;
        [self addSubview:_core];
        
    }
    
    return self;
}

#pragma mark - Setter
- (void)setState:(GMYGestureLockNodeState)state{
    _state = state;
    
    [self updateNodeStyle];
}


#pragma mark - Private Method
- (void)updateNodeStyle{
    if(self.state == GMYGestureLockNodeStateUnSelect){
        self.layer.borderColor = _normalCol.CGColor;
        _core.backgroundColor = _normalCol;
    }
    else if(self.state == GMYGestureLockNodeStateSelected){
        self.layer.borderColor = _selectedCol.CGColor;
        _core.backgroundColor = _selectedCol;
    }
}


@end

@interface GMYGestureLockView ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIBezierPath *path;
@end

@implementation GMYGestureLockView{
    NSUInteger _gestureLockValues;
    UIColor *_nodeSelectedCol;
}

#pragma mark - Life Cycle
- (instancetype)init{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame nodeNormalColor:[UIColor grayColor] nodeSelectedColor:[UIColor blueColor]];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame nodeNormalColor:(UIColor *)normalCol nodeSelectedColor:(UIColor *)selectColor{
    self = [super initWithFrame:frame];
    
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        
        _gestureLockValues = 0;
        _nodeSelectedCol = selectColor ? selectColor : [UIColor blueColor];
        
        CGFloat margin = 18.f;
        CGFloat nodeWidth = (frame.size.width - 4*margin) / 3;
        
        CGFloat offsetX = margin;
        CGFloat offsetY = margin;
        for(NSUInteger i = 0; i < 9; i++){
            NSUInteger x = i%3;
            NSUInteger y = i/3;
            
            offsetX = (x+1)*margin + x*nodeWidth;
            offsetY = (y+1)*margin + y*nodeWidth;
            
            GMYGestureLockViewNode *node = [[GMYGestureLockViewNode alloc] initWithFrame:CGRectMake(offsetX, offsetY, nodeWidth, nodeWidth)
                                                                             normalColor:normalCol
                                                                           selectedColor:selectColor];
            node.nodeValue = i+1;
            [self addSubview:node];
        }
        
        UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGesture:)];
        recognizer.minimumPressDuration = 0.1;
        recognizer.delegate = self;
        [self addGestureRecognizer:recognizer];
        
        
    }
    
    return self;
}

#pragma mark - 
- (UIBezierPath *)path{
    if(!_path){
        _path = [UIBezierPath bezierPath];
        _path.lineWidth = 4.f;
    }
    return _path;
}

- (void)setGestureLineWidth:(CGFloat)gestureLineWidth{
    self.path.lineWidth = gestureLineWidth;
}


#pragma mark -
- (void)drawRect:(CGRect)rect{
    UIColor *strokeColor = self.gestureStrokeColor ? self.gestureStrokeColor : _nodeSelectedCol;
    [strokeColor setStroke];
    
    [_path stroke];
}

- (void)longPressGesture:(UIGestureRecognizer *)gesture{
    
    CGPoint point = [gesture locationInView:self];
    
    __block GMYGestureLockViewNode *selectedNode = nil;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[GMYGestureLockViewNode class]]){
            GMYGestureLockViewNode *node = (GMYGestureLockViewNode *)obj;
            
            if(CGRectContainsPoint(node.frame, point)){
                selectedNode = node;
                *stop = YES;
            }
        }
    }];
    
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            _gestureLockValues = selectedNode.nodeValue;
            selectedNode.state = GMYGestureLockNodeStateSelected;
            // first node
            [self.path moveToPoint:selectedNode.center];
            [self setNeedsDisplay];
            break;
            
        case UIGestureRecognizerStateChanged:
            if(selectedNode.state == GMYGestureLockNodeStateUnSelect){
                selectedNode.state = GMYGestureLockNodeStateSelected;
                _gestureLockValues = _gestureLockValues * 10 + selectedNode.nodeValue;
                // first node
                if(!(_gestureLockValues/10)){
                    [self.path moveToPoint:selectedNode.center];
                }
                else{
                    [self.path addLineToPoint:selectedNode.center];
                }
                [self setNeedsDisplay];
            }
            break;
            
        case UIGestureRecognizerStateEnded:{
            /*
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"alert"
                                                            message:[NSString stringWithFormat:@"%lu",_gestureLockValues]
                                                           delegate:nil
                                                  cancelButtonTitle:@"cancel"
                                                  otherButtonTitles:nil, nil];
            
            [alert show];
             */
            
            if(self.delegate && [self.delegate respondsToSelector:@selector(userGestureDrawedLockValue:)]){
                [self.delegate userGestureDrawedLockValue:_gestureLockValues];
            }
            
            [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if([obj isKindOfClass:[GMYGestureLockViewNode class]]){
                    GMYGestureLockViewNode *node = (GMYGestureLockViewNode *)obj;
                    node.state = GMYGestureLockNodeStateUnSelect;
                }
            }];
            
            [self.path removeAllPoints];
            [self setNeedsDisplay];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}



#pragma mark - Override
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//     UITouch *first = [touches ]
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//}
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//}


@end
