//
//  MultipleSheetsExample.swift
//  CheatSheetIntermediate
//
//  Created by Zachary on 13/10/22.
//

import SwiftUI

struct RandomModel : Identifiable {
    let id = UUID().uuidString
    let title: String
}

// WAYS THAT WORK
// 1 - use a binding
// 2 - use multiple .sheets
// 3 - use $item

struct MultipleSheetsExample: View {
    
    @State var selectedModel: RandomModel? = nil
//    @State var showSheet: Bool = false
//    @State var showSheet2: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            ForEach(0..<5) { index in
                Button("button index number \(index)") {
                    selectedModel = RandomModel(title: "\(index)")
                }
            }
            
            Button("button 1 ") {
                selectedModel = RandomModel(title: "ONE")
//                showSheet.toggle()
            }
//            .sheet(isPresented: $showSheet) {
//                NextScreen(selectedModel: RandomModel(title: "ONE"))
//            }
            
            Button("button 2 ") {
                selectedModel = RandomModel(title: "TWO")
//                showSheet2.toggle()
            }
//            .sheet(isPresented: $showSheet2) {
//                NextScreen(selectedModel: RandomModel(title: "TWO"))
//            }
        }
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
        }
        
        
//        .sheet(isPresented: $showSheet) {
//
//            // 1 BINDING
//            NextScreen(selectedModel: $selectedModel)
//
//            NextScreen(selectedModel: selectedModel)
//
//            // CONDITIONALS WILL NOT WORK
//        if selectedIndex == 1 {
//                NextScreen(selectedModel: RandomModel(title: "1"))
//            } else if selectedIndex == 2 {
//                NextScreen(selectedModel: RandomModel(title: "2"))
//            } else {
//                NextScreen(selectedModel: RandomModel(title: "starting title"))
//            }
//        }
    }
}

struct NextScreen: View {
    
    // 1 BINDING
//    @Binding var selectedModel: RandomModel
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsExample_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsExample()
    }
}
