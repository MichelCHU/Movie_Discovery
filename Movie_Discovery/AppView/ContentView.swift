//
//  ContentView.swift
//  Movie_Discovery
//
//  Created by Square on 04/04/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [])

    private var watchList: FetchedResults<MovieData>
    
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
                .tag(1)
            WatchListView(coreDM: CoreDataManager())
                .tabItem {
                    VStack {
                        Image(systemName: "heart.fill")
                        Text("Watch List")
                    }
                }
                .tag(2)
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
