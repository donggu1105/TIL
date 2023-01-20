//
//  TodoRow.swift
//  TodoAppTutorial
//
//  Created by web_dev on 2023/01/13.
//

import Foundation
import SwiftUI



struct TodoRow: View {
    
    @State var isSelected: Bool = false
    
    
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("id : 123 / 완료여부 : 미완료")
                Text("오늘도 빡코딩")
            }.frame(maxWidth: .infinity)
            
            VStack(alignment: .trailing) {
                actionButtons
                Toggle(isOn: $isSelected) {
                    EmptyView()
                }
                    .frame(width: 80)
            }
            

        }
        .frame(maxWidth: .infinity)
//        .background(Color.yellow)
    }
    
    fileprivate var actionButtons: some View {
        HStack {
            Button {} label: { Text("수정")}
                .buttonStyle(MyDefaultBtnSytle(bgColor: .purple))
                .frame(width: 70)
            
            Button {} label: { Text("삭제")}
                .buttonStyle(MyDefaultBtnSytle(bgColor: .purple))
                .frame(width: 70)
        }
    }
}


struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow()
    }

}
