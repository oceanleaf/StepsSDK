//
//  SwiftUIView 2.swift
//  
//
//  Created by Jens Wikholm on 08/03/2023.
//

import SwiftUI

struct onboarding1: View {
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Hello, World!")
                
                    .navigationTitle("Welcome")
                    .offset(y: -60)
                
                NavigationLink(destination: onboarding2(), label: { Text("Join the Race")
                        .bold()
                        .frame(width: 300, height: 50)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                    
                })
            }
        }
    }
}


struct onboarding2: View {
    var body: some View {

            VStack{
                
                Text("Hello, World!")
                
                    .navigationTitle("Walking just got really fun!")
                    .offset(y: -60)
                
                NavigationLink(destination: Text("testview"), label: { Text("Next")
                        .bold()
                        .frame(width: 300, height: 50)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                    
                })
            }
      
    }
}








struct onboarding1_Previews: PreviewProvider {
    static var previews: some View {
        onboarding1()
    }
}
