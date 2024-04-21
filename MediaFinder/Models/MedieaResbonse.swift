//
//  MedieaResbonse.swift
//  MediaFinder
//
//  Created by ihab saad on 15/01/2024.
//

import Foundation

struct MediaResponse: Codable {
    let resultCount: Int?
    let results: [Media]?
}


