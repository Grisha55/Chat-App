//
//  ViewController.swift
//  ChatApp
//
//  Created by Григорий Виняр on 04/09/2022.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Properties
  private let usersTableView: UITableView = {
    let table = UITableView()
    table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return table
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    setupUsersTableView()
  }

  // MARK: - Methods
  private func setupUsersTableView() {
    view.addSubview(usersTableView)
    usersTableView.delegate = self
    usersTableView.dataSource = self
    
    usersTableView.translatesAutoresizingMaskIntoConstraints = false
    usersTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    usersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    usersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    usersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }

}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    // TODO: - Transition to ChatViewController
    let vc = ChatViewController()
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = "John Smith"
    cell.accessoryType = .disclosureIndicator
    return cell
  }
  
}
