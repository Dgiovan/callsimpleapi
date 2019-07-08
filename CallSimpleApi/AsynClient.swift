//
//  AsynClient.swift
//  CallSimpleApi
//
//  Created by Josue J Maqueda Flores on 6/1/19.
//  Copyright © 2019 Josue J Maqueda Flores. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

class AsyncClient
{
    class func getRequestExecute<T:Mappable>(_ params:Parameters? = nil, url:String, completion:@escaping (_ dataResponse:T) -> Void, errorCompletion:@escaping (_ errorString:String) -> Void)
    {
        //let headers = ["Authorization": "Basic \(base64Credentials)"]

        //Alamofire.request(url, method: .post, headers: headers).responseObject{ (response:
        Alamofire.request(url, method:.get, parameters:params).responseObject { (response:DataResponse<T>) in
            if response.result.isSuccess
            {
                if let responseService = response.result.value
                {
                    completion(responseService)
                }
                else
                {
                    errorCompletion("Error en el objeto de respuesta, validar!!!!!")
                }
            }
            else
            {
                errorCompletion((response.error?.localizedDescription)!)
            }
        }
    }
}
