//
//  OtriumTests.swift
//  OtriumTests
//
//  Created by Amila Dimantha on 2021-03-21.
//

import XCTest
@testable import Otrium

class OtriumTests: XCTestCase {
    enum OTTestError: Error {
        case requiredNumberOfStarredReposNotLoaded
        case requiredNumberOfTopReposNotLoaded
        case requiredNumberOfPinnedReposNotLoaded
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let expStarredRepos = expectation(description:"Fetching top 10 starred repos")
        let expPinnedRepos = expectation(description:"Fetching top 3 pinned repos")
        let expTopRepos = expectation(description:"Fetching top 10 repos")
        let presenter = OTProfilePresenter(profileDataSource: OTProfileDataSource())
        
        presenter.getTopRepoDetails { (repos) in
            if presenter.topRepositories.count == 10 {
                expTopRepos.fulfill()
            } else {
                XCTAssertNil(OTTestError.requiredNumberOfTopReposNotLoaded)
            }
        }
        
        presenter.getStarredRepoDetails { (repos) in
            if presenter.starredRepositories.count == 10 {
                expStarredRepos.fulfill()
            } else {
                XCTAssertNil(OTTestError.requiredNumberOfStarredReposNotLoaded)
            }
        }
        
        presenter.getPinnedRepoDetails { (repos) in
            if presenter.pinnedRepositories.count == 3 {
                expPinnedRepos.fulfill()
            } else {
                XCTAssertNil(OTTestError.requiredNumberOfPinnedReposNotLoaded)
            }
        }

        waitForExpectations(timeout: 10.0) { (error) in
           print(error?.localizedDescription ?? "error")
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
