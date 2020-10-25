//
//  Bundle-Decodable.swift
//  MissionMoon
//
//  Created by Mete Alp Kizilcay on 25.10.2020.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) from bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data from bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
}
