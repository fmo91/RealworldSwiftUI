//
//  HomeScreen.swift
//  RealworldSwiftUI
//
//  Created by Fernando Ortiz on 21/11/2022.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        Text("Home")
    }
}

#if DEBUG
struct HomeScreenPreviews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
#endif
