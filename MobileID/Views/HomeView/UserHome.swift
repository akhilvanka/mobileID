//
//  UserHome.swift
//  MobileID
//
//  Created by Akhil Vanka on 2/17/24.
//

import SwiftUI

struct UserHome: View {
    @State var dynamicSize: CGFloat = 55
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack(spacing: 5) {
                        Text("Evening")
                            .font(.largeTitle)
                            .bold()
                            .fontDesign(.serif)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Akhil")
                            .font(.largeTitle)
                            .fontDesign(.serif)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                    Circle()
                        .frame(width: dynamicSize, height: dynamicSize)
                        .padding(.horizontal)
                }
                Text("Favorites")
                    .font(.headline)
                    .fontDesign(.serif)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(0..<3) { index in
                            PriorityCardView(name: "Room \(index)")
                        }
                    }
                }
                .frame(height: 180)
                .scrollClipDisabled()
                Spacer()
                Text("Doors")
                    .font(.headline)
                    .fontDesign(.serif)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                UserGridView()
                Spacer()
            }
            .padding(.all)
        }
        .onAppear {
            UIScrollView.appearance().showsVerticalScrollIndicator = false
        }
    }
}

struct UserHome2: View {
    var body: some View {
        UserHome()
            .background(Color(UIColor.secondarySystemBackground))
            .safeAreaInset(edge: .top) {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 50)
                        .shadow(radius: 2.5)
                    VStack {
                        Text("George Washington")
                            .font(.headline)
                            .monospaced()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("cbord.gwu.edu")
                            .font(.footnote)
                            .monospaced()
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Spacer()
                }
                .padding([.horizontal, .bottom])
                .background(Color(UIColor.systemBackground))
            }
    }
}

struct PriorityCardView: View {
    let name: String
    
    var body: some View {
        FluidGradient(blobs: Color.randomThree(),
                      highlights: Color.randomThree(), speed: 0, blur: 0.75)
            .background(.quaternary)
            .cornerRadius(10)
            .scaledToFit()
            .shadow(radius: 5)
            .overlay(alignment: .bottomTrailing) {
                Text(name)
                    .bold()
                    .foregroundStyle(Color.white)
                    .padding()
            }
    }
}

#Preview("Default") {
    UserHome()
}

#Preview("Ubiquiti Style") {
    UserHome2()
}
