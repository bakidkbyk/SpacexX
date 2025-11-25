//
//  RocketListCellModel+Extensions.swift
//  SpacexX
//
//  Created by Baki on 4.11.2025.
//

import Foundation

extension RocketListCellModel {
    convenience init(rocketListReponse: RocketListResponse) {
        self.init(imageUrl: rocketListReponse.links.patch.small ?? "", name: rocketListReponse.name, date: rocketListReponse.dateLocal)
    }
}
