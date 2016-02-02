//
//  AboutViewController.swift
//  HitMe
//
//  Created by Mac on 16/1/21.
//  Copyright © 2016年 Aispb. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView:UIWebView!
    
    //  关闭
    @IBAction  func close(){
        dismissViewControllerAnimated(true, completion: nil);
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        let url = NSURL.fileURLWithPath("http://www.google.com")
//        let request:NSURLRequest = NSURLRequest(URL: url)
//        webView.loadRequest(request)
        let url = NSURL(string:"http://www.google.com")!
        let request: NSURLRequest = NSURLRequest(URL: url)
        webView.loadRequest(request)    }
}
