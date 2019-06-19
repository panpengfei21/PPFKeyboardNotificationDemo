//
//  PPFKeyboardNotification.swift
//  wzer
//
//  Created by Liuming Qiu on 15/12/29.
//  Copyright © 2015年 ZYXiao_. All rights reserved.
//

import UIKit

@objc public protocol PPFKeyboardNotification_delegate:class{
    /**
     键盘将要出现
     
     - parameter modul:           模型的类
     - parameter rect:            键盘的框架尺寸
     - parameter duration:        键盘出现的动画时间
     - parameter animationOption: 键盘出现的动画选项
     */
    func keyboardWillShowWithModul(modul:PPFKeyboardNotification, rect:CGRect,duration:Double,animationOption:UIView.AnimationOptions)
    
    /**
     键盘将要消失
     
     - parameter modul:           模型的类
     - parameter rect:            键盘的框架尺寸
     - parameter duration:        键盘消失的动画时间
     - parameter animationOption: 键盘消失的动画选项
     */
    func keyboardWillHideWithModul(modul:PPFKeyboardNotification,rect:CGRect,duration:Double,animationOption:UIView.AnimationOptions)
}

public class PPFKeyboardNotification: NSObject {
    // MARK: - stored propertices
    ///单例
    public static let share:PPFKeyboardNotification = PPFKeyboardNotification()
    
    ///代理
    public weak var delegate:PPFKeyboardNotification_delegate?
    
    // MARK: - life cycle
    private override init() {
        super.init()
    }
    
    // MARK: 数据处理
    ///加观察器
    public func addObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(PPFKeyboardNotification.keyboardWillShow(noti:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(PPFKeyboardNotification.keyboardWillHide(noti:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    /// 去除观察器
    public func removeObserver(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(noti:NSNotification){
        //取keyboard的frame
        guard let frame = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else{
            fatalError()
        }
        //keyboard 的动画时间
        guard let duration = noti.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double  else{
            fatalError()
        }
        guard let curveOption = noti.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else{
            fatalError()
        }
        delegate?.keyboardWillShowWithModul(modul: self, rect: frame, duration: duration, animationOption: UIView.AnimationOptions(rawValue: curveOption))
    }
    
    @objc func keyboardWillHide(noti:NSNotification){
        //取keyboard的frame
        guard let frame = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else{
            fatalError()
        }
        //keyboard 的动画时间
        guard let duration = noti.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double  else{
            fatalError()
        }
        // keyboard 的动画选项
        guard let curveOption = noti.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt else{
            fatalError()
        }
        delegate?.keyboardWillHideWithModul(modul: self, rect: frame, duration: duration, animationOption: UIView.AnimationOptions(rawValue: curveOption))
    }
}
