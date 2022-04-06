//
//  Persistence.swift
//  Movie_Discovery
//
//  Created by Square on 06/04/2022.
//

import SwiftUI
import CoreData

final class PersistenceController {
    
    let persistantContainer: NSPersistentContainer
    
    init() {
        persistantContainer = NSPersistentContainer(name: "Movie_DiscoveryDataModel")
        persistantContainer.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
        }
    }
    
    func allMovies() -> [MovieData] {
        let fetchRequest: NSFetchRequest<MovieData> = MovieData.fetchRequest()
        
        do{
            return try persistantContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func saveMovie(title: String,posterPath: String, releaseDate: String) {
        
        let movieData = MovieData(context: persistantContainer.viewContext)
        movieData.title = title
        movieData.posterPath = posterPath
        movieData.releaseDate = releaseDate
        
        do{
            try persistantContainer.viewContext.save()
        } catch {
            persistantContainer.viewContext.rollback()
            print("Failed to save \(error)")
        }
    }
    func deleteMovie(movie: MovieData){
        persistantContainer.viewContext.delete(movie)
        do {
            try persistantContainer.viewContext.save()
        } catch {
            persistantContainer.viewContext.rollback()
            print("Failed to save \(error)")
        }
    }
}
