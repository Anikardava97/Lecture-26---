//
//  CatBreed.swift
//  Lecture 26 - მოდულარობა
//
//  Created by Ani's Mac on 20.11.23.
//

import Foundation

public struct CatBreedResponse: Decodable {
    let data: [CatBreeds]
}

struct CatBreeds: Decodable {
    let breed, country: String
}

