//
//  DummyView.swift
//
//
//  Created by Alin Petrus on 19.02.2024.
//

import SwiftUI

struct DummyView: View {
    @EnvironmentObject var router: Router<Route.Posts>
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button("Pop to Root") {
                    self.router.popToRoot()
                }
                .tint(.orange)
                Spacer()
            }
            Spacer()
        }
        .navigationWithTitle("Dummy")
    }
}
