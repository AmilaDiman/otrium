//
//  OTGraphQLApiManager.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit
import Apollo

class OTGraphQLApiManager: NSObject {
    private let token = "bad0c5bc1cfcd2a076b233e474c2d6a003df5399" // hard coded for testing purposes
    let shared = OTGraphQLApiManager()
    
    
    private lazy var apollo: ApolloClient = {
        let network = RequestChainNetworkTransport(
            interceptorProvider: LegacyInterceptorProvider(),
            endpointURL: URL(string: "https://api.github.com/graphql")!,
            additionalHeaders: [
                "Authorization": "Bearer \(token)"
            ]
        )
        
        return .init(networkTransport: network)
    }()
    
}
