//
//  SeriesList.swift
//  BingeQueuer
//
//  Created by Thomas Versteeg on 11/02/2025.
//

import SwiftUI

struct SeriesList: View {
    @State var seriesDataList = seriesSourceList
    var body: some View {
        NavigationView {
            List() {
                ForEach(seriesDataList,id: \Series.id) {
                    series in
                    NavigationLink(
                        destination: SeriesDetail(series: series)
                    ) {
                        BingeRow(series: series)
                    }
                }
                .onDelete(perform: delete)
            }
            .toolbar {
                EditButton()
            }
            .navigationTitle("Series")
        }
    }
    func delete(at offsets: IndexSet) {
        seriesDataList.remove(atOffsets: offsets)
    }
}


#Preview {
    SeriesList()
}
