import UIKit
import Foundation

class GrumplinessHistoryTableViewCell: UITableViewCell {

    private let blue   = UIColor(red: 0x00 / 0xFF, green: 0x00 / 0xFF, blue: 0xFF / 0xFF, alpha: 1.0)
    private let green  = UIColor(red: 0x00 / 0xFF, green: 0x66 / 0xFF, blue: 0x00 / 0xFF, alpha: 1.0)
    private let orange = UIColor(red: 0xFF / 0xFF, green: 0x66 / 0xFF, blue: 0x00 / 0xFF, alpha: 1.0)
    private let red    = UIColor(red: 0xCC / 0xFF, green: 0x00 / 0xFF, blue: 0x00 / 0xFF, alpha: 1.0)
    private let black  = UIColor(red: 0x00 / 0xFF, green: 0x00 / 0xFF, blue: 0x00 / 0xFF, alpha: 1.0)

    @IBOutlet weak var grumplinessBadge: RoundedLabel!
    @IBOutlet weak var dateLabel: UILabel!

    func update(grumpliness: Int, date: Date) {
        grumplinessBadge.backgroundColor = color(forGrumpliness: grumpliness)
        grumplinessBadge.text = String(grumpliness)
        dateLabel.text = "\(dateString(forDate: date))\n\(timeString(forDate: date))"
    }

    private func color(forGrumpliness grumpliness: Int) -> UIColor {
        let colors: [Int: UIColor] = [ 1: blue, 2: green, 3: orange, 4: red, 5: black ]
        return colors[grumpliness] ?? black
    }

    private func dateString(forDate date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current

        return dateFormatter.string(from: date)
    }

    private func timeString(forDate date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .long
        dateFormatter.locale = Locale.current
        dateFormatter.timeZone = TimeZone.current

        return dateFormatter.string(from: date)
    }
}
