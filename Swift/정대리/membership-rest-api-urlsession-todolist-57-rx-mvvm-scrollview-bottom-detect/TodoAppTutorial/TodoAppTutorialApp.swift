//
//  TodoAppTutorialApp.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/09.
//

import SwiftUI

@main
struct TodoAppTutorialApp: App {
    
    @State var selectedTab: Int = 1
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                TodosView()
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("SwiftUi")
                    }
                    .tag(0)
                
                MainVC.instantiate()
                    .getRepresentable()
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("UIKit")
                    }
                    .tag(1)
            }
        }
    }
}
