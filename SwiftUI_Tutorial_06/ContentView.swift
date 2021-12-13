//
//  ContentView.swift
//  SwiftUI_Tutorial_06
//
//  Created by SeongMinK on 2021/12/13.
//

import SwiftUI

struct MyModel: Identifiable {
    let id = UUID()
    let title: String
    let content: String
}

extension MyModel {
    static var dummyDataArray: [MyModel] {
        (1...2000).map{ (number: Int) in
            MyModel(title: "타이틀: \(number)", content: "컨텐츠: \(number)")
        }
    }
}

struct ContentView: View {
    var dummyDataArray = MyModel.dummyDataArray
    
    var body: some View {
        ScrollView {
            // column: horizontal item layout setting
            // 그리드 아이템 옵션 3개
            // .fixed 고정
            // .adaptive 여러개 채우기 - 계산해서 분할로 채움
            // .flexible 한개만 채우기 - 계산해서 분할로 채움
            LazyVGrid(columns: [
                GridItem(.fixed(50)),
                GridItem(.adaptive(minimum: 50)),
                GridItem(.flexible(minimum: 50))
            ], content: {
                ForEach(dummyDataArray, content: { (dataItem: MyModel) in
                    Rectangle()
                        .frame(height: 120)
                        .foregroundColor(.blue)
                        .overlay(
                            Text("\(dataItem.title)")
                        )
                })
                
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
