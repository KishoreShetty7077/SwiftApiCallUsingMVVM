//
//  HomeViewController.swift
//  TestAply
//
//  Created by Kishore B on 9/20/24.
//

import UIKit

class UsersListViewController: UIViewController {
    
    // MARK: - IBOutlets
       @IBOutlet weak var tableView: UITableView!
       
       // MARK: - Properties
       let viewModel = UsersListViewModel()
       
       // MARK: - ViewLifeCycle
       override func viewDidLoad() {
           super.viewDidLoad()
           
           fetchUsersList()
       }
    
    // MARK: - Additional functions
    private func fetchUsersList() {
           viewModel.fetchUsersList { [weak self] users, error in
               if users != nil {
                   DispatchQueue.main.async {
                       self?.tableView.reloadData()
                   }
               } else {
                   print("Error: \(error)")
               }
           }
       }

}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.usersDetailsListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let userDetailsCell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsTableViewCell", for: indexPath) as? UserDetailsTableViewCell {
            let rowData = viewModel.usersDetailsListArray[indexPath.row]
            userDetailsCell.configureData(with: rowData)
            return userDetailsCell
        }
        return UITableViewCell()
    }

}
