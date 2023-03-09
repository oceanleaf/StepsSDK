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
    
    @State private var showOnboarding = false
    @State private var startingWebAuthenticationSession = false
    @State private var progress = 0.6
    
    public init(){
        //
    }
    
    public var body: some View {
        
            VStack{
                
                //Color.gray
                Text("Hello SDK")
                    .font(.headline)
                    .padding(20)
                  
                
//                Gauge(value: 76.0, in: 60.0...85.0) {
//                    Text("ºF")
//                } currentValueLabel: {
//                    Text("76")
//                } minimumValueLabel: {
//                    Text("60")
//                } maximumValueLabel: {
//                    Text("85")
//                }
//                .gaugeStyle(
//                    CircularGaugeStyle(tint:
//                        Gradient(colors: [.green, .yellow, .orange, .red])))
//
//
                
//                ProgressView(value: 0.4) {
//                    Image("coffee_template_small")
//                        .renderingMode(.template)
//                        .foregroundColor(.yellow)
//                }
//                .progressViewStyle(CircularProgressViewStyle(tint: .green))

                
//                Image("widgetDemo", bundle: .module)
//                    .resizable()
//                    .frame(width: 400, height: 380, alignment: .center)
//                    .aspectRatio(contentMode: .fit)
                
                Button {
                    showOnboarding.toggle()
                } label: {
                    Text("Onboarding Modal")
                        .bold()
                }
                .sheet(isPresented: $showOnboarding) {
                    onboarding1()
                }
                
                .frame(width: 300, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                
                
                Button("Terra") {
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
                
                .frame(width: 300, height: 50)
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(20)
                
            }
            .background(.white)
            .cornerRadius(20)
            .shadow(radius: 15)
            .padding(30)
        
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
        request.setValue("testingTerra", forHTTPHeaderField: "dev-id")
        request.setValue("ussv5SAQ53a1nNTxsMr9G41zj2KUhYMk5eDU1hjG", forHTTPHeaderField: "X-API-Key")
        request.httpBody = jsonData
        print(request)
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



