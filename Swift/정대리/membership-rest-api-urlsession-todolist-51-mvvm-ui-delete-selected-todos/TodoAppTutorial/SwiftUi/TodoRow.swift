//
//  TodoRow.swift
//  TodoAppTutorial
//
//  Created by Jeff Jeong on 2022/11/10.
//

import Foundation
import SwiftUI

struct TodoRow : View {
    
    @State var isSelected : Bool = false
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading){
                Text("id: 123 / 완료여부: 미완료")
                Text("오늘도 빡코딩이잉")
            }.frame(maxWidth: .infinity)
            
            VStack(alignment: .trailing){
                actionButtons
                Toggle(isOn: $isSelected, label: {
                    EmptyView()
                })
                .frame(width: 80)
            }
            
            
        }
        .frame(maxWidth: .infinity)
//        .background(Color.yellow)
    }
    
    
    fileprivate var actionButtons: some View {
        HStack{
            Button(action: {}, label: {
                Text("수정")
            })
            .buttonStyle(MyDefaultBtnStyle())
            .frame(width: 80)
            
            Button(action: {}, label: {
                Text("삭제")
            })
            .buttonStyle(MyDefaultBtnStyle(bgColor: .purple))
            .frame(width: 80)
        }
    }
    
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow()
    }
}
