//
//  File.swift
//  
//
//  Created by Jens Wikholm on 07/03/2023.
//

import Foundation
import UIKit
import WebKit
// import TerraiOS

public class StepsSDKWebView: WKWebView {
    
    public init() {
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.preferences.javaScriptEnabled = true
        super.init(frame: .zero, configuration: webConfiguration)
        self.scrollView.isScrollEnabled = false
        self.isMultipleTouchEnabled = false
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    @discardableResult
    public func load() -> WKNavigation? {
        if let url = URL(string:"http://google.com") {
            let req = URLRequest(url: url)
            return super.load(req)
        }
        return nil
    }
}
