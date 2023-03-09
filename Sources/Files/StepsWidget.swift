//
//  SwiftUIView.swift
//  
//
//  Created by Jens Wikholm on 07/03/2023.
//

import SwiftUI
import HealthKit
import TerraiOS
import UIKit
import BetterSafariView

public struct StepsWidget: View {
    
    @State private var showWebView = false
    @State private var showOnboarding = false
    @State private var showTerra = false
    @State private var startingWebAuthenticationSession = false
    
    public init(){
        //
    }
    
    public var body: some View {
        
        VStack{
            
            Image("widgetDemo", bundle: .module)
                .resizable()
                .frame(width: 400, height: 380, alignment: .center)
                .aspectRatio(contentMode: .fit)
            
            
            Button {
                print("Hello button 1")
                showWebView.toggle()
            } label: {
                Text("Simple Webview")
            }
            .sheet(isPresented: $showWebView) {
                StepsSDKWebView(url: URL(string: "https://www.appcoda.com")!)
            }
            .frame(width: 360, height: 60, alignment: .center)
            .foregroundColor(.orange)
            .border(.orange)
            
            
            
            Button {
                showOnboarding.toggle()
            } label: {
                Text("Onboarding Modal")
            }
            .sheet(isPresented: $showOnboarding) {
                onboarding1()
            }
            .frame(width: 360, height: 60, alignment: .center)
            .foregroundColor(.orange)
            .border(.orange)
            
            
            Button("Start WebAuthenticationSession") {
                self.startingWebAuthenticationSession = true
            }
            .webAuthenticationSession(isPresented: $startingWebAuthenticationSession) {
                WebAuthenticationSession(
                    url: URL(string: getSessionId())!,
                    callbackURLScheme: "tryterra"
                ) { callbackURL, error in
                    if let callbackURL = callbackURL {
                        print(callbackURL.absoluteString)
                    }
                    if let error = error{
                        print(error)
                    }
                }
            }
            
            .frame(width: 360, height: 60, alignment: .center)
            .foregroundColor(.orange)
            .border(.orange)
 
        }
    }
    
    
    
    struct TerraWidgetSessionCreateResponse:Decodable{
        var status: String = String()
        var url: String = String()
        var session_id: String = String()
    }
    
    
    //Generate Session ID -> URL (RECOMMENDED THAT THIS IS DONE ON THE BACKEND, THIS IS JUST FOR A DEMO)
    
    func getSessionId() -> String{
        let session_url = URL(string: "https://api.tryterra.co/v2/auth/generateWidgetSession")
        var url = ""
        var request = URLRequest(url: session_url!)
        let requestData = ["reference_id": "testing", "providers" : "APPLE, GOOGLE, GARMIN", "language": "EN"]
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "widget.Terra")
        let jsonData = try? JSONSerialization.data(withJSONObject: requestData)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("YOUR_DEV_ID", forHTTPHeaderField: "dev-id")
        request.setValue("YOUR_X_API_KEY", forHTTPHeaderField: "X-API-Key")
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let data = data{
                let decoder = JSONDecoder()
                do{
                    let result = try decoder.decode(TerraWidgetSessionCreateResponse.self, from: data)
                    url = result.url
                    group.leave()
                }
                catch{
                    print(error)
                }
            }
        }
        group.enter()
        queue.async(group:group) {
            task.resume()
        }
        group.wait()
        return url
    }
    
}

struct StepsWidget_Previews: PreviewProvider {
    static var previews: some View {
        StepsWidget()
    }
}

