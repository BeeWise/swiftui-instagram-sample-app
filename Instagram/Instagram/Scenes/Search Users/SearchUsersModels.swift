//
//  SearchUsersModels.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-09.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import UIKit

enum SearchUsersModels {
    class PaginationModel {
        var isFetchingItems: Bool = false
        var noMoreItems: Bool = false
        var hasError: Bool = false
        var currentPage: Int = 0
        var limit: Int = 10
        var items: [User] = []
        
        func reset() {
            self.isFetchingItems = false
            self.noMoreItems = false
            self.hasError = false
            self.currentPage = 0
            self.limit = 10
            self.items = []
        }
    }
    
    class DisplayedItem: Identifiable, ObservableObject {
        let id: String
        
        @Published var userImageUrl: String?
        @Published var userImagePlaceholder: String?
        
        @Published var username: String?
        @Published var fullname: String?
        
        init(id: String, userImageUrl: String? = nil, userImagePlaceholder: String? = nil, username: String? = nil, fullname: String? = nil) {
            self.id = id
            self.userImageUrl = userImageUrl
            self.userImagePlaceholder = userImagePlaceholder
            self.username = username
            self.fullname = fullname
        }
    }
    
    struct ItemsSearch {
        struct Response {
            let queryText: String
        }
    }
    
    struct ItemsPresentation {
        struct Response {
            let items: [User]
        }
        
        struct ViewModel {
            let items: [DisplayedItem]
        }
    }
    
    enum NoMoreItemsPresentation {
        struct ViewModel {
            let text: String
        }
    }
    
    enum ErrorPresentation {
        struct Response {
            let error: OperationError?
        }
        
        struct ViewModel {
            let text: String
        }
    }
}
