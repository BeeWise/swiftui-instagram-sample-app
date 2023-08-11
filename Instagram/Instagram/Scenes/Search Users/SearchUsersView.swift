//
//  SearchUsersView.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 09.08.2023.
//

import SwiftUI

struct SearchUsersView: View {
    var interactor: SearchUsersBusinessLogic?
    
    @ObservedObject var displayState = DisplayState()
    
    init() {
        let interactor = SearchUsersInteractor()
        let presenter = SearchUsersPresenter()
        let displayer = DisplayState()
        
        presenter.displayer = displayer
        interactor.presenter = presenter
        
        self.interactor = interactor
        self.displayState = displayer
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: ApplicationConstraints.constant.x12.rawValue) {
                    ForEach(self.displayState.items) { item in
                        SearchUsersCell(item: item)
                    }
                }
                self.setupLoadingView()
                self.setupErrorText()
            }
            .searchable(text: self.$displayState.searchText, prompt: SearchUsersLocalization.shared.searchPromptText())
            .onChange(of: self.displayState.searchText) { queryText in
                self.interactor?.shouldSearchUsers(request: SearchUsersModels.ItemsSearch.Response(queryText: queryText))
            }
            .navigationTitle(SearchUsersLocalization.shared.title())
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                self.interactor?.shouldSearchUsers(request: SearchUsersModels.ItemsSearch.Response(queryText: self.displayState.searchText))
            }
        }
    }
    
    @ViewBuilder func setupLoadingView() -> some View {
        if self.displayState.isLoading {
            ProgressView()
                .modifier(SearchUsersStyle.shared.progressViewModel.progressModifier())
        }
    }
    
    @ViewBuilder func setupErrorText() -> some View {
        if self.displayState.displayError {
            Button {
                self.interactor?.shouldSearchUsers(request: SearchUsersModels.ItemsSearch.Response(queryText: self.displayState.searchText))
            } label: {
                Text(self.displayState.error)
                    .modifier(SearchUsersStyle.shared.errorViewModel.titleModifier())
            }
            
        }
    }
}

struct SearchUsersView_Previews: PreviewProvider {
    static var previews: some View {
        SearchUsersView()
    }
}
