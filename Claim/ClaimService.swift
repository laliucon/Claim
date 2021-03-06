//
//  ClaimService.swift
//  TestProject
//
//  Created by Hung Cun on 11/25/20.
//
import UIKit
import Foundation

struct Claim : Codable {
    var id : UUID?
    var title : String
    var date : String
    var isSolved : Bool?
    
    
    init(this_title:String,this_date:String){
        title=this_title
        date=this_date
    }
}

class ClaimService {

    var ClaimList : [Claim] = [Claim]()
    var addComplete: Bool!
    
    func addClaim(pObj : Claim) {
        // Implement logic using Async HTTP client API (POST method)
        let requestUrl = "http://localhost:8020/ClaimService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(pObj)
        //
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            (data, response, error) in
            if let resp = data {
                // type of resp is Data
                let respStr = String(bytes: resp, encoding: .utf8)
                print("The response data sent from the server is \(respStr!)")
                self.addComplete = true
            } else if let respError = error {
                print("Server Error : \(respError)")
                self.addComplete = false
            }
        }
        task.resume()
    }
    
    func getAll() {
        //var ClaimList = [Claim]()
        print("About to send HTTP request to server")
        let requestUrl = "http://localhost:8020/ClaimService/getAll"
        let request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let task = URLSession.shared.dataTask(with: request){
            (data, response, error) in
            if let respData = data {
                // data is of Data type
                //et respStr = String(data: respData, encoding: .utf8)
                //print("The response data is \(respStr!)")
                self.ClaimList = try! JSONDecoder().decode([Claim].self, from: respData)
                print("The Claim List : \(self.ClaimList)")
            }
        }
        //
        task.resume()
    }
}
