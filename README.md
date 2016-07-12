# MicrometerLevelFormat

##概述：
    MicrometerLevelFormat是一个对于UITextField实现的数字千分位功能的类别。

##图例：
    ![mi](https://raw.githubusercontent.com/demoker/MicrometerLevelFormat/master/mic.gif)

##CocoaPods:
```
pod 'MicrometerLevelFormat', '~> 1.0.0'
```

##使用方法：
    1.添加UITextField+MicrometerLevelFormat到项目工程
    2.在textField delegate方法中打开千分位功能即可，示例代码如下：

    ```
    - (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
       [textField openMicrometerLevelFormat];
       return YES;
    }
    ```

>备注：textfiled的键盘类型必须是数字键盘，因为这里千分位的功能只对数字起作用。😁😁😁

_欢迎大家使用哟！多交流_  附上本人QQ：909352358




