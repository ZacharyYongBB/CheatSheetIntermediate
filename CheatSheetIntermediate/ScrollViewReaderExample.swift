//
//  ScrollViewReaderExample.swift
//  CheatSheetIntermediate
//
//  Created by Zachary on 13/10/22.
//

import SwiftUI

struct ScrollViewReaderExample: View {
    
    @State var textFieldText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        VStack {
            
            TextField("Enter a # here", text: $textFieldText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Scroll to the # now") {
                withAnimation(.spring()) {
                    
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    } else {
                        textFieldText = "please enter a number from 1-50"
                    }
                    
                    //ScrollViewProxy.scrollTo(19, anchor: .top)
                }
            }

            
            ScrollView {
                
                ScrollViewReader { ScrollViewProxy in
                    
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.easeInOut(duration: 2)) {
                            ScrollViewProxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                }
                
            }
        }
    }
}

struct ScrollViewReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewReaderExample()
    }
}
