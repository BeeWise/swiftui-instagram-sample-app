//
//  SearchUsersInteractor.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-09.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import UIKit

protocol SearchUsersBusinessLogic {
    func shouldSearchUsers(request: SearchUsersModels.ItemsSearch.Response)
}

class SearchUsersInteractor: SearchUsersBusinessLogic, SearchUsersWorkerDelegate {
    var presenter: SearchUsersPresentationLogic?
    var worker: SearchUsersWorker?
    
    var paginationModel: SearchUsersModels.PaginationModel = SearchUsersModels.PaginationModel()
    
    init() {
        self.worker = SearchUsersWorker(delegate: self)
    }
    
    func shouldSearchUsers(request: SearchUsersModels.ItemsSearch.Response) {
        if !self.paginationModel.isFetchingItems && !self.paginationModel.noMoreItems {
            self.paginationModel.reset()
            self.presenter?.presentItems(response: SearchUsersModels.ItemsPresentation.Response(items: self.paginationModel.items))
            
            self.presenter?.presentRemoveError()
            
            self.paginationModel.isFetchingItems = true
            self.presenter?.presentLoadingState()
            
            self.worker?.cancelAllOperations()
            self.worker?.searchUsers(text: request.queryText, page: self.paginationModel.currentPage, limit: self.paginationModel.limit)
        }
    }
    
    func successDidSearchUsers(users: [User]) {
        self.paginationModel.isFetchingItems = false
        self.paginationModel.items = users
        self.paginationModel.currentPage += 1
        self.paginationModel.hasError = false

        self.presenter?.presentNotLoadingState()
        self.presenter?.presentItems(response: SearchUsersModels.ItemsPresentation.Response(items: users))
        self.presenter?.presentRemoveError()
    }
    
    func failureDidSearchUsers(error: OperationError) {
        self.paginationModel.isFetchingItems = false
        self.paginationModel.hasError = true
        self.presenter?.presentNotLoadingState()
        self.presenter?.presentError(response: SearchUsersModels.ErrorPresentation.Response(error: error))
    }
}
