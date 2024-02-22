//
//  AccountView.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import Routing
import SwiftUI

struct AccountView: View {
    @EnvironmentObject var coordinantor: Coordinator<Route.AccountSettings>
    
    var body: some View {
        List {
            HStack {
                Text("Profile")
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .onTapGesture {
                self.coordinantor.go(to: .profile)
            }
            HStack {
                Text("Security")
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .onTapGesture {
                self.coordinantor.go(to: .security)
            }
        }
        .navigationWithTitle("Account")
    }
}
