//
//  SearchBarView.swift
//  taiwan_gogo
//
//  Created by Brian Chou on 2024/4/14.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String

    @State private var isEditing = false
    @State private var buttonOffset: Double = 0

    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }

            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    //                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("取消")
                }
                .padding(.trailing, 10)
                .offset(x: buttonOffset)
                .transition(.move(edge: .trailing))
                .transition(.move(edge: .leading))
                .animation(.smooth.speed(0.5), value: buttonOffset)
                
            }
        }
    }
}

#Preview {
    SearchBarView(text: .constant(""))
}
