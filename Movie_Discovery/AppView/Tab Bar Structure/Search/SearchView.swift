//
//  SearchView.swift
//  Movie_Discovery
//
//  Created by Square on 04/04/2022.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var searchingData = SearchingBar()
    
    var body: some View {
        NavigationView {
            List {
                // listRowInsets is like a UITableView Static Cell
                SearchBarView(placeholder: "Search movies", text: self.$searchingData.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                
                LoadingView(isLoading: self.searchingData.isLoading, error: self.searchingData.error) {
                    self.searchingData.search(query: self.searchingData.query)
                }
                
                if self.searchingData.movies != nil {
                    ForEach(self.searchingData.movies!) { movie in
                        NavigationLink(destination: DetailView(movieId: movie.id)) {
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                Text(movie.yearText)
                            }
                        }
                    }
                }
            }
            .onAppear {
                self.searchingData.startObserve()
            }
            .navigationBarTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
