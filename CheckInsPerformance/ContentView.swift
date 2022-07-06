//
//  ContentView.swift
//  CheckInsPerformance
//
//  Created by Firat Özsarıkamış on 23.06.2022.
//

import SwiftUI

enum ContentRenderStyle {
    case vStack
    case lazyVStack
    case list
}

struct ContentView: View {
    let historyRowCount = 1200
    let style = ContentRenderStyle.lazyVStack
    static let shadows = true
    
    var body: some View {
        Group {
            switch style {
            case .vStack:
                vStackContent()
            case .lazyVStack:
                lazyVStackContent()
            case .list:
                listContent()
            }
        }
    }
    
    func vStackContent() -> some View {
        ScrollView {
            VStack(spacing: 20) {
                ChartRow()
                ForEach(1..<historyRowCount + 1) { i in
                    HistoryRow(rowTitle: "History Row \(i)")
                }
            }
        }
    }
    
    func lazyVStackContent() -> some View {
        ScrollView {
            LazyVStack(spacing: 20)  {
                ChartRow()
                ForEach(1..<historyRowCount + 1) { i in
                    HistoryRow(rowTitle: "History Row \(i)")
                }
            }
        }
    }
    
    func listContent() -> some View {
        List {
            ChartRow()
            ForEach(1..<historyRowCount + 1) { i in
                HistoryRow(rowTitle: "History Row \(i)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
