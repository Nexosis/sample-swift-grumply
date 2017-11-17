//
//  Grumply.swift
//  Grumply
//
//  Created by Guy Royse on 11/15/17.
//  Copyright © 2017 Nexosis. All rights reserved.
//

import Foundation
import NexosisApiClient
import PromiseKit

class Grumply {

    static let shared = Grumply()

    private let client: NexosisClient
    private let settings: GrumplySettings

    private init() {
        settings = GrumplySettings()
        client = NexosisClient(apiKey: settings.apiKey)
    }

    func save(event: GrumplyEvent) -> Promise<Void> {
        var dataset = Dataset(name: settings.datasetName)

        dataset.addColumn(column: Column(name: "timestamp", type: .date, role: .timestamp))
        dataset.addColumn(column: Column(name: "grumpliness", type: .numericMeasure, role: .target))
        dataset.addColumn(column: Column(name: "air_pressure", type: .numericMeasure, role: .feature))

        dataset.addRow(row: [
            Property(name: "timestamp", value: toString(fromDate: event.date)),
            Property(name: "grumpliness", value: Double(event.grumpliness)),
            Property(name: "air_pressure", value: event.airPressure)
        ])

        return client.datasets.add(dataset: dataset)
    }

    func fetchPastEvents() -> Promise<[GrumplyEvent]> {
        return client.datasets.retrieve(datasetName: settings.datasetName)
            .then { $0.rows.map { self.createGrumplyEvent(from: $0) } }
    }

    func removeEvent(date: Date) -> Promise<Void> {
        let dateString = ISO8601DateFormatter().string(from: date)
        print(dateString)
        return client.datasets.delete(datasetName: settings.datasetName, startDate: dateString, endDate: dateString)
    }

    private func createGrumplyEvent(from row: [String: Property]) -> GrumplyEvent {
        let date = row["timestamp"]?.asString ?? ""
        let grumpliness = row["grumpliness"]?.asDouble ?? 0.0
        let airPressure = row["air_pressure"]?.asDouble ?? 0.0

        return GrumplyEvent(date: toDate(fromString: date), grumpliness: Int(grumpliness), airPressure: airPressure)
    }

    private func toDate(fromString: String) -> Date {
        let sansMilliseconds = fromString.replacingOccurrences(of: "\\.\\d+", with: "", options: .regularExpression)
        return ISO8601DateFormatter().date(from: sansMilliseconds) ?? Date()
    }

    private func toString(fromDate: Date) -> String {
        return ISO8601DateFormatter().string(from: fromDate)
    }
}

