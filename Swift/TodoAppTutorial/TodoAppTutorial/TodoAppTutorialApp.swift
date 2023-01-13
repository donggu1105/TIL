//
//  TodoAppTutorialApp.swift
//  TodoAppTutorial
//
//  Created by web_dev on 2023/01/12.
//

import SwiftUI

@main
struct TodoAppTutorialApp: App {
    
    
    var body: some Scene {
        WindowGroup {
            TabView {
                
                TodosView()
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("SwfitUI")
                    }
                
                // uikit -> swiftui로 가져오기
                MainVC
                    .instantiate()
                    .getRepresentable()
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("UIKit")
                    }
            }
            
        }
    }
}
