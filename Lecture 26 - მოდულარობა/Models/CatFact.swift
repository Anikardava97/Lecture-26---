//
//  CatFact.swift
//  Lecture 26 - მოდულარობა
//
//  Created by Ani's Mac on 19.11.23.
//

import Foundation

public struct CatFactsResponse: Decodable {
    let data: [CatFacts]
}

public struct CatFacts: Decodable {
    let fact: String
}
