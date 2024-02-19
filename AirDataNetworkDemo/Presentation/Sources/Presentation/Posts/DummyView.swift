//
//  DummyView.swift
//
//
//  Created by Alin Petrus on 19.02.2024.
//

import SwiftUI

struct DummyView: View {
    @Environment(\.coordinator) var coordinator
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button("Pop to Root") {
                    self.coordinator?.popToRoot()
                }
                .tint(.orange)
                Spacer()
            }
            Spacer()
        }
        .navigationWithTitle("Dummy")
    }
}
