//
//  SearchUsersStyle.swift
//  Instagram
//
//  Created by Bee Wise on 2023-08-09.
//  Copyright (c) 2023 Bee Wise Development S.R.L. All rights reserved.

import SwiftUI

class SearchUsersStyle {
    static let shared = SearchUsersStyle()

    var progressViewModel: ProgressViewModel
    var errorViewModel: ErrorViewModel
    var noMoreItemsViewModel: NoMoreItemsViewModel
    
    private init() {
        self.progressViewModel = ProgressViewModel()
        self.errorViewModel = ErrorViewModel()
        self.noMoreItemsViewModel = NoMoreItemsViewModel()
    }
    
    struct ProgressViewModel {
        func progressModifier() -> ProgressModifier { return ProgressModifier() }
        
        struct ProgressModifier: ViewModifier {
            func body(content: Content) -> some View {
                content
                .tint(ApplicationStyle.colors.black())
            }
        }
    }
    
    struct ErrorViewModel {
        func titleModifier() -> TitleModifier { return TitleModifier() }
        
        struct TitleModifier: ViewModifier {
            let padding = ApplicationConstraints.constant.x2.rawValue
            func body(content: Content) -> some View {
                content
                .font(ApplicationStyle.fonts.regular(size: 12))
                .foregroundColor(ApplicationStyle.colors.red())
                .padding(EdgeInsets(top: self.padding, leading: self.padding, bottom: self.padding, trailing: self.padding))
            }
        }
    }
    
    struct NoMoreItemsViewModel {
        func titleModifier() -> TitleModifier { return TitleModifier() }
        
        struct TitleModifier: ViewModifier {
            let padding = ApplicationConstraints.constant.x2.rawValue
            func body(content: Content) -> some View {
                content
                .font(ApplicationStyle.fonts.regular(size: 12))
                .foregroundColor(ApplicationStyle.colors.black())
                .padding(EdgeInsets(top: self.padding, leading: self.padding, bottom: self.padding, trailing: self.padding))
            }
        }
    }
}
