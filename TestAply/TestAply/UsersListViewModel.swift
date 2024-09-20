//
//  HomeViewModel.swift
//  TestAply
//
//  Created by Kishore B on 9/20/24.
//

import UIKit

class UsersListViewModel: NSObject {
    
    var usersDetailsListArray = [UserDetails]()
    
    func fetchUsersList(completionHandler: @escaping ([UserDetails]?, String) -> Void) {
        let urlStr = "https://jsonplaceholder.typicode.com/users"
        
        guard let url = URL(string: urlStr) else {
            completionHandler(nil, "Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                completionHandler(nil, error.localizedDescription)
                return
            }
            
            guard let resData = data else {
                completionHandler(nil, "No data found")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([UserDetails].self, from: resData)
                self.usersDetailsListArray = decodedData
                completionHandler(decodedData, "")
            } catch {
                completionHandler(nil, error.localizedDescription)
            }
        }.resume()
    }
}
