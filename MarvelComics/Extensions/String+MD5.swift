//
//  String+MD5.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/4/22.
//

import Foundation
import CryptoKit

extension String {
    
    /// Returns a MD5 hashed string
    /// Resource: https://stackoverflow.com/a/56578995
    func MD5() -> String {
        let stringData = self.data(using: .utf8) ?? Data()
        let digest = Insecure.MD5.hash(data: stringData)
        
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}
