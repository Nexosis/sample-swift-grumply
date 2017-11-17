//
//  HistoryTableViewController.swift
//  Grumply
//
//  Created by Guy Royse on 11/16/17.
//  Copyright © 2017 Nexosis. All rights reserved.
//

import UIKit
import PromiseKit

class GrumplinessHistoryTableViewController: UITableViewController {

    private var grumply = Grumply.shared
    private var events: [GrumplyEvent] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        grumply.fetchPastEvents()
            .then { events -> Void in
                self.events = events
                self.tableView.reloadData()
            }
            .catch { error in
                print("Error: \(error)")
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Grumpliness History"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GrumplinessHistoryTableViewCell", for: indexPath) as? GrumplinessHistoryTableViewCell  else {
            fatalError("The dequeued cell is not an instance of GrumplinessHistoryTableViewCell")
        }

        let event = events[indexPath.row]
        cell.update(grumpliness: event.grumpliness, date: event.date)
        return cell
    }
}
