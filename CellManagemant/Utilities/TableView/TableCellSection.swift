import Foundation

struct TableCellSection {
    var rows: [TableCellRow]
    let headerTitle: String?
    let footerTitle: String?

    init(rows: [TableCellRow], headerTitle: String? = nil, footerTitle: String? = nil) {
        self.rows = rows
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
    }
}
