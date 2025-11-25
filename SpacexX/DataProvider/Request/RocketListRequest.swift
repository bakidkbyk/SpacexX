//
//  RocketListRequest.swift
//  SpacexX
//
//  Created by Baki on 21.11.2025.
//

struct RocketListRequest: APIDecodableResponseRequest {

    public typealias ResponseType = BaseResponse

    let path: String = "launches/queryy"
    let method: RequestMethod = .post
    var parameters: RequestParameters
    var headers: RequestHeaders = [:]

    init(page: Int, upcoming: Bool) {
        self.parameters = [
            "query": [
                "upcoming": upcoming
            ],
            "options": [
                "page": page,
                "limit": 10,
                "sort": ["date_utc": "desc"]
            ]
        ]
    }
}
