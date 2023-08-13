//
//  TabView.swift
//  GolfSetup
//
//  Created by Ian Malloy on 2023/8/6.
//

import SwiftUI

struct TabView: View {
    
    var courseName:String
    var icon:String
    var date:Date
    var isActiveGame:Bool
    
    
    
    var body: some View {
        
                
                    ZStack {

                        RoundedRectangle(cornerRadius: 20)
                            .frame(maxWidth: .infinity, maxHeight: 120).foregroundColor(isActiveGame ? .blue : .red).opacity(0.8)
                            .shadow(color: isActiveGame ? .blue.opacity(0.9) : .red.opacity(0.5), radius: 5, x: 5, y: 5)
                            .padding()
                            
                            
                            
                        
                        HStack(spacing:10) {
                            
                            Text(courseName)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.title)
                                .padding()
                            
//                            Spacer()
                            
                            Image(systemName: icon)
                                .frame(width:80)
                            .font(.system(size: 70))
                            .foregroundColor(.white)
                            .shadow(color: .white.opacity(0.2), radius: 5, x: 0, y: 0)
                            .fontWeight(.bold)
                            .padding()
                            
//                            Spacer()
                            
                            if(isActiveGame) {
                                Text(date.formatted(.dateTime))
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                        }
                        
                        
                            
                    } //ZStack
                    
                    .navigationTitle("Home")
                    
                    
                }
        
    
    //Navigation Link
                
//                Spacer()
                
            
        }
    


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(courseName: "Shanghai Course", icon: "figure.golf", date: Date.now, isActiveGame: false)
    }
}

