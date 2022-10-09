//
//  RotationGestureExample.swift
//  CheatSheetIntermediate
//
//  Created by Zachary on 9/10/22.
//

import SwiftUI

struct RotationGestureExample: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(50)
            .background(Color.blue)
            .cornerRadius(10)
            .rotationEffect(angle)
            .gesture(
            RotationGesture()
                .onChanged({ Angle in
                    angle = Angle
                })
                .onEnded({ value in
                    withAnimation(.spring()) {
                        angle = Angle(degrees: 0)
                    }
                })
            )
            
    }
}

struct RotationGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureExample()
    }
}
