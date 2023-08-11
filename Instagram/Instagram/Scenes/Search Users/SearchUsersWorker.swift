//
//  SearchUsersWorker.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-09.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import UIKit

protocol SearchUsersWorkerDelegate: AnyObject {
    func successDidSearchUsers(users: [User])
    func failureDidSearchUsers(error: OperationError)
}

class SearchUsersWorker {
    weak var delegate: SearchUsersWorkerDelegate?
    
    var searchUsersQueue: OperationQueue = OperationQueue()
    
    init(delegate: SearchUsersWorkerDelegate?) {
        self.delegate = delegate
        self.searchUsersQueue.maxConcurrentOperationCount = 1
    }
    
    func cancelAllOperations() {
        self.searchUsersQueue.cancelAllOperations()
    }
    
    func searchUsers(text: String, page: Int, limit: Int) {
        let delay: Int = Int.random(in: 350...1000)
        let shouldFail: Bool = Int.random(in: 0...10) > 8
        
        self.searchUsersQueue.addOperation {
            DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(delay)) {
                if shouldFail {
                    self.delegate?.failureDidSearchUsers(error: OperationError.noDataAvailable)
                } else {
                    self.delegate?.successDidSearchUsers(users: self.filterUsers(text: text))
                }
            }
        }
    }
    
    private func filterUsers(text: String) -> [User] {
        if text.isEmpty {
            return User.dummyUsers
        }
        return User.dummyUsers.filter({ $0.fullname.range(of: text, options: .caseInsensitive) != nil })
    }
}
