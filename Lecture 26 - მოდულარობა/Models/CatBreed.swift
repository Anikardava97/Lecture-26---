//
//  CatBreed.swift
//  Lecture 26 - მოდულარობა
//
//  Created by Ani's Mac on 20.11.23.
//

import Foundation
import NetworkLayer

public struct CatBreedResponse: DecodableModel {
    let data: [CatBreeds]
}

struct CatBreeds: DecodableModel {
    let breed, country: String
}

