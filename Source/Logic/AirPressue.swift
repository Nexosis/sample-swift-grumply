//
//  AirPressue.swift
//  Grumply
//
//  Created by Guy Royse on 11/17/17.
//  Copyright © 2017 Nexosis. All rights reserved.
//

import CoreMotion

class AirPressure {

    private var altimeter: CMAltimeter
    private var airPressureValue: Double

    static let shared = AirPressure()

    private init() {
        airPressureValue = 0.0
        altimeter = CMAltimeter()
        startWatchingAirPressure()
    }

    var airPressure: Double {
        return airPressureValue
    }

    private func startWatchingAirPressure() {
        if CMAltimeter.isRelativeAltitudeAvailable() {
            altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main) { data, error in self.updateAirPressure(data: data) }
        }
    }

    private func updateAirPressure(data: CMAltitudeData?) {
        if let airPressureData = data?.pressure {
            airPressureValue = airPressureData.doubleValue
        } else {
            airPressureValue = 0.0
        }

    }
}
