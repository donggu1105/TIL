//
//  TodosView.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/10.
//

import Foundation
import SwiftUI


struct TodosView: View {
    
    
    var body: some View {
        VStack(alignment:.leading){
            
            getHeader()
            
            UISearchBarWrapper()
            
            Spacer()
            List {
                TodoRow()
                TodoRow()
                TodoRow()
                TodoRow()
                TodoRow()
                TodoRow()
                TodoRow()
            }.listStyle(.plain)
        }
    }
    
    fileprivate func getHeader() -> some View {
        Group {
            topHeader
            
            secondHeader
        }.padding(.horizontal, 10)
    }
    
    /// top 헤더
    fileprivate var topHeader : some View {
        Group{
            Text("TodosView / page: 0")
            Text("선택된 할일: []")
            
            HStack{
                Button(action: { }, label: { Text("클로져") })
                    .buttonStyle(MyDefaultBtnStyle())
                
                Button(action: { }, label: { Text("Rx") })
                    .buttonStyle(MyDefaultBtnStyle())
                
                Button(action: { }, label: { Text("콤바인") })
                    .buttonStyle(MyDefaultBtnStyle())
                
                Button(action: { }, label: { Text("Async") })
                    .buttonStyle(MyDefaultBtnStyle())
            }
        }
    }
    
    /// second 헤더
    fileprivate var secondHeader : some View {
        Group{
            Text("Async 변환 액션들")
            
            HStack{
                Button(action: { }, label: { Text("클로져 👉 Async") })
                    .buttonStyle(MyDefaultBtnStyle())
                
                Button(action: { }, label: { Text("Rx 👉 Async") })
                    .buttonStyle(MyDefaultBtnStyle())
                
                Button(action: { }, label: { Text("콤바인 👉 Async") })
                    .buttonStyle(MyDefaultBtnStyle())
            }
            
            HStack{
                Button(action: { }, label: { Text("초기화") })
                    .buttonStyle(MyDefaultBtnStyle(bgColor: .purple))
                
                Button(action: { }, label: { Text("선택된 할일들 삭제") })
                    .buttonStyle(MyDefaultBtnStyle(bgColor: .black))
                
                Button(action: { }, label: { Text("할 일 추가") })
                    .buttonStyle(MyDefaultBtnStyle(bgColor: .gray))
            }
        }
    }
    
}

struct TodosView_Previews: PreviewProvider {
    
    static var previews: some View {
        TodosView()
    }
    
}
