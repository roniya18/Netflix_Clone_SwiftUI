//
//  SearchView.swift
//  Netflix
//
//  Created by alkesh s on 29/06/23.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @StateObject var viewModel = MovieViewModel()
    
    var body: some View {
        NavigationStack{
            
            if searchText == ""{
                VStack(alignment: .leading){
                    Text("Top Search")
                        .fontWeight(.heavy)
                        .font(.system(size: 20))
                        .padding(.horizontal)
                    List(viewModel.popularMovie, rowContent: {movie in
                        SearchList(movie: movie)
                    })
                    .listStyle(.plain)
                }
                
            }
            else{
                    VStack(alignment: .leading){
                        Text("Movies & TV")
                            .fontWeight(.heavy)
                            .font(.system(size: 20))
                            .padding(.horizontal)
                    ScrollView{

                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))],spacing: 20)
                        {
                            ForEach(viewModel.search) { movie in
                                viewModel.poster(poster_path: movie.poster_path, width: 120, height: 180)
                                //                            Image("movie1")
                                //                                .resizable()
                                //                                .frame(width: 120,height: 180)
                                //                                .cornerRadius(5)
                            }
                        }
                    }
                    .padding(.vertical)
                    .onChange(of: searchText, perform: { newValue in
                        viewModel.search(keyword: newValue)
                    })
                }
                   
            }

        }
        
        .searchable(text: $searchText)
        .onAppear(){
            viewModel.fetchpopularMovie()
        }
      
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
    }
}
