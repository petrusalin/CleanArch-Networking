//
//  AddPostView.swift
//
//
//  Created by Alin Petrus on 21.02.2024.
//

import SwiftUI

struct AddPostView: View {
    @State var title: String = ""
    @State var bodyText: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Form {
            TextField("Title", text: self.$title)
            TextField("Body", text: self.$bodyText, axis: .vertical)
        }
        .navigationWithTitle("Add Post")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    dismiss()
                }
            }
        }
        .tint(.white)
    }
}

#Preview {
    NavigationStack {
        AddPostView()
    }
}
