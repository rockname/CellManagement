import Foundation
import UIKit

class GeneralizedDataSource: StructuredTableCellDataSource {

    func load(_ tasks: [Task]) {
        let profileSection = TableCellSection(rows: [TableCellRow(reusableId: "ProfileTableViewCell", value: ())])
        let personalTaskSection = TableCellSection(
            rows: tasks.filter { $0.category == .personal }.map { TableCellRow(reusableId: "TaskTableViewCell", value: $0) },
            headerTitle: Category.personal.rawValue
        )
        let shoppingTaskSection = TableCellSection(
            rows: tasks.filter { $0.category == .shopping }.map { TableCellRow(reusableId: "TaskTableViewCell", value: $0) },
            headerTitle: Category.shopping.rawValue
        )
        let workTaskSection = TableCellSection(
            rows: tasks.filter { $0.category == .work }.map { TableCellRow(reusableId: "TaskTableViewCell", value: $0) },
            headerTitle: Category.work.rawValue
        )
        [profileSection, personalTaskSection, shoppingTaskSection, workTaskSection].forEach(appendSection)
    }

    override func configureCell(_ cell: UITableViewCell, withValue value: Any) {
        switch (cell, value) {
        case (_ as ProfileTableViewCell, _ as Void): break
        case let (cell as TaskTableViewCell, value as Task):
            cell.configure(with: value)
        default: fatalError()
        }
    }
}
