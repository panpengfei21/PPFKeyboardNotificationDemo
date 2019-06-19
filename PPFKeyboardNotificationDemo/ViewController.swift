//
//  ViewController.swift
//  PPFKeyboardNotificationDemo
//
//  Created by 潘鹏飞 on 2019/6/18.
//  Copyright © 2019 潘鹏飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PPFKeyboardNotification.share.addObserver()
        PPFKeyboardNotification.share.delegate = self
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        PPFKeyboardNotification.share.removeObserver()
    }
    
}

// MARK: - PPFKeyboardNotification_delegate
extension ViewController:PPFKeyboardNotification_delegate {
    func keyboardWillShowWithModul(modul: PPFKeyboardNotification, rect: CGRect, duration: Double, animationOption: UIView.AnimationOptions) {
        print("viewC will show")
    }
    
    func keyboardWillHideWithModul(modul: PPFKeyboardNotification, rect: CGRect, duration: Double, animationOption: UIView.AnimationOptions) {
        print("viewC will hide")
    }
}

