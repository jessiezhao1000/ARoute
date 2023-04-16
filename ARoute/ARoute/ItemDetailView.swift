//
//  ItemDetailView.swift
//  ARoute
//
//  Created by Yiwen Zhao on 4/16/23.
//

import SwiftUI

struct ItemDetailView: View {
    @State var showLabel = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("title")
                    .padding(.leading, 20)
                    .padding(.top, 20)
                    .padding(.trailing, 20)
                    .padding(.bottom, 10)
                Image("price")
                    .padding(.leading, 20)
                    .padding(.top, 10)
                    .padding(.trailing, 20)
                    .padding(.bottom, 10)
                Image("expiration date")
                    .padding(.leading, 20)
                    .padding(.top, 10)
                    .padding(.trailing, 20)
                    .padding(.bottom, 10)
                HStack {
                    Text("Nutritious Values")
                        .fontWeight(.medium)
                        .font(.system(size:20))
                      
                    Spacer()
                    Button("See Label") {
                        showLabel.toggle()
                    }
                }
                .padding(.leading, 20)
                .padding(.top, 10)
                .padding(.trailing, 20)
                .padding(.bottom, 10)
                
                Image("nutritious values")
                    .padding(.leading, 20)
                    .padding(.top, 10)
                    .padding(.trailing, 20)
                    .padding(.bottom, 10)
                
                if (showLabel) {
                    Image("label")
                        .padding(.leading, 20)
                        .padding(.top, 10)
                        .padding(.trailing, 20)
                        .padding(.bottom, 10)
                }
                Text("You may also like")
                    .fontWeight(.medium)
                    .font(.system(size:20))
                    .padding(.leading, 20)
                    .padding(.top, 10)
                    .padding(.trailing, 20)
                    .padding(.bottom, 10)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        Image("opt1")
                        Image("opt2")
                        Image("opt3")
                    }
                    .padding(.leading, 20)
                    .padding(.top, 10)
                    .padding(.trailing, 20)
                    .padding(.bottom, 10)
                }
                Group {
                    Text("Review")
                        .fontWeight(.medium)
                        .font(.system(size:20))
                        .padding(.leading, 20)
                        .padding(.top, 10)
                        .padding(.trailing, 20)
                        .padding(.bottom, 10)
                    
                    Image("review")
                        .padding(.leading, 20)
                        .padding(.top, 10)
                        .padding(.trailing, 20)
                        .padding(.bottom, 10)
                    
                    Image("comment section")
                        .padding(.leading, 20)
                        .padding(.top, 10)
                        .padding(.trailing, 20)
                        .padding(.bottom, 10)
                    
                }
            }
        }
        .background(Color.white)
        .background(Color.black.opacity(0.05))
        .ignoresSafeArea(.all)
        
    }
}

/*
 struct ItemDetailView_Previews: PreviewProvider {
 static var previews: some View {
 ItemDetailView()
 }
 }
 */
