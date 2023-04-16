//
//  ItemOverView.swift
//  ARoute
//
//  Created by Yiwen Zhao on 4/16/23.
//

import SwiftUI

struct ItemOverView: View {
    @State var showDetailView = false;
    var body: some View {
        VStack {
            Image("overview")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    showDetailView.toggle()
                }
            
            Spacer()
        }
        .background(Color.clear)
        
        if (showDetailView) {
            ItemDetailView()
        }
    }
}
