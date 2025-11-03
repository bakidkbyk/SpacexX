//
//  APIRequestInterceptor.swift
//  SpacexX
//
//  Created by Baki on 3.11.2025.
//

import Alamofire
import UIKit

public class APIRequestInterceptor: RequestInterceptor {
    
    public static let shared = APIRequestInterceptor()
    
    private let apiKey = "YOUR_API_KEY"
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        
        urlRequest.headers.add(.init(name: "api-key", value: apiKey))
        urlRequest.headers.add(.contentType("application/json"))
        urlRequest.headers.add(.accept("application/json"))
        
        completion(.success(urlRequest))
    }
}
