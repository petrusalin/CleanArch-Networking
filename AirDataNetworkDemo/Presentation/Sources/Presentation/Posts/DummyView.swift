//
//  DummyView.swift
//
//
//  Created by Alin Petrus on 19.02.2024.
//

import Routing
import SwiftUI

struct DummyView: View {
    @EnvironmentObject var coordinantor: Coordinator<Route.Posts>
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button("Pop to Root") {
                    self.coordinantor.navigateToRoot()
                }
                .tint(.orange)
                Spacer()
            }
            Spacer()
        }
        .navigationWithTitle("Dummy")
    }
}
