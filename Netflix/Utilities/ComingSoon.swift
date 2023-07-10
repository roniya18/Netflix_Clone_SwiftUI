//
//  ComingSoon.swift
//  Netflix
//
//  Created by alkesh s on 24/06/23.
//

import SwiftUI

struct ComingSoon: View {
    
    @StateObject var viewModel = MovieViewModel()
    @State var movie : Movie
    
    var body: some View {
            HStack(alignment: .top){
                VStack{
                    let(month,day) = viewModel.getDateMonth(dateString: movie.release_date)
                    Text("""
                            \(month.prefix(3).uppercased())
                            \(day)
                            """)
                    .bold()
                }
                VStack(alignment: .leading){
                    viewModel.poster(poster_path: movie.poster_path, width: 350, height: 200)
//                    Image("movie1")
//                        .resizable()
//                        .frame(height: 200)
//                        .cornerRadius(10)
                    HStack{
                        Text("\(movie.title)")
                        Spacer()
                        VStack{
                            Image(systemName: "bell")
                            Text("Remind Me")
                                .foregroundColor(.secondary)
                        }
                        VStack{
                            Image(systemName: "info.circle")
                            Text("Info")
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.top)
                    Text("\(movie.overview)")
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal)
            .frame(width:400,height: 400)
    }
}

struct ComingSoon_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoon(movie: Movie(id: 0, overview: "", poster_path: "", release_date: "", title: "")).previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
