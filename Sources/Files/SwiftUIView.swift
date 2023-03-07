//
//  SwiftUIView.swift
//  
//
//  Created by Jens Wikholm on 07/03/2023.
//

import SwiftUI
import HealthKit


public struct SwiftUIView: View {
    public init(){
        
       // Terra.setUpBackgroundDelivery()
    }
    public var body: some View {
    
        VStack{
            
            Text("Hello this is the Steps SDK")
            
            Image("widgetDemo", bundle: .module)
                .resizable()
                .frame(width: 400, height: 380, alignment: .center)
                .aspectRatio(contentMode: .fit)
           
            Button("Hello") {
                print("hello")
        }
            .frame(width: 300, height: 60, alignment: .bottom)
            .foregroundColor(.orange)
  
        }
    }
 
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
