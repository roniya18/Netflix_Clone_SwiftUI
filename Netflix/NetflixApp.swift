//
//  NetflixApp.swift
//  Netflix
//
//  Created by alkesh s on 21/06/23.
//

import SwiftUI

@main
struct NetflixApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
            //SwiftUIView()
            //HomeView()
                .preferredColorScheme(.dark)
             //  .onAppear(){
//                    Task{
//                        await MovieViewModel().fetchTrending()
//                        await MovieViewModel().fetchtopMovie()
//                        await MovieViewModel().fetchpopularTV()
                //        MovieViewModel().fetchpopularMovie()
//                    }
           //    }
        }
    }
}
