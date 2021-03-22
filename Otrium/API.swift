// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct RepositoryDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment RepositoryDetails on Repository {
      __typename
      name
      owner {
        __typename
        resourcePath
      }
      stargazers {
        __typename
        totalCount
      }
      url
    }
    """

  public static let possibleTypes: [String] = ["Repository"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
      GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
      GraphQLField("url", type: .nonNull(.scalar(String.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(name: String, owner: Owner, stargazers: Stargazer, url: String) {
    self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "owner": owner.resultMap, "stargazers": stargazers.resultMap, "url": url])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The name of the repository.
  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// The User owner of the repository.
  public var owner: Owner {
    get {
      return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "owner")
    }
  }

  /// A list of users who have starred this starrable.
  public var stargazers: Stargazer {
    get {
      return Stargazer(unsafeResultMap: resultMap["stargazers"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "stargazers")
    }
  }

  /// The HTTP URL for this repository
  public var url: String {
    get {
      return resultMap["url"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "url")
    }
  }

  public struct Owner: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Organization", "User"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("resourcePath", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public static func makeOrganization(resourcePath: String) -> Owner {
      return Owner(unsafeResultMap: ["__typename": "Organization", "resourcePath": resourcePath])
    }

    public static func makeUser(resourcePath: String) -> Owner {
      return Owner(unsafeResultMap: ["__typename": "User", "resourcePath": resourcePath])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The HTTP URL for the owner.
    public var resourcePath: String {
      get {
        return resultMap["resourcePath"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "resourcePath")
      }
    }
  }

  public struct Stargazer: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["StargazerConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "StargazerConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }
}
