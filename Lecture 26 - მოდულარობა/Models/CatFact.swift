//
//  CatFact.swift
//  Lecture 26 - მოდულარობა
//
//  Created by Ani's Mac on 19.11.23.
//

import Foundation
import NetworkLayer

public struct CatFactsResponse: DecodableModel {
    let data: [CatFacts]
}

public struct CatFacts: DecodableModel {
    let fact: String
}
