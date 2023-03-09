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
    
   // @Binding var progress: Float = 11.0
    @State private var showOnboarding = false
    @State private var startingWebAuthenticationSession = false
    
    
    public init(){
        //
    }
    
    public var body: some View {
        
            VStack{
                
                // https://www.simpleswiftguide.com/how-to-build-a-circular-progress-bar-in-swiftui/
                
                ZStack {
                  
                          Circle()
                              .stroke(lineWidth: 35.0)
                              .opacity(0.1)
                              .foregroundColor(Color.blue)
                          
                          Circle()
                        .trim(from: 0.0, to: CGFloat(min(0.3, 0.6)))
                              .stroke(style: StrokeStyle(lineWidth: 35.0, lineCap: .round, lineJoin: .round))
                              .foregroundColor(Color.blue)
                              .rotationEffect(Angle(degrees: 270.0))
                              .animation(.easeInOut, value: 3.0)
                    VStack{
                        Text("GOAL")
                        Text(String(format: "%.0f %%", min(0.5, 1.0)*100.0))
                                  .font(.largeTitle)
                                  .bold()
                        Text("1323 STEPS")
                    }
                 
                      }
                .padding(60)
                  

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
                .background(Color.blue)
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
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(25)
                
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



