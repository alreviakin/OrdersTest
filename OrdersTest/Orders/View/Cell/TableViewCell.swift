import UIKit

class NotesModel: NSObject {
    var name: String = ""
}

class NotesCell: UITableViewCell {
    lazy private var cellCaption: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping

        return label
    }()

    func configure(with note: NotesModel) {
        cellCaption.text = note.name
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() -> Void {

        contentView.addSubview(cellCaption)

        NSLayoutConstraint.activate([
            cellCaption.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellCaption.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cellCaption.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            cellCaption.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            ])

    }

}

//class NotesTableViewController: UITableViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 44
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 8
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell", for: indexPath) as! NotesCell
//
//        let m = NotesModel()
//
//        if indexPath.row == 3 {
//            m.name = "This is a very long caption. It will demonstrate how the cell height is auto-sized when the text is long enough to wrap to multiple lines."
//        } else {
//            m.name = "Caption \(indexPath.row)"
//        }
//
//        cell.configure(with: m)
//
//        return cell
//    }
//
//}
