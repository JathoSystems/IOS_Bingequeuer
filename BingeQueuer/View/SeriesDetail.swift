//
//  SeriesDetail.swift
//  BingeQueuer
//
//  Created by Thomas Versteeg on 11/02/2025.
//

import SwiftUI
import CoreLocation

struct SeriesDetail: View {
    var series: Series
    var spacerSize: CGFloat = 150
    var mapHeight: CGFloat = 300
    var body: some View {
        ScrollView {
            MapView(coordinate: CLLocationCoordinate2DMake(series.latitude, series.longitude))
                .frame(height: mapHeight)
            Image(series.image)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .offset(y: -spacerSize)
            Text(series.title)
                .font(.title)
                .multilineTextAlignment(.leading)
                .padding()
                .offset(y: -spacerSize)
            Text("Seasons: " + String(series.seasons))
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding()
                .offset(y: -spacerSize)
            Text(series.description)
                .font(.body)
                .multilineTextAlignment(.leading)
                .padding()
                .offset(y: -spacerSize)
        }
        .navigationTitle(series.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SeriesDetail(series: seriesSourceList[4])
}
