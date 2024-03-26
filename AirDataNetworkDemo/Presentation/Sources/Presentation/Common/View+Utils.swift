//
//  View+Utils.swift
//
//
//  Created by Alin Petrus on 18.03.2024.
//

import SwiftUI

extension View {
    
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
}
