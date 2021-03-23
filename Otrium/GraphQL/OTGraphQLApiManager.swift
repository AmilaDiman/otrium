//
//  OTGraphQLApiManager.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit
import Apollo
import Network

class OTGraphQLApiManager: NSObject {
    private let token = "bad0c5bc1cfcd2a076b233e474c2d6a003df5399" // hard coded for testing purposes
    static let shared = OTGraphQLApiManager()
    
    lazy var apollo: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let client = URLSessionClient()
        
        let provider = LegacyInterceptorProvider(client: client, store: store)
        let url = URL(string: "https://api.github.com/graphql")!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url,
                                                                 additionalHeaders: ["Authorization": "Bearer \(token)"])
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store)
    }()
}
