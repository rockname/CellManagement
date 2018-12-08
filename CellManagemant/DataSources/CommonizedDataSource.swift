import Foundation
import UIKit

class CommonizedDataSource: NSObject, UITableViewDataSource {

    private var values: [(headerTitle: String?, rows: [(value: Any, reusableId: String)])] = []

    func load(_ tasks: [Task]) {
        self.values = [
            (
                headerTitle: nil,
                rows: [(value: (), reusableId: "ProfileTableViewCell")]
            ),
            (
                headerTitle: Category.personal.rawValue,
                rows: tasks.filter { $0.category == .personal }.map { (value: $0, reusableId: "TaskTableViewCell") }
            ),
            (
                headerTitle: Category.shopping.rawValue,
                rows: tasks.filter { $0.category == .personal }.map { (value: $0, reusableId: "TaskTableViewCell") }
            ),
            (
                headerTitle: Category.work.rawValue,
                rows: tasks.filter { $0.category == .personal }.map { (value: $0, reusableId: "TaskTableViewCell") }
            )
        ] as! [(headerTitle: String?, rows: [(value: Any, reusableId: String)])]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return values.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let (value, reusableId) = self.values[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableId, for: indexPath)

        switch (cell, value) {
        case (_ as ProfileTableViewCell, _ as Void): break
        case let (cell as TaskTableViewCell, value as Task):
            cell.configure(with: value)
        default: break
        }

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return values[section].headerTitle
    }
}
