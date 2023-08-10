//
//  SearchUsersView+DisplayLogic.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 09.08.2023.
//

import SwiftUI

protocol SearchUsersDisplayLogic: AnyObject {
    func displayLoadingState()
    func displayNotLoadingState()

    func displayItems(viewModel: SearchUsersModels.ItemsPresentation.ViewModel)

    func displayNoMoreItems(viewModel: SearchUsersModels.NoMoreItemsPresentation.ViewModel)
    func displayRemoveNoMoreItems()

    func displayError(viewModel: SearchUsersModels.ErrorPresentation.ViewModel)
    func displayRemoveError()
}

extension SearchUsersView {
    class DisplayState: ObservableObject, SearchUsersDisplayLogic {
        @Published var searchText: String = String()
        
        @Published var items: [SearchUsersModels.DisplayedItem] = []
        @Published var isLoading: Bool = false
        
        @Published var noMoreItemsText: String = String()
        @Published var displayNoMoreItems: Bool = false
        
        @Published var error: String = String()
        @Published var displayError: Bool = false
        
        func displayLoadingState() {
            DispatchQueue.main.async {
                self.isLoading = true
            }
        }
        
        func displayNotLoadingState() {
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }

        func displayItems(viewModel: SearchUsersModels.ItemsPresentation.ViewModel) {
            DispatchQueue.main.async {
                self.items = viewModel.items
            }
        }

        func displayNoMoreItems(viewModel: SearchUsersModels.NoMoreItemsPresentation.ViewModel) {
            DispatchQueue.main.async {
                self.displayNoMoreItems = true
                self.noMoreItemsText = viewModel.text
            }
        }
        
        func displayRemoveNoMoreItems() {
            DispatchQueue.main.async {
                self.displayNoMoreItems = false
            }
        }

        func displayError(viewModel: SearchUsersModels.ErrorPresentation.ViewModel) {
            DispatchQueue.main.async {
                self.displayError = true
                self.error = viewModel.text
            }
        }
        
        func displayRemoveError() {
            DispatchQueue.main.async {
                self.displayError = false
            }
        }
    }
}
