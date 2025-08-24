//
//  EmptyContentView.swift
//  Paws
//
//  Created by Monica Kennedy on 2025-08-23.
//

import SwiftUI

struct EmptyContentView: View {
    
    var title: String
    var icon: String
    var description: String
    
    var body: some View {
        ContentUnavailableView {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 96)
            
            Text(title)
                .font(.title)
        
        }
        description : {
            Text(description)
        }
        .foregroundStyle(.tertiary)

    }
        
}

#Preview {
    EmptyContentView(title: "No Photo", icon: "cat.circle", description: "Add a photo to get started")
}
