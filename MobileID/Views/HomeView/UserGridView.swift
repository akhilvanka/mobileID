//
//  UserGridView.swift
//  MobileID
//
//  Created by Akhil Vanka on 2/17/24.
//

import SwiftUI

struct UserGridView: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
            ForEach(1..<8) { element in
                LockElement()
                    .frame(height: 175)
            }
        })
    }
}

struct LockElement: View {
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                    
                }, label: {
                    Image(systemName: "star")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.primary)
                })
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName: "lock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(Color.primary)
                        .contentShape(Rectangle())
                })
            }
            Spacer()
            VStack(alignment: .leading) {
                Spacer()
                Text("123 Hard St")
                    .font(.subheadline)
//                    .fontDesign(.serif)
                    .monospaced()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.gray.opacity(0.1))
            .shadow(radius: 10))
//        .shadow(radius: 5)
    }
}

#Preview {
    UserGridView()
}

#Preview {
    LockElement()
}
