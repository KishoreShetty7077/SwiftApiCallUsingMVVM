//
//  UserListDataModel.swift
//  TestAply
//
//  Created by Kishore B on 9/20/24.
//

import Foundation

// MARK: - UserDetails
struct UserDetails: Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone: String?
}

// MARK: - Address
struct Address: Codable {
    let geo: Geo?
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String?
}
