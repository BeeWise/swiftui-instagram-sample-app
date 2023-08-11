//
//  SearchUsersLocalization.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-09.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import UIKit

class SearchUsersLocalization {
    static let shared = SearchUsersLocalization()
    
    private init() {
        
    }
    
    struct LocalizedKey {
        static let
            title = "SearchUsers.scene.title",
            noMoreItemsText = "SearchUsers.scene.no.more.items.text",
            errorText = "SearchUsers.scene.error.text",
            searchPromptText = "SearchUsers.scene.search.prompt.text"
    }
    
    func title() -> String { LocalizedKey.title.localized() }
    func noMoreItemsText() -> String { LocalizedKey.noMoreItemsText.localized() }
    func errorText() -> String { LocalizedKey.errorText.localized() }
    func searchPromptText() -> String { LocalizedKey.searchPromptText.localized() }
}
