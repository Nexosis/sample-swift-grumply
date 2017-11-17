//
//  ViewController.swift
//  Grumply
//
//  Created by Guy Royse on 11/15/17.
//  Copyright © 2017 Nexosis. All rights reserved.
//

import UIKit
import NexosisApiClient

class GrumplyViewController: UIViewController {

    private var airPressure = AirPressure.shared
    private var grumply = Grumply.shared

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func grumplinessButtonTapped(_ sender: Any) {
        if let button = sender as? UIButton {

            let date = Date()
            let grumpliness = button.tag

            let event = GrumplyEvent(date: date, grumpliness: grumpliness, airPressure: airPressure.airPressure)

            grumply.save(event: event)
                .then { self.showAlert(grumpliness: grumpliness) }
                .catch { error in print("Error: \(error)") }

        } else {
            fatalError("sender was not a UIButton")
        }
    }

    private func showAlert(grumpliness: Int) {
        let title = "Grumpliness Recorded"
        let message = "Grumply has saved your grumpliness of \(grumpliness)."

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))

        present(alert, animated: true, completion: nil)
    }
}

