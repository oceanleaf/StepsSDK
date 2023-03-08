//
//  SwiftUIView.swift
//  
//
//  Created by Jens Wikholm on 07/03/2023.
//

import SwiftUI
import HealthKit
import TerraiOS

public struct SwiftUIView: View {
    
//    static func createViewController() -> onboardingWelcome {
//            let storyboard = UIStoryboard(name: "onboarding", bundle: Bundle.module)
//            return storyboard.instantiateInitialViewController() as! onboardingWelcome
//        }
    
    
@State private var showWebView = false
    
    public init(){
        
        Terra.setUpBackgroundDelivery()
    }
    public var body: some View {
    
        VStack{
            
            Text("Hello this is the Steps SDK")
            
            Image("widgetDemo", bundle: .module)
                .resizable()
                .frame(width: 400, height: 380, alignment: .center)
                .aspectRatio(contentMode: .fit)
                
            
            Button {
                showWebView.toggle()
            } label: {
                Text("Simple Webview")
            }
            .sheet(isPresented: $showWebView) {
                StepsSDKWebView(url: URL(string: "https://www.appcoda.com")!)
            }
            .frame(width: 300, height: 60, alignment: .center)
            .foregroundColor(.orange)
            
            
        ////
            

            
            Button {
                print("Hello button 2")
                
                let storyboard = UIStoryboard(name: "onboarding", bundle: Bundle.module)
                storyboard.instantiateInitialViewController()
                
               // let swiftUIView = SwiftUIView() // << Your view here.
//                    let viewController = UIHostingController(rootView: swiftUIView)
//                    navigationController?.pushViewController(viewController, animated: true)
                
                
                
//                let onboardingWelcome = storyboard.instantiateInitialViewController(withIdentifier: "onboardingWelcome") as! onboardingWelcome
//
//                let viewController = UIHostingController(rootView: onboardingWelcome)
//                navigationController?.pushViewController(viewController, animated: true)
                
//                let onboardingWelcome = SwiftUIView.createViewController()
//
//                onboardingWelcome.title = "hello"

                
                
                
//                let storyboard = UIStoryboard(name: "onboarding", bundle: Bundle.module)
//                return storyboard.instantiateInitialViewController() as! ViewController
//
//
//                let storyboard = UIStoryboard(name: "onboarding.storyboard", bundle: Bundle.module)
//
//                print(storyboard)
//                storyboard.instantiateViewController(withIdentifier: "onboardingWelcome")
            
            } label: {
                Text("Onboard")
            }
            
            .frame(width: 300, height: 60, alignment: .center)
            .foregroundColor(.blue)
            
            //clicked(self)
  
        }
    }
    
    
    func clicked(_ sender: UIButton){
   //     let swiftUIView = SwiftUIView() // << Your view here.
   //     let viewController = UIHostingController(rootView: swiftUIView)
     //   navigationController?.pushViewController(viewController, animated: true)
        
        let storyboard = UIStoryboard(name: "onboarding", bundle: nil)
        storyboard.instantiateViewController(withIdentifier: "onboarding")
    }

 
 
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}



//public extension UIViewController{
//
//    static func getStoryboardVC() -> UIViewController {
//           let storyboard = UIStoryboard(name: "onboardingWelcome"(describing: self), bundle: StepSDK) // Use Bundle.module
//           return storyboard.instantiateInitialViewController()!
//       }
//}
