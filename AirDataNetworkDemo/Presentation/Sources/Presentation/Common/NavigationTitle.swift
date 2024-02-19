//
//  NavigationTitle.swift
//  TabbedNative
//
//  Created by Alin Petrus on 26.10.2023.
//

import SwiftUI

public struct NavigationTitle: ViewModifier {
    let title: String
    
    public func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(self.title)
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.orange, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
    }
    
}

public extension View {
    func navigationWithTitle(_ title: String) -> some View {
        modifier(NavigationTitle(title: title))
    }
}
