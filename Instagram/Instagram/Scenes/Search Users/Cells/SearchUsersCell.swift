//
//  SearchUsersCell.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 10.08.2023.
//

import SwiftUI

struct SearchUsersCell: View {
    @ObservedObject var item: SearchUsersModels.DisplayedItem
    
    var body: some View {
        VStack(spacing: ApplicationConstraints.constant.x0.rawValue) {
            self.setupUserDetails()
        }
    }
    
    @ViewBuilder func setupUserDetails() -> some View {
        HStack {
            self.setupUserImage()
            self.setupUserName()
            Spacer()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder func setupUserImage() -> some View {
        if let urlString = item.userImageUrl, let url = URL(string: urlString) {
            AsyncImage(url: url, content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            }, placeholder: {
                ProgressView()
            })
            .scaledToFill()
            .frame(width: ApplicationConstraints.constant.x40.rawValue, height: ApplicationConstraints.constant.x40.rawValue)
            .clipShape(Circle())
        } else if let placeholder = item.userImagePlaceholder {
            Image(systemName: placeholder)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFill()
                .frame(width: ApplicationConstraints.constant.x40.rawValue, height: ApplicationConstraints.constant.x40.rawValue)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func setupUserName() -> some View {
        VStack(alignment: .leading) {
            Text(self.item.username ?? String())
                .fontWeight(.semibold)
                .font(.footnote)
            Text(self.item.fullname ?? String())
        }
        .font(.footnote)
    }
}

struct SearchUsersCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchUsersCell(item: SearchUsersModels.DisplayedItem(id: String()))
    }
}
