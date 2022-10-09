//
//  MagnificationGestureExample.swift
//  CheatSheetIntermediate
//
//  Created by Zachary on 9/10/22.
//

import SwiftUI

struct MagnificationGestureExample: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding(40)
                .background(Color.red)
                .cornerRadius(10)
                .font(.title)
                .scaleEffect(1 + currentAmount + lastAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged{ value in
                            currentAmount = value - 1
                        }
                        .onEnded{ value in
                            lastAmount = lastAmount + currentAmount
                            currentAmount = 0
                        }
                )
            
            VStack (spacing: 15) {
                HStack {
                    Circle().frame(width: 35, height: 35)
                    Text("Zachary")
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .padding(.horizontal)
                
                Rectangle().frame(height: 300)
                    .scaleEffect(1 + currentAmount)
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ value in
                                currentAmount = value - 1
                            })
                            .onEnded({ value in
                                withAnimation(.spring(blendDuration: 0.3)) {
                                    currentAmount = 0
                                }
                            })
                    )
                
                HStack {
                    Image(systemName: "heart.fill")
                    Image(systemName: "text.bubble.fill")
                    Spacer()
                    
                }
                .padding(.horizontal)
                .font(.headline)
                
                Text("This is the caption for my photo!")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
            }
        }
        
    }
}

struct MagnificationGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureExample()
    }
}
