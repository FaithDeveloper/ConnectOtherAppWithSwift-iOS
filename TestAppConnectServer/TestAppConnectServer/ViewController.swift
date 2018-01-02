//
//  ViewController.swift
//  TestAppConnectServer
//
//  Created by kcs on 2017. 10. 30..
//  Copyright © 2017년 kcs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSendApp(_ sender: Any) {
        trueAppInstall(name: "test0001")
    }
    
    //MARK: true App 설치 또는 앱 연결
    func trueAppInstall (name:String) {
        if let appUrl = URL(string: "\(name)://") {
            if UIApplication.shared.canOpenURL(appUrl) {
                UIApplication.shared.open(appUrl, options: [:], completionHandler: nil)
            } else {
                // app store 이동
                openURLToAppStore(urlPath: name)
            }
        }
    }
    
    //MARK : 앱스토어로 이동
    func openURLToAppStore(urlPath : String){
        print("url = \(urlPath)")
        if let url = URL(string: urlPath),
            UIApplication.shared.canOpenURL(url)
        {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}

