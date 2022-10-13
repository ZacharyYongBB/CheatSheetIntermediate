//
//  GeometryReaderExample.swift
//  CheatSheetIntermediate
//
//  Created by Zachary on 13/10/22.
//

import SwiftUI

struct GeometryReaderExample: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    ForEach(0..<20) { index in
                        
                        GeometryReader { GeometryProxy2 in
                            RoundedRectangle(cornerRadius: 20)
                                .rotation3DEffect(Angle(degrees: getPercentage(geo: GeometryProxy2) * 30), axis: (x: 0, y: 1.0, z: 0))
                        }
                        .frame(width: 300, height: 250, alignment: .center)
                        .padding()
                    }
                }
            }
            
            GeometryReader { GeometryProxy in
                HStack (spacing: 0) {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: GeometryProxy.size.width * 0.6666)
                    Rectangle()
                        .fill(Color.blue)
                }
                .ignoresSafeArea()
            }
        }
    }
    
    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).minX
        return Double( 1 - (currentX / maxDistance))
    }
    
}

struct GeometryReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderExample()
    }
}
