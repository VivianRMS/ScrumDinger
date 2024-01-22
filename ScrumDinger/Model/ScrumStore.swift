//
//  ScrumStore.swift
//  ScrumDinger
//
//  Created by Kunlin Ruan on 11/15/23.
//

import Foundation

@MainActor
class ScrumStore : ObservableObject{
    @Published var scrums: [DailyScrum] = []
    
    //locate the document directory for your app in a platform-agnostic way
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrums.data")
    }
    
    func load() async throws{
        let task = Task<[DailyScrum],Error>{
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else { return [] }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        let scrums = try await task.value
        self.scrums = scrums
    }
    
    func save(scrums: [DailyScrum]) async throws{
        let task = Task{
            let data = try JSONEncoder().encode(scrums)
            let outFile = try Self.fileURL()
            try data.write(to: outFile)
        }
        _ = try await task.value
    }
}

