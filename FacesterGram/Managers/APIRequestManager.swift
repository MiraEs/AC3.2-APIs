//
//  APIRequestManager.swift
//  FacesterGram
//
//  Created by Louis Tur on 10/21/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation
/*
enum UserGender: String {
    case male, female, both
}

enum UserNationality: String {
    case AU, BR, CA, CH, DE, DK, ES, FI, FR, GB, IE, IR, NL, NZ, TR, US, all
}
*/
internal class APIRequestManager {
    private static let randomAPIEndpoint: URL = URL(string: "https://randomuser.me/api/")!
    
    internal static let manager: APIRequestManager = APIRequestManager()
    private init() {}

    
    func getRandom(user: Int, gender: UserGender, nationality: UserNationality, completion: @escaping ((Data?)->Void)) {
        
        let newURL: URL = URL(string: "https://randomuser.me/api/?results=\(user)&gender=\(gender.rawValue)&nat=\(nationality.rawValue)")!
        
        let session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: newURL) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Error encountered in API request: \(error?.localizedDescription)")
            }
            
            if data != nil {
                print("Data returned in response")
                completion(data)
            }
            
            }.resume()
        
    }
}






