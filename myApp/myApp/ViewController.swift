//
//  ViewController.swift
//  myApp
//
//  Created by zzw on 2020/9/1.
//  Copyright © 2020 weichuang. All rights reserved.
//

import UIKit
import flutter_boost
import Then
import SnapKit
class ViewController: UIViewController {
    var collectionView:UICollectionView?
    var callBack:FLBVoidCallback!
    
    let pesentButton:UIButton = UIButton().then {
        $0.backgroundColor = UIColor.blue
        $0 .addTarget(self, action: #selector(clickButton(button:)), for: .touchUpInside)
        $0.setTitle("prsent", for: .normal)
        $0.tag = 1
    }
    let sendEventButton:UIButton = UIButton().then {
        $0.backgroundColor = UIColor.red
        $0 .addTarget(self, action: #selector(clickButton(button:)), for: .touchUpInside)
        $0.setTitle("pushSearchPage", for: .normal)
        $0.tag = 2
    }
    let pushButton:UIButton = {
        
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(clickButton(button:)), for: .touchUpInside)
        button.setTitle("pushButton", for: .normal)
        button.tag = 0;
        return button
        
    }()
    var name:String?
    
    lazy var lazyName = "my is a lazy"
    
    var myName:String {
        get{
            return "myName"
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(self.pushButton)
        view.addSubview(self.pesentButton)
        view.addSubview(self.sendEventButton)
        self.pushButton.snp.makeConstraints {
            $0.left.equalTo(50);
            $0.top.equalTo(view.snp.topMargin);
            $0.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        self.pesentButton.snp.makeConstraints {
            $0.left.equalTo(50);
            $0.top.equalTo(self.pushButton.snp.bottom).offset(10)
            $0.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        self.sendEventButton.snp.makeConstraints {
            $0.left.equalTo(50);
            $0.top.equalTo(self.pesentButton.snp.bottom).offset(10)
            $0.size.equalTo(CGSize(width: 100, height: 100))
        }
        
        
        callBack =  FlutterBoostPlugin.sharedInstance().addEventListener({ (name, para) in
            print("\(String(describing: name)) \(String(describing: para))")
        }, forName: "flutter-native")
        
//        self.callBack();
    }
    
    
    @objc func clickButton(button:UIButton)  {
        
        
        switch button.tag {
        case 0:
            FlutterBoostPlugin.open("/Home", urlParams:[kPageCallBackId:"MycallbackId#1"], exts: ["animated":true], onPageFinished: { (_ result:Any?) in
                print(String(format:"call me when page finished, and your result is:%@", result as! CVarArg));
            }) { (f:Bool) in
                print(String(format:"page is opened"));
            }
            
        case 1:
            FlutterBoostPlugin.present("second", urlParams:[kPageCallBackId:"MycallbackId#2"], exts: ["animated":true], onPageFinished: { (_ result:Any?) in
                print(String(format:"call me when page finished, and your result is:%@", result as! CVarArg));
            }) { (f:Bool) in
                print(String(format:"page is presented"));
            }
        case 2:
            FlutterBoostPlugin.open("/SearchPage", urlParams:[kPageCallBackId:"MycallbackId#3"], exts: ["animated":true], onPageFinished: { (_ result:Any?) in
                print(String(format:"call me when page finished, and your result is:%@", result as! CVarArg));
            }) { (f:Bool) in
                print(String(format:"page is opened"));
            }
            
        default:
            print("错误")
        }
        
    }
}

