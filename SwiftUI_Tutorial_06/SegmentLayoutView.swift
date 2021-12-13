//
//  SegmentLayoutView.swift
//  SwiftUI_Tutorial_06
//
//  Created by SeongMinK on 2021/12/13.
//

import SwiftUI

enum LayoutType: CaseIterable {
    case table, grid, multiple
}

extension LayoutType {
    // 레이아웃 타입에 대한 column이 자동으로 설정되도록 함
    var columns: [GridItem] {
        switch self {
        case .table:
            return [
                GridItem(.flexible())
            ]
        case .grid:
            return [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        case .multiple:
            return [
                GridItem(.adaptive(minimum: 100))
            ]
        }
    }
}

struct SegmentLayoutView: View {
    var dummyDatas = MyModel.dummyDataArray
    @State private var selectedLayoutType: LayoutType = .table
    
    var body: some View {
        VStack {
            Picker(selection: $selectedLayoutType, label: Text("레이아웃 타입"), content:  {
                ForEach(LayoutType.allCases, id: \.self, content: { layoutType in
                    switch layoutType {
                    case .table:
                        Image(systemName: "list.dash")
                    case .grid:
                        Image(systemName: "square.grid.2x2.fill")
                    case .multiple:
                        Image(systemName: "circle.grid.3x3.fill")
                    }
                })
            }).frame(width: 250)
            .pickerStyle(SegmentedPickerStyle())
            
            ScrollView {
                LazyVGrid(columns: selectedLayoutType.columns, content: {
                    ForEach(dummyDatas) { dataItem in
                        switch selectedLayoutType {
                        case .table:
                            Rectangle()
                                .frame(height: 100)
                                .foregroundColor(.blue)
                        case .grid:
                            Rectangle()
                                .frame(height: 100)
                                .foregroundColor(.red)
                        case .multiple:
                            Rectangle()
                                .frame(height: 100)
                                .foregroundColor(.green)
                        }
                        
                    }
                })
                .animation(.easeInOut)
                .padding(.horizontal, 10)
            }
        }
    }
}

struct SegmentLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentLayoutView()
    }
}
