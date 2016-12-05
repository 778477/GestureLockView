//
//  GMYQuickSqrt.c
//  Pods
//
//  Created by miaoyou.gmy on 2016/12/5.
//
//

#include "GMYQuickSqrt.h"

int quickSqrt(int x){
    float f = x;
    int valInt = *(int *)&f;
    valInt = (1 << 29) + (valInt >> 1) - (1 << 2)  + 2; // guess the star number
    f = *(float *)&valInt;
    
    double val = f;
    val = 0.5*val + 0.5*x / val;
    val = 0.5*val + 0.5*x / val;
    val = 0.5*val + 0.5*x / val;
    val = 0.5*val + 0.5*x / val;
    
    return val;
}
