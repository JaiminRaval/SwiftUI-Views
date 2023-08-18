//
//  DataBoxView.swift
//  Upw-View
//
//  Created by Jaimin Raval on 18/08/23.
//

import SwiftUI

struct DataBoxView: View {
    var body: some View {
        ZStack {
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 120, height: 100)
                    .foregroundColor(.blue)
            }
        }
    }
}

struct DataBoxView_Previews: PreviewProvider {
    static var previews: some View {
        DataBoxView()
    }
}
