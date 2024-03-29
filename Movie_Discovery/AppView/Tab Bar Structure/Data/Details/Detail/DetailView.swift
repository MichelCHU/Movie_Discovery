//
//  DetailView.swift
//  Movie_Discovery
//
//  Created by Square on 05/04/2022.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject var coreDM = CoreDataManager()
    let movieId: Int
    @State private var movies: [MovieData] = [MovieData]()
    @ObservedObject private var detailLoadingMovie = DetailLoadingMovie()
    
    func addButton() {
        coreDM.saveMovie(title: detailLoadingMovie.movie?.title ?? "", posterPath: "", releaseDate: "")
    }
    
    var body: some View {
        ZStack {
            LoadingView(isLoading: self.detailLoadingMovie.isLoading, error: self.detailLoadingMovie.error) {
                self.detailLoadingMovie.loadMovie(id: self.movieId)
            }
            if detailLoadingMovie.movie != nil {
                MovieDetailListView(movie: self.detailLoadingMovie.movie!)
            }
        }
        .toolbar(content: {
            Button(action: {
                addButton()
            }, label: {
                Label("Addwatchlist", systemImage: "heart")
                    
            })
        }).accessibility(identifier: "ButtonAdded")
        .navigationBarTitle(detailLoadingMovie.movie?.title ?? "")
        .onAppear {
            self.detailLoadingMovie.loadMovie(id: self.movieId)
        }
    }
}

struct MovieDetailListView: View {
    
    let movie: Movie
    @State private var selectedTrailer: MovieVideo?
    let imageLoader = LoadingImage()
    
    var body: some View {
        List {
            MovieDetailImage(imageLoader: imageLoader, imageURL: self.movie.backdropURL)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            HStack {
                Text(movie.genreText)
                Text("·")
                Text(movie.yearText)
                Text(movie.durationText)
            }
            Text(movie.overview)
            HStack {
                if !movie.ratingText.isEmpty {
                    Text(movie.ratingText).foregroundColor(.yellow)
                }
                Text(movie.scoreText)
            }
            Divider()
            HStack(alignment: .top, spacing: 4) {
                if movie.cast != nil && movie.cast!.count > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Starring").font(.headline)
                        ForEach(self.movie.cast!.prefix(9)) { cast in
                            Text(cast.name)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Spacer()
                }
                if movie.crew != nil && movie.crew!.count > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        if movie.directors != nil && movie.directors!.count > 0 {
                            Text("Director(s)").font(.headline)
                            ForEach(self.movie.directors!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                        if movie.producers != nil && movie.producers!.count > 0 {
                            Text("Producer(s)").font(.headline)
                                .padding(.top)
                            ForEach(self.movie.producers!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                        if movie.screenWriters != nil && movie.screenWriters!.count > 0 {
                            Text("Screenwriter(s)").font(.headline)
                                .padding(.top)
                            ForEach(self.movie.screenWriters!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
            }
            Divider()
            if movie.youtubeTrailers != nil && movie.youtubeTrailers!.count > 0 {
                Text("Trailers").font(.headline)
                ForEach(movie.youtubeTrailers!) { trailer in
                    Button(action: {
                        self.selectedTrailer = trailer
                    }) {
                        HStack {
                            Text(trailer.name)
                            Spacer()
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(Color(UIColor.systemRed))
                        }
                    }
                }
            }
        }
        .sheet(item: self.$selectedTrailer) { trailer in
            SafariView(url: trailer.youtubeURL!)
        }
    }
}

struct MovieDetailImage: View {
    
    @ObservedObject var imageLoader: LoadingImage
    let imageURL: URL
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.gray.opacity(0.3))
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear {
            self.imageLoader.loadImage(with: self.imageURL)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(movieId: Movie.stubbedMovie.id)
        }
    }
}
