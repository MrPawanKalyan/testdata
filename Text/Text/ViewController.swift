//
//  ViewController.swift
//  Text
//
//  Created by Raveendra choudary on 21/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendPostRequest()
    }
    
    
    
    func sendPostRequest() {
        // Define the URL for your API endpoint
        guard let url = URL(string: "https://corp13api.myclassboard.com/api/v1_MAppTeacherAPI/T_Save_CCECoScholasticResult") else {
            print("Invalid URL")
            return
        }
        
        
       
        // Create a URLRequest with the specified URL
        var request = URLRequest(url: url)
        
        // Set the HTTP method to POST
        request.httpMethod = "POST"
        
        // Set the request's content type to JSON
        request.setValue("25", forHTTPHeaderField: "SchoolUniqueID")
        request.setValue("MCBTeacherApp", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("lkg786-0189-ias-gm19-marmoavis", forHTTPHeaderField: "api_key")
        
        // Create a dictionary with your POST data
        let postData = ["BranchSectionID": 758, "AcademicYearID": 14,"CCEPartID": 2785,"CoScholasticSkillID": 6113,"CCETermID": 2328,"AssessmentNo": 1,"CoScholasticSubSkillID": 6514,"ResultJson":"[{\"Grade\":\"B\",\"CoScholasticsSkillResultID\":857575,\"StudentEnrollmentID\":146347,\"CoScholasticsSubSkillResultID\":504440},{\"CoScholasticsSubSkillResultID\":504443,\"CoScholasticsSkillResultID\":857576,\"Grade\":\"B\",\"StudentEnrollmentID\":142593}]","apikey": "a8ac2894-iosteachid-4b30-mcb-1ec75f852807"] as [String : Any]
        
        // Convert the dictionary to JSON data
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: postData)
            request.httpBody = jsonData
        } catch {
            print("Error converting data to JSON: \(error)")
            return
        }
        
        // Create a URLSession task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Handle the response here
            
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Assuming your server returns JSON data
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("Response JSON: \(json)")
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        
        // Start the URLSession task
        task.resume()
    }
    
   
}
