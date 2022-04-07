//
//  WatchListView.swift
//  Movie_Discovery
//
//  Created by Square on 06/04/2022.
//

import SwiftUI
import CoreData

struct WatchListView: View {
    
    @StateObject var  coreDM = CoreDataManager()
    @State private var movies: [MovieData] = [MovieData]()
    var body: some View {
        NavigationView{
            VStack{
                List{
                    if coreDM.movies.isEmpty {
                        Text("Watchlist is empty")
                            .foregroundColor(.gray)
                            .font(.title)
                            .frame(width: 360, height: 25, alignment: .leading)
                            .padding(.leading, 25)
                            .padding(.trailing, 25)

                    } else {
                        ForEach(coreDM.movies, id: \.self) { movie in
                            Text(movie.title ?? "")
                        }.onDelete(perform: { (indexSet) in
                            self.coreDM.movies.remove(atOffsets: indexSet)
                            })
                    }
                }.padding()
                .navigationTitle("Watch List")
                .onAppear(perform: {
                    coreDM.getAllMovies()
                })
            }
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView(coreDM: CoreDataManager())
    }
}
