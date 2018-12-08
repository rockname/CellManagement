import Foundation
import UIKit

class StructuredTableCellDataSource: NSObject, UITableViewDataSource {
    private var sections: [TableCellSection] = []

    func configureCell(_ cell: UITableViewCell, withValue value: Any) {}

    final func clearSections() {
        self.sections = []
    }

    final func clearSections(inSection section: Int) {
        self.sections.remove(at: section)
    }

    @discardableResult
    final func prependRow(_ row: TableCellRow, toSection section: Int = 0) -> IndexPath {
        self.sections[section].rows.insert(row, at: 0)
        return IndexPath(row: 0, section: section)
    }

    @discardableResult
    final func appendRow(_ row: TableCellRow, toSection section: Int = 0) -> IndexPath {
        self.sections[section].rows.append(row)
        return IndexPath(row: self.sections[section].rows.count - 1, section: section)
    }

    @discardableResult
    final func insertRow(_ row: TableCellRow, atRow rowIndex: Int, inSection sectionIndex: Int = 0) -> IndexPath {
        self.sections[sectionIndex].rows.insert(row, at: rowIndex)
        return IndexPath(row: rowIndex, section: sectionIndex)
    }

    final func deleteRow(atRow rowIndex: Int, inSection sectionIndex: Int = 0) -> IndexPath {
        self.sections[sectionIndex].rows.remove(at: rowIndex)
        return IndexPath(row: rowIndex, section: sectionIndex)
    }

    final func appendSection(_ section: TableCellSection) {
        self.sections.append(section)
    }

    final func setSection(_ section: TableCellSection, inSection index: Int) {
        self.sections[index] = section
    }

    final func setRow(_ row: TableCellRow, atRow rowIndex: Int, inSection sectionIndex: Int = 0) {
        self.sections[sectionIndex].rows[rowIndex] = row
    }

    final subscript(indexPath: IndexPath) -> Any {
        return self.sections[indexPath.section].rows[indexPath.item].value
    }

    final subscript(itemSection itemSection: (item: Int, section: Int)) -> Any {
        return self.sections[itemSection.section].rows[itemSection.item].value
    }

    final subscript(section section: Int) -> [Any] {
        return self.sections[section].rows.map { $0.value }
    }


    final func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }

    final func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }

    final func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reusableId, for: indexPath)
        self.configureCell(cell, withValue: row.value)
        return cell
    }

    final func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].headerTitle
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footerTitle
    }
}
