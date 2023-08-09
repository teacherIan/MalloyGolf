//
//  HoleView.swift
//  MalloyGolf
//
//  Created by Ian Malloy on 2023/8/7.
//

import SwiftUI

struct PlayerScoreHoleView: View {
    
    var mulligan: Bool
    var pScore: Int
    var par: Int
    
    
//    var eaglePlus:Bool = true
//    var birdie:Bool = false
//    var bogie:Bool = false
//    var boggiePlus:Bool = false
//    var mulligan:Bool = true
    

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .shadow(color: .black, radius: 10, x: 5, y: 5)
                .opacity(0.0)
            
            if(pScore != 0 && pScore < par  - 1) {// Eagle+
                    Circle()
                        .foregroundColor(.blue)
                        .shadow(color: .blue, radius: 5, x: 1, y: 1)
            } //Eagle
            if(pScore != 0 && pScore == par - 1) {//Birdie
                Circle()
                    .frame(width: UIScreen.main.bounds.width / 7 , height:UIScreen.main.bounds.width / 7)
                    .foregroundColor(.blue)
                    .shadow(color: .blue.opacity(0.7), radius: 5, x: 1, y: 1)
                
                Circle()
                    .frame(width: UIScreen.main.bounds.width / 7 - 5, height:UIScreen.main.bounds.width / 7 - 5)
                    .foregroundColor(.white)
            }//Birdie
            
            if(pScore != 0 && pScore == par + 1) {//bogie
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.red)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: UIScreen.main.bounds.width / 7 - 3, height:UIScreen.main.bounds.width / 7 - 3)
                    .foregroundColor(.white)
            }//bogie
            
            if(pScore != 0 && pScore > par + 1) {//double bogie+
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.red)
                    .shadow(color: .red.opacity(0.9), radius: 5, x: 1, y: 1)
            } //double boggie+
        
            Text(String(pScore))
                .font(.system(size: 30))
                .foregroundColor(abs(par - pScore ) > 1 ? .white : .black)
                .fontWeight(.bold)
            
            if(mulligan) {
                Circle()
                    .frame(width:25, height:25)
                    .position(CGPoint(x: 50, y: 50))
                    .foregroundColor(.purple)
                    .shadow(color: .red.opacity(0.3), radius: 5, x: 0, y: 0)
                    .opacity(0.9)
                
                Text("M")
                    .position(CGPoint(x: 50, y: 50))
                    .foregroundColor(.white)
                    .fontWeight(.black)
            }
            
                
        }
        .frame(width: UIScreen.main.bounds.width / 7, height:UIScreen.main.bounds.width / 7)
    }
}

struct HoleView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerScoreHoleView(mulligan: true, pScore: 3, par: 1)
    }
}
