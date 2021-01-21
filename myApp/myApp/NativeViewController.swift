//
//  NativeViewController.swift
//  myApp
//
//  Created by zzw on 2020/9/23.
//  Copyright © 2020 weichuang. All rights reserved.
//

import UIKit
import flutter_boost
import Then
import SnapKit
class NativeViewController: UIViewController {
    
    let pesentButton:UIButton = UIButton().then {
        $0.backgroundColor = UIColor.blue
        $0 .addTarget(self, action: #selector(clickButton(button:)), for: .touchUpInside)
        $0.setTitle("prsent", for: .normal)
        $0.tag = 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = UIColor.white
        
        view.addSubview(self.pesentButton)
        self.pesentButton.snp.makeConstraints {
            $0.left.equalTo(50);
            $0.top.equalTo(view.snp.topMargin).offset(10)
            $0.size.equalTo(CGSize(width: 100, height: 100))
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
    
    @objc func clickButton(button:UIButton)  {
        FlutterBoostPlugin.present("second", urlParams:[kPageCallBackId:"MycallbackId#2"], exts: ["animated":true], onPageFinished: { (_ result:Any?) in
            print(String(format:"call me when page finished, and your result is:%@", result as! CVarArg));
        }) { (f:Bool) in
            print(String(format:"page is presented"));
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
