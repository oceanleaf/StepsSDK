//
//  File.swift
//  
//
//  Created by Jens Wikholm on 08/03/2023.
//

import SwiftUI
import TerraiOS

    struct SetupTerraView: View {
        var body: some View {
            NavigationView{
                VStack{
                    
                    Text("Starting TerraiOS...")
                    
                        .navigationTitle("Setup Steps")
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
    

