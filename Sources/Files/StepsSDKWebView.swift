//
//  File.swift
//  
//
//  Created by Jens Wikholm on 07/03/2023.
//

import SwiftUI
import WebKit
 
struct StepsSDKWebView: UIViewRepresentable {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
