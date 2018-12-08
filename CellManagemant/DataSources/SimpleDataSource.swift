import Foundation
import UIKit

class SimpleDataSource: NSObject, UITableViewDataSource {

    private var tasks: [Task] = []

    func load(_ tasks: [Task]) {
        self.tasks = tasks
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return Category.allCases.count + 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return tasks.filter { $0.category == .personal }.count
        case 2:
            return tasks.filter { $0.category == .shopping }.count
        case 3:
            return tasks.filter { $0.category == .work }.count
        default:
            fatalError()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell") as! ProfileTableViewCell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as! TaskTableViewCell
            let personalTask = tasks.filter { $0.category == .personal }[indexPath.row]
            cell.configure(with: personalTask)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as! TaskTableViewCell
            let shoppingTask = tasks.filter { $0.category == .shopping }[indexPath.row]
            cell.configure(with: shoppingTask)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as! TaskTableViewCell
            let workTask = tasks.filter { $0.category == .work }[indexPath.row]
            cell.configure(with: workTask)
            return cell
        default:
            fatalError()
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1:
            return Category.personal.rawValue
        case 2:
            return Category.shopping.rawValue
        case 3:
            return Category.work.rawValue
        default:
            fatalError()
        }
    }
}
