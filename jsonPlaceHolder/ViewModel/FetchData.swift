//
//  FetchData.swift
//  jsonPlaceHolder
//
//  Created by Ripon sk on 10/10/22.
//

import Foundation
import UIKit
import Combine
struct Results:Codable{
    var title:String?
    var body:String?
}
class FetchData{
    static var shared = FetchData()
  
    func fetchdata(url:URL?, completion:@escaping ([Results]?,Error?)->Void?){
        guard let urls = url else{fatalError("wrong url")}
        let task = URLSession.shared.dataTask(with: urls) { data, _, err in
            guard let data = data,err == nil else{
              completion(nil,err)
                return
            }
            do {
                let json = try JSONDecoder().decode([Results].self, from: data)
                completion(json,nil)
                
            }catch{
            print("err is:\(err?.localizedDescription)")
            }
            
            
                    
        }
        task.resume()
    }
    func fetchasync(url:URL?) async ->[Results]?{
        guard let url = url else{
            return []
        }
        let (data,_) = try! await URLSession.shared.data(from: url)
        do{
            return try? JSONDecoder().decode([Results].self, from: data)
        }catch{
            
        }
    }
//    func fetchdatacombine(url:URL?)->AnyPublisher<[Results],Error>{
//        guard let url = url else{fatalError("wrong url")}
//        do{
//            return try URLSession.shared.dataTaskPublisher(for: url).map{$0.data}.decode(type: [Results].self, decoder: JSONDecoder()).eraseToAnyPublisher()
//        }catch{
//            
//        }
//        
//    }
}
