//
//  ContentView.swift
//  StretchyHeaderSwiftUI
//
//  Created by JEONGSEOB HONG on 2021/05/12.
//

import SwiftUI

struct CardData {
    let id: Int
    let title: String
}

struct ContentView: View {
    let appName = ["insta", "facebook", "tictok", "message", "weChat"]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                GeometryReader { proxy in
                    let global = proxy.frame(in: .global)
                    // Header
                    Image("poster")
                        .resizable()
                        .offset(y: global.minY > 0 ? -global.minY : 0)
                        .frame(
                            height: global.minY > 0 ?
                                (UIScreen.main.bounds.height/2.2) + global.minY :
                                (UIScreen.main.bounds.height/2.2)
                        )
                }
                .frame(height: UIScreen.main.bounds.height/2.2)
                
                VStack {
                    ForEach(1...5, id: \.self) { num in
                        let data = CardData(
                            id: num,
                            title: self.appName[num - 1])
                        
                        CardView(data: data)
                            .padding()
                    }
                    
                    
                }
            }
        }
    }
}

struct CardView: View {
    
    let data: CardData
    
    var body: some View {
        HStack {
            Image("app\(data.id)")
                .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(data.title)
                    .bold()
                    .font(.system(size: 24))
                
                Text("Offers In-app Purchases")
                    .font(.system(size: 20))
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Text("Get")
                    .padding()
                    .foregroundColor(Color.blue)
                    .background(Color(.systemGray6))
                    .cornerRadius(6)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
