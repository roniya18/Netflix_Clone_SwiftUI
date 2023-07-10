//
//  SearchList.swift
//  Netflix
//
//  Created by alkesh s on 30/06/23.
//

import SwiftUI

struct SearchList: View {
    
    @State var movie : Movie
    @StateObject var viewModel = MovieViewModel()
    
    var body: some View {
        HStack{
            viewModel.poster(poster_path: movie.poster_path, width: 150, height: 100)
//            Image("movie1")
//                .resizable()
//                .frame(width: 150,height: 100)
//                .cornerRadius(5)
            Text(movie.title)
            Spacer()
            Image(systemName: "play.circle")
                .resizable()
                .frame(width: 40,height: 40)
        }

    }
}

struct SearchList_Previews: PreviewProvider {
    static var previews: some View {
        SearchList(movie:  Movie(id: 0, overview: "", poster_path: "", release_date: "", title: ""))
            .preferredColorScheme(.dark)
    }
}
