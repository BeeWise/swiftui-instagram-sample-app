//
//  SearchUsersPresenter.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-09.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

protocol SearchUsersPresentationLogic {
    func presentLoadingState()
    func presentNotLoadingState()
    
    func presentItems(response: SearchUsersModels.ItemsPresentation.Response)
    
    func presentNoMoreItems()
    func presentRemoveNoMoreItems()

    func presentError(response: SearchUsersModels.ErrorPresentation.Response)
    func presentRemoveError()
}

class SearchUsersPresenter: SearchUsersPresentationLogic {
    weak var displayer: SearchUsersDisplayLogic?
    
    func presentLoadingState() {
        self.displayer?.displayLoadingState()
    }
    
    func presentNotLoadingState() {
        self.displayer?.displayNotLoadingState()
    }
    
    func presentItems(response: SearchUsersModels.ItemsPresentation.Response) {
        self.displayer?.displayItems(viewModel: SearchUsersModels.ItemsPresentation.ViewModel(items: self.displayedItems(users: response.items)))
    }
    
    func presentNoMoreItems() {
        let text = FeedLocalization.shared.noMoreItemsText()
        self.displayer?.displayNoMoreItems(viewModel: SearchUsersModels.NoMoreItemsPresentation.ViewModel(text: text))
    }
    
    func presentRemoveNoMoreItems() {
        self.displayer?.displayRemoveNoMoreItems()
    }
    
    func presentError(response: SearchUsersModels.ErrorPresentation.Response) {
        let text = FeedLocalization.shared.errorText()
        let viewModel = SearchUsersModels.ErrorPresentation.ViewModel(text: text)
        self.displayer?.displayError(viewModel: viewModel)
    }
    
    func presentRemoveError() {
        self.displayer?.displayRemoveError()
    }
    
    func displayedItems(users: [User]) -> [SearchUsersModels.DisplayedItem] {
        return users.map { user in
            self.displayedItem(user: user)
        }
    }
    
    func displayedItem(user: User) -> SearchUsersModels.DisplayedItem {
        let item = SearchUsersModels.DisplayedItem(id: user.id)
        item.userImageUrl = user.imageUrl
        item.userImagePlaceholder = FeedStyle.shared.cellViewModel.userPlaceholderImage
        item.username = user.username
        item.fullname = user.fullname
        return item
    }
}
