//
//  HashableExample.swift
//  CheatSheetIntermediate
//
//  Created by Zachary on 14/10/22.
//

import SwiftUI

struct MyCustomModel: Hashable {
    
    let title: String
    let subtitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + subtitle)
    }
}

struct HashableExample: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "One", subtitle: "1"),
        MyCustomModel(title: "Two", subtitle: "2"),
        MyCustomModel(title: "Three", subtitle: "3"),
        MyCustomModel(title: "Four", subtitle: "4"),
        MyCustomModel(title: "Five", subtitle: "5")
    ]
    
    var body: some View {
        ScrollView {
            VStack (spacing:40) {
//                ForEach(data) { item in
//                    Text(item.title)
//                        .font(.headline)
//                }
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                    Text(item.subtitle)
                        .font(.subheadline)
                }
            }
        }
    }
}

struct HashableExample_Previews: PreviewProvider {
    static var previews: some View {
        HashableExample()
    }
}
