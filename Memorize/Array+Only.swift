//
//  Array+Only.swift
//  Memorize
//
//  Created by Zizo on 8/2/20.
//  Copyright © 2020 Abdelazizfmohamed@gmail.com. All rights reserved.
//

import Foundation

extension Array{
    var only:Element?{
        count == 1 ? first: nil
    }
}
