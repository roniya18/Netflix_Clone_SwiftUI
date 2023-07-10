//
//  TabView.swift
//  Netflix
//
//  Created by alkesh s on 29/06/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
                HomeView()
                    .tabItem{
                        Label("Home", systemImage: "house")
                            .foregroundColor(.gray)
                    }
                    .toolbarBackground(Color.black, for: .tabBar)
                New_HotView()
                    .tabItem{
                        Label("New & Hot", systemImage: "play.rectangle.on.rectangle")
                            .foregroundColor(.gray)
                    }
                    .toolbarBackground(Color.black, for: .tabBar)

                SearchView()
                    .tabItem{
                        Label("Search", systemImage: "magnifyingglass")
                            .foregroundColor(.gray)
                    }
                    .toolbarBackground(Color.black, for: .tabBar)

                DownloadView()
                    .tabItem{
                        Label("Downloads", systemImage: "arrow.down.circle")
                            .foregroundColor(.gray)
                    }
                    .toolbarBackground(Color.black, for: .tabBar)

            
        }
        .tint(.white)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
        
    }
}
