//
//  TabScreen.swift
//  RealworldSwiftUI
//
//  Created by Fernando Ortiz on 21/11/2022.
//

import SwiftUI

struct TabScreen: View {
    enum Selection {
        case home, search, bookmarks, profile
    }
    
    @State private var selectedTab: Selection
    
    init(selectedTab: Selection = Selection.home) {
        self.selectedTab = selectedTab
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(Selection.home)
            
            SearchScreen()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(Selection.search)
            
            BookmarksScreen()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Bookmarks")
                }
                .tag(Selection.bookmarks)
            
            ProfileScreen()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(Selection.profile)
        }
    }
}

#if DEBUG
struct TabScreenPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            TabScreen(selectedTab: .home)
                .previewDisplayName("Home")
            
            TabScreen(selectedTab: .search)
                .previewDisplayName("Search")
            
            TabScreen(selectedTab: .bookmarks)
                .previewDisplayName("Bookmarks")
            
            TabScreen(selectedTab: .profile)
                .previewDisplayName("Profile")
        }
    }
}
#endif
