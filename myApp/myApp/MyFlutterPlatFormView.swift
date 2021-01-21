//
//  MyFlutterPlatFormView.swift
//  myApp
//
//  Created by zzw on 2021/1/2.
//  Copyright © 2021 weichuang. All rights reserved.
//

import UIKit
import Flutter
import Then
class MyFlutterPlatFormView: NSObject {
    var viewId:int_fast64_t

    let flutterLabel:UILabel = {
        let lab = UILabel()
        lab.textColor = .white
        lab.textAlignment = .center
        lab.backgroundColor = .blue
        return lab
    }()
    init(withFrame frame:CGRect,viewIdentifier viewId:int_fast64_t,arguments args:Any) {
        self.viewId = viewId
        self.flutterLabel.frame = frame;
        let dict:Dictionary<String,String> = args as! Dictionary<String,String>
        self.flutterLabel.text = dict["text"]!
    }
}

extension MyFlutterPlatFormView:FlutterPlatformView{

    func view() -> UIView {
        return flutterLabel
    }
}
