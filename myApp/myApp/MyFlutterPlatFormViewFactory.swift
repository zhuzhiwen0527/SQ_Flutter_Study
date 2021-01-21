//
//  MyFlutterPlatFormViewFactory.swift
//  myApp
//
//  Created by zzw on 2021/1/2.
//  Copyright © 2021 weichuang. All rights reserved.
//

import UIKit
import Flutter
class MyFlutterPlatFormViewFactory: NSObject {

}

extension MyFlutterPlatFormViewFactory:FlutterPlatformViewFactory{

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {

        return MyFlutterPlatFormView.init(withFrame: frame, viewIdentifier: viewId, arguments: args ?? ["text":"传值失败"])
    }

    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }

}
