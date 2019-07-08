//
//  BackendUrlManager.swift
//  CallSimpleApi
//
//  Created by Josue J Maqueda Flores on 6/1/19.
//  Copyright © 2019 Josue J Maqueda Flores. All rights reserved.
//

import Foundation

class BackendUrlManager:NSObject
{
    enum ServiceUrlId:Int {
        case pokemonList = 0
        case pokemonForm
    }
    //
    fileprivate static let SERVICE_CONTEXT:[String] = [
        "/pokemon/",
        "/pokemon-form/"
    ]
    //
    public static let BASE_SERVER_URL:String = "pokeapi.co/api/v2"
    public static let BASE_PROTOCOL:String = "https://"
    //
    fileprivate var servicesUrls:[String] = [String]()
    //
    fileprivate func createUrls()
    {
        let backendHost = BackendUrlManager.BASE_SERVER_URL
        let backendProtocol = BackendUrlManager.BASE_PROTOCOL
        //
        let serviceCount = BackendUrlManager.SERVICE_CONTEXT.count
        //
        for index in 0..<serviceCount
        {
            let nextUrl:String = "\(backendProtocol)\(backendHost)\(BackendUrlManager.SERVICE_CONTEXT[index])"
            servicesUrls.append(nextUrl)
        }
    }

    func getUrl(_ urlId:ServiceUrlId) -> String
    {
        let selectedUrl:String = servicesUrls[urlId.rawValue]
        return selectedUrl
    }

    fileprivate override init()
    {
        super.init()
        self.createUrls()
    }
    //

    //Singleton instance
    static let shared:BackendUrlManager = BackendUrlManager()
}

