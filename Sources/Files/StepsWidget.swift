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

public struct StepsWidget: View {

    
@State private var showWebView = false
    
    public init(){
        Terra.setUpBackgroundDelivery()
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
            
            NavigationLink(destination: onboarding1()) {
                                Text("Show Detail View")
                            }.navigationBarTitle("Navigation")

          //  getStoryboardVC()
            
            Button {
                print("Hello button 2")
             //   Terra.setUpBackgroundDelivery()
                
//                terraClient.authenticateUser(resource: Resource, completion: @escaping (AuthenticateUserPayload) -> Void)

                
              //  createTerraInstance()
            
            } label: {
                Text("Onboarding Storyboard")
            }
          
            
            .frame(width: 360, height: 60, alignment: .center)
            .foregroundColor(.blue)
            .border(.blue)
            
            //clicked(self)
  
        }
    }
    
    
//    func createTerraInstance(){
//        Terra.instance(devId: "123", referenceId: "123", completion: (TerraManager?, TerraError?) -> Void)
//    }
    
    
    
    func clicked(_ sender: UIButton){
   //     let swiftUIView = SwiftUIView() // << Your view here.
   //     let viewController = UIHostingController(rootView: swiftUIView)
     //   navigationController?.pushViewController(viewController, animated: true)
        
        let storyboard = UIStoryboard(name: "onboarding", bundle: nil)
        storyboard.instantiateViewController(withIdentifier: "onboarding")
    }

 
 
}

struct StepsWidget_Previews: PreviewProvider {
    static var previews: some View {
        StepsWidget()
    }
}


//struct UIKitView: UIViewControllerRepresentable {
//
//    typealias UIViewControllerType = UIKitViewController
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        let sb = UIStoryboard(name: "onboard", bundle: nil)
//        let viewController = sb.instantiateViewController(identifier: "UIKitViewController") as! UIKitViewController
//        return viewController
//
//    }
//}






//public extension UIViewController{
//
//    static func getStoryboardVC() -> UIViewController {
//           let storyboard = UIStoryboard(name: "onboarding", bundle: Bundle.module)
//        return storyboard.instantiateInitialViewController()!
//       }
//}



//struct onboardingStoryboard: UIViewControllerRepresentable {
//
//    func makeUIViewController(context: Context) -> some UIViewController {
//        let storyboard = UIStoryboard(name: "onboarding", bundle: Bundle.module)
//        let controller = storyboard.instantiateInitialViewController()
//        return controller
//       // return storyboard.instantiateInitialViewController()!
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//
//    }
//
//}
