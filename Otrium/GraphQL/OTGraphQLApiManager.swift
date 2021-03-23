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
   
    //MARK:- Public variables
    
    /// Shared instance of app to access Apollo
    static let shared = OTGraphQLApiManager()
    
    /// Apollo instance to connect to GraphQL
    private(set) lazy var apollo: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let client = URLSessionClient()
        let provider = LegacyInterceptorProvider(client: client, store: store)
        let url = URL(string: "https://api.github.com/graphql")!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url,
                                                                 additionalHeaders: ["Authorization": "Bearer \(token)"])
        return ApolloClient(networkTransport: requestChainTransport, store: store)
    }()
    
    //MARK:- Private constants

    /// Token used for Github Graph QL auth
    private let token = "c367f35b36e9f7033321c5a18f721dab12446d8d" //TODO: hard coded for testing purposes
}
