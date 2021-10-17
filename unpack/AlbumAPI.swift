//
//  ContactAPI.swift
//  unpack
//
//  Created by Jad Slim on 2021-10-15.
//

import Foundation

class AlbumAPI {
 static func getAlbums() -> [Album]{
   let album = [
    Album(profileName: "jaddoescad", profileImageUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80", albumImage: "https://i.insider.com/5e2762f7ab49fd1ed25a9dc4?width=700", albumTitle: "My Wedding", likesNumber: 10, commentNumber: 12, imageNumber: 15),
    
    Album(profileName: "jaddoescad", profileImageUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80", albumImage: "https://i.insider.com/5e2762f7ab49fd1ed25a9dc4?width=700", albumTitle: "My Wedding", likesNumber: 10, commentNumber: 12, imageNumber: 15),
    
    Album(profileName: "jaddoescad", profileImageUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80", albumImage: "https://i.insider.com/5e2762f7ab49fd1ed25a9dc4?width=700", albumTitle: "My Wedding", likesNumber: 10, commentNumber: 12, imageNumber: 15),
    
    Album(profileName: "jaddoescad", profileImageUrl: "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80", albumImage: "https://i.insider.com/5e2762f7ab49fd1ed25a9dc4?width=700", albumTitle: "My Wedding", likesNumber: 10, commentNumber: 12, imageNumber: 15)
    ]
   return album
  }
}
