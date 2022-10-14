//
//  ArraysExample.swift
//  CheatSheetIntermediate
//
//  Created by Zachary on 14/10/22.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

// View Model
class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
       
        // SORT
//        filteredArray = dataArray.sorted { user1, user2 -> Bool in
//            return user1.points > user2.points
//        }
        
//        filteredArray = dataArray.sorted(by: {$0.points > $1.points})
        
        
        // FILTER
//        filteredArray = dataArray.filter({ user -> Bool in
//            return user.name.contains("a")
//        })
        
//        filteredArray = dataArray.filter({ $0.isVerified })
        
        // MAP
//        mappedArray = dataArray.map({ user -> String in
//            return user.name ?? "Error"
//        })
        
//        mappedArray = dataArray.map({ $0.name })
        
        //accepts optional name string
//        mappedArray = dataArray.compactMap({ user -> String? in
//            return user.name
//        })
        
//        mappedArray = dataArray.compactMap({ $0.name })
        
        
        mappedArray = dataArray
                .sorted(by: { $0.points > $1.points })
                .filter({ $0.isVerified })
                .compactMap({ $0.name })
        
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Zach", points: 88, isVerified: true)
        let user2 = UserModel(name: "Betty", points: 72, isVerified: false)
        let user3 = UserModel(name: "Christine", points: 64, isVerified: true)
        let user4 = UserModel(name: "Ditto", points: 95, isVerified: false)
        let user5 = UserModel(name: "Francis", points: 14, isVerified: true)
        let user6 = UserModel(name: "Gabriel", points: 33, isVerified: true)
        let user7 = UserModel(name: "Hannah", points: 25, isVerified: true)
        let user8 = UserModel(name: "Ivern", points: 12, isVerified: false)
        let user9 = UserModel(name: "Jessica", points: 10, isVerified: true)
        let user10 = UserModel(name: "Kelly", points: 78, isVerified: true)
        self.dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
        ])
    }
    
}

struct ArraysExample: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
//                ForEach(vm.filteredArray) { user in
//                    VStack (alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "checkmark")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(user.points >= 50 ? Color.purple : Color.red)
//                    .cornerRadius(10)
//                    .padding(.horizontal)
//                }
                
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
            }
        }
    }
}

struct ArraysExample_Previews: PreviewProvider {
    static var previews: some View {
        ArraysExample()
    }
}
