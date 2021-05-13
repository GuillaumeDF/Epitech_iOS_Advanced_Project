//
//  HomeViewModel.swift
//  Flag
//
//  Created by Morgan Collino on 4/25/21.
//

import Foundation
import Core

public class HomeViewModel {

    public let countries: [Country]

    public init(countries: [Country]) {
        self.countries = countries
    }
}
