//
//  ContentView.swift
//  Upw-View
//
//  Created by Jaimin Raval on 18/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                DataBoxView()
                DataBoxView()
            }
            
            HorizontalCollection()
            HorizontalCollection()
                .padding()
        }
        .padding()
    }
}


struct HorizontalCollection: View {
    var body: some View {
        VStack {
            Text("(WAC)")
                .font(.headline)
                .padding()
                .frame(alignment: .leading)
            HStack {
                DataBoxView()
                DataBoxView()
                DataBoxView()
            }
        }
        .padding(.all, 20)
        .frame(width: 500, height: 200)
        .background(Color.gray)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
