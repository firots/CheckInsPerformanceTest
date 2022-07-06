//
//  HistoryRow.swift
//  CheckInsPerformance
//
//  Created by Firat Özsarıkamış on 23.06.2022.
//

import SwiftUI
import Combine

class HistoryRowViewModel: ObservableObject {
    @Published var title = ""
    private var cancellable: AnyCancellable?
    
    init() {
        // drop first 2 to avoid printing "" and first title from view init 'viewModel.title = rowTitle'
        // this should be printed if this viewmodel reused and title changed
        cancellable = $title.dropFirst(2).sink { title in
               print("row title changed to: \(title)")
        }
    }
    
    deinit {
        print("row \(title) deinit")
    }
}

struct HistoryRow: View {
    @ObservedObject var viewModel = HistoryRowViewModel()
    
    init(rowTitle: String) {
        viewModel.title = rowTitle
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.title)
                    .font(.system(size: 18))
                HStack {
                    Image(systemName: "circle")
                    Text("Good sleep")
                        .font(.system(size: 12))
                }
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text("Nov 1")
                    .font(.system(size: 12))
                Text("10:45 AM")
                    .font(.system(size: 12))
            }
        }
        
        // Following part causes performance issues in lazyvstack and list
        /*
        .if(ContentView.shadows) { view in
            view.card()
        }
        */
        
        // So just force shadows
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color(UIColor.black), radius: 15, x: 0, y: 5)
    }
}
