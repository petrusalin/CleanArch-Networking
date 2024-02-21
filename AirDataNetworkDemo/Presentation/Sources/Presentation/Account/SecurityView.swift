//
//  SecurityView.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import SwiftUI

struct SecurityView: View {
    @EnvironmentObject var coordinantor: Coordinator<Route.AccountSettings>
    
    @State var password: String = "123456"
    @State var newPassword: String = ""
    @State var confirmPassword: String = ""
    @State var tfaEnabled: Bool = false
    
    var body: some View {
        Form {
            SecureField("Current Password", text: $password)
            SecureField("New Password", text: $newPassword)
            SecureField("Confirm Password", text: $confirmPassword)
            HStack {
                Text("Enable 2 Factor Authentication")
                Spacer()
                Toggle(isOn: $tfaEnabled) {
                    EmptyView()
                }
                .tint(.orange)
            }
            .padding()
        }
        .navigationWithTitle("Security")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    coordinantor.goBack()
                }
            }
        }
    }
}
