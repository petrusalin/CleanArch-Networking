//
//  AddPostView.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import Routing
import SwiftUI

struct AddPostView: View {
    @State var title: String = ""
    @State var bodyText: String = ""
    @EnvironmentObject var coordinantor: Coordinator<Route.Posts>
    
    var body: some View {
        Form {
            TextField("Title", text: self.$title)
            TextField("Body", text: self.$bodyText, axis: .vertical)
        }
        .navigationWithTitle("Add Post")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    coordinantor.navigateBack()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    coordinantor.navigateBack()
                }
            }
        }
        .tint(.white)
    }
}
