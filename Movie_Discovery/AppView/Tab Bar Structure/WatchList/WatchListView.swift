//
//  WatchListView.swift
//  Movie_Discovery
//
//  Created by Square on 06/04/2022.
//

import SwiftUI
import CoreData

struct WatchListView: View {
    
    let coreData = PersistenceController()
    private func favoriteMovie() {
        showMovies = coreData.allMovies()
    }
    @State private var showMovies:[MovieData] = [MovieData]()
    
    var body: some View {
        VStack{
            List {
                
                ForEach(showMovies, id: \.self) { movie in
                    Text(movie.title ?? "")
                    Text(movie.posterPath ?? "")
                    Text(movie.releaseDate ?? "")
                }.onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        let movie = showMovies[index]
                        coreData.deleteMovie(movie: movie)
                    }
                })
            }
            .onAppear(perform: {
                favoriteMovie()
            })
        }
    }
}
struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView()
    }
}
