import UIKit

class TodoTableViewController: UITableViewController {

    #if SIMPLE
        var dataSource = SimpleDataSource()
    #elseif COMMONIZED
        var dataSource = CommonizedDataSource()
    #else
        var dataSource = GeneralizedDataSource()
    #endif

    override func viewDidLoad() {
        super.viewDidLoad()

        configure(tableView)

        #if SIMPLE
            dataSource.load([
                Task(id: 0, name: "ジムに行く", category: .personal),
                Task(id: 1, name: "髪の毛を切る", category: .personal),
                Task(id: 2, name: "Apple Watchを買う", category: .shopping),
                Task(id: 3, name: "iPad Proを買う", category: .shopping),
                Task(id: 4, name: "MTGを設定する", category: .work)
            ])
        #else
            dataSource.load([
                Task(id: 0, name: "ジムに行く", category: .personal),
                Task(id: 1, name: "髪の毛を切る", category: .personal),
                Task(id: 2, name: "Apple Watchを買う", category: .shopping),
                Task(id: 3, name: "iPad Proを買う", category: .shopping),
                Task(id: 4, name: "MTGを設定する", category: .work)
            ])
        #endif
        
        tableView.reloadData()
    }

    private func configure(_ tableView: UITableView) {
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
        tableView.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "TaskTableViewCell")
        tableView.dataSource = dataSource
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView(frame: .zero)
    }
}
