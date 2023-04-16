//
//  ItemOverView.swift
//  ARoute
//
//  Created by Yiwen Zhao on 4/16/23.
//

import SwiftUI

struct ItemOverView: View {
    
    var body: some View {
        VStack {
            Image("overview")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .background(Color.clear)
    }
}

struct ItemOverView_Previews: PreviewProvider {
    static var previews: some View {
        ItemOverView()
    }
}
