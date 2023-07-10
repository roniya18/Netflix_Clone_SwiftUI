//
//  SwiftUIView.swift
//  Netflix
//
//  Created by alkesh s on 10/07/23.
//

import SwiftUI

struct SwiftUIView: View {
    @StateObject var viewModel = MovieViewModel()
    var body: some View {
        let array =  viewModel.upComing+viewModel.popularMovie+viewModel.topMovie
        ScrollView {
            VStack{
                ForEach(Array(array.enumerated()), id: \.element) { (index,movie) in
                    if index < viewModel.upComing.count{
                        ComingSoon(movie: movie)
                    }
                    else if index >= viewModel.upComing.count && index < viewModel.upComing.count+viewModel.popularMovie.count{
                        EveryonesWatching(movie: movie, width: 375, height: 200)
                    }else{
                        HStack(alignment: .top){
                            VStack{
                                Text("\(index+1)")
                                    .bold()
                            }
                            .padding(.leading)
                            .foregroundColor(.white)
                            EveryonesWatching(movie: movie, width: 350, height: 200)
                        }
                    }
                }
            }
            .onAppear(){
                 viewModel.fetchComingSoon()
                 viewModel.fetchpopularMovie()
                 viewModel.fetchtopMovie()

        }
        }
    }
}

struct UIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView().preferredColorScheme(.dark)
    }
}
