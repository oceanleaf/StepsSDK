//
//  File.swift
//  
//
//  Created by Jens Wikholm on 07/03/2023.
//




import SwiftUI
import WebKit
 
struct StepsSDKWebView: UIViewRepresentable  {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

//
//import Foundation
//import UIKit
//import WebKit
//
//public class StepsSDKWebView: WKWebView {
//
//    public init() {
//        let webConfiguration = WKWebViewConfiguration()
//        webConfiguration.preferences.javaScriptEnabled = true
//        super.init(frame: .zero, configuration: webConfiguration)
//        self.scrollView.isScrollEnabled = true
//        self.isMultipleTouchEnabled = true
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//
//    @discardableResult
//    public func load() -> WKNavigation? {
//        if let url = URL(string:"http://google.com") {
//            let req = URLRequest(url: url)
//            return super.load(req)
//        }
//        return nil
//    }
//}
