//
//  ChartRow.swift
//  CheckInsPerformance
//
//  Created by Firat Özsarıkamış on 23.06.2022.
//

import SwiftUI

struct ChartRow: View {
    var body: some View {
        HStack {
            Spacer()
            VStack() {
                Text("Chart")
                Text("Chart")
                Text("Chart")
                Text("Chart")
                Text("Chart")
                Text("Chart")
                Text("Chart")
            }
            Spacer()
        }.card()

            
    }
}

struct ChartRow_Previews: PreviewProvider {
    static var previews: some View {
        ChartRow()
    }
}
