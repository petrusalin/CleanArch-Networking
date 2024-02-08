//
//  LoadingView.swift
//  AirDataNetworkDemo
//
//  Created by Alin Petrus on 19.01.2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            ProgressView {
                Text("Loading...")
            }
            .controlSize(.large)
            .progressViewStyle(CircularProgressViewStyle())
            Spacer()
        }
    }
}

#Preview {
    LoadingView()
}
