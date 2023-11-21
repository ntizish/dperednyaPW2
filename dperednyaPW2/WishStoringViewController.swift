//
//  WishStoringViewController.swift
//  dperednyaPW2
//
//  Created by Danil Perednja on 21.11.2023.
//

import UIKit

final class WishStoringViewController: UIViewController {
    
    private var wishArray: [String] = ["Mock wish"]
    
    enum Constants {
        static let tableCornerRadius: Double = 16
        static let tableOffset: Double = 8
    }
    
    private let table: UITableView = UITableView(frame: .zero)
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
        configureTable()
    }
    
    private func configureTable() {
        view.addSubview(table)
        table.backgroundColor = .red
        table.dataSource = self
        table.separatorStyle = .none
        table.layer.cornerRadius = Constants.tableCornerRadius
        table.pin(to: view, Constants.tableOffset)
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)
    }
}



extension WishStoringViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
        withIdentifier: WrittenWishCell.reuseId,
        for: indexPath
        )
        guard let wishCell = cell as? WrittenWishCell else { return cell }
        wishCell.configure(with: wishArray[indexPath.row])
        return wishCell
    }
}

final class AddWishCell: UITableViewCell {
    static let reuseId: String = "AddWishCell"

    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type your wish here..."
        textField.textColor = .black
        return textField
    }()

    lazy var addButton: UIButton = {
        [unowned self] in
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()

    lazy var clearAllButton: UIButton = {
        [unowned self] in
        let button = UIButton(type: .system)
        button.setTitle("Clear All Wishes", for: .normal)
        button.addTarget(self, action: #selector(clearAllButtonTapped), for: .touchUpInside)
        return button
    }()


    var addWish: ((String) -> ())?
    var clearAllAction: (() -> ())?

    @objc private func addButtonTapped() {
        guard let wishText = textField.text, !wishText.isEmpty else {
            return
        }

        addWish?(wishText)
        textField.text = nil
    }

    @objc private func clearAllButtonTapped() {
        clearAllAction?()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear

        contentView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])

        contentView.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            addButton.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 8),
            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])

        contentView.addSubview(clearAllButton)
        clearAllButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            clearAllButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            clearAllButton.leadingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: 8),
            clearAllButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            clearAllButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])

        isUserInteractionEnabled = true
        textField.isUserInteractionEnabled = true
    }
}
