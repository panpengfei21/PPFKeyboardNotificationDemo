# PPFKeyboardNotificationDemo

## 引用
pod 'PPFIndicator'

## 使用

1.增加观察者和代理 
```
PPFKeyboardNotification.share.addObserver()
PPFKeyboardNotification.share.delegate = self
```

2.删除观察者
```
PPFKeyboardNotification.share.removeObserver()
PPFKeyboardNotification.share.delegate = nil
```

3.实现代理
```
PPFKeyboardNotification_delegate
```
```
func keyboardWillShowWithModul(modul: PPFKeyboardNotification, rect: CGRect, duration: Double, animationOption: UIView.AnimationOptions) {
    print("键盘将要显现")
}
    
func keyboardWillHideWithModul(modul: PPFKeyboardNotification, rect: CGRect, duration: Double, animationOption: UIView.AnimationOptions) {
    print("键盘将要隐藏")
}
```
