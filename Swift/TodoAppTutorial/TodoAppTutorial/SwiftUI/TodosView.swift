//
//  TodosView.swift
//  TodoAppTutorial
//
//  Created by web_dev on 2023/01/13.
//

import Foundation
import SwiftUI



struct TodosView: View {
    
        
    var body: some View {
        // vertical stack
        VStack(alignment: .leading) {
            
            getHeader()

            UISearchBarWrapper()

            Spacer()
            
            List {
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
    fileprivate var topHeader : some View {
        
        Group {
            Text("TodosView / page : 0")
            Text("선택된 할일 : []")
            
            HStack {
                Button {} label: {Text("클로져")}
                    .buttonStyle(MyDefaultBtnSytle())
                Button {} label: {Text("Rx")}
                    .buttonStyle(MyDefaultBtnSytle(bgColor: .yellow, textColor: .black))
                Button {} label: {Text("콤바인")}
                    .buttonStyle(MyDefaultBtnSytle())
                Button {} label: {Text("Async")}
                    .buttonStyle(MyDefaultBtnSytle())
            }
        }
    }
    
    fileprivate var secondHeader : some View {
        
        Group {
            Text("Async 변환 액션들")
            
            HStack {
                Button {} label: {Text("클로져 -> Async")}
                    .buttonStyle(MyDefaultBtnSytle())
                Button {} label: {Text("Rx -> Async")}
                    .buttonStyle(MyDefaultBtnSytle())
                Button {} label: {Text("콤바인 -> Async")}
                    .buttonStyle(MyDefaultBtnSytle())

            }
            
            HStack {
                Button {} label: {Text("초기화")}
                    .buttonStyle(MyDefaultBtnSytle(bgColor: .purple))
                    
                Button {} label: {Text("선택된 할일들 삭제")}
                    .buttonStyle(MyDefaultBtnSytle(bgColor: .black))
                Button {} label: {Text("할 일 추가")}
                    .buttonStyle(MyDefaultBtnSytle(bgColor: .gray))
            }
        }
    }
}


//// 미리보기 제공자
//struct TodosView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodosView()
//    }
//}
