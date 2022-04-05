//
//  ContentView.swift
//  Movie_Discovery
//
//  Created by Square on 04/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .tag(0)
            
            HomeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("Movies")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
