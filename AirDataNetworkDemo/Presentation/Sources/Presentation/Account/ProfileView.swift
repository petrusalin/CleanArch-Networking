//
//  ProfileView.swift
//  
//
//  Created by Alin Petrus on 21.02.2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var coordinantor: Coordinator<Route.AccountSettings>
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 100)
            Image(systemName: "person.crop.circle")
                .resizable()
                .foregroundStyle(.orange)
                .frame(width: 200, height: 200)
                .scaledToFit()
                .frame(alignment: .center)
            Text("Username: -")
                .frame(alignment: .center)
            Spacer()
        }
        .navigationWithTitle("Profile")
    }
}
