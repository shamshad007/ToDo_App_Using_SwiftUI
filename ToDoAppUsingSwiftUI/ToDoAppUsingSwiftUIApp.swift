//
//  ToDoAppUsingSwiftUIApp.swift
//  ToDoAppUsingSwiftUI
//
//  Created by Code with Shamshad on 08/12/23.
//

import SwiftUI

@main
struct ToDoAppUsingSwiftUIApp: App {

   @StateObject  var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(.stack) // for using app in iphone and ipad we need to be used navigation stack
            .environmentObject(listViewModel)
        }
    }
}
