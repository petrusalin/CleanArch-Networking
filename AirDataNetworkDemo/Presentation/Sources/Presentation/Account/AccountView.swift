//
//  AccountView.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var coordinantor: Coordinator<Route.AccountSettings>
    
    var body: some View {
        List {
            Text("Profile")
                .onTapGesture {
                    self.coordinantor.go(to: .profile)
                }
            Text("Security")
                .onTapGesture {
                    self.coordinantor.go(to: .security)
                }
        }
    }
}
