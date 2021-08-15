//
//  BrotherListModel.swift
//  Delt Info
//
//  Created by Dylan Mace on 8/14/21.
//

import Foundation
import Alamofire
import SwiftyJSON


class BrotherResponse: Codable {
    var brothers: [Brother]
}
class MajorResponse: Codable {
    var majors: [String]
}
class PCResponse: Codable {
    var years: [String]
}
class StateResponse: Codable {
    var states: [String]
}


class BrotherListModel : ObservableObject{
    @Published var brothers = [Brother]()
    @Published var descending = false
    @Published var sortby: String = "Initiation #"
    @Published var major = "All"
    @Published var pcYear = "All"
    @Published var pcSem = "All"
    @Published var state = "All"
    
    @Published var sortOptions = ["Initiation #", "Age", "Graduation Date"]
    @Published var majors: [String] = ["All"]
    @Published var pcYears: [String] = ["All"]
    @Published var pcSemesters = ["All", "Spring", "Fall"]
    @Published var hometownStates: [String] = ["All"]
    
    init() {
        getAllBrothers()
    }
    
    func getAllBrothers(count: Int = 5) {
        AF.request("http://172.20.10.12:5000/api/brothers")
            .validate()
            .responseDecodable(of: BrotherResponse.self) { (response) in
                print(response)
                guard let brothers = response.value else { return }
                self.brothers = brothers.brothers
            }
    }
    
    func getFilters() {
        AF.request("http://172.20.10.12:5000/api/majors")
            .validate()
            .responseDecodable(of: MajorResponse.self) { (response) in
                guard let items = response.value else { return }
                self.majors = ["All"] + items.majors
                print(self.majors)
            }
        AF.request("http://172.20.10.12:5000/api/pledge_class_years")
            .validate()
            .responseDecodable(of: PCResponse.self) { (response) in
                guard let items = response.value else { return }
                self.pcYears = ["All"] + items.years
            }
        AF.request("http://172.20.10.12:5000/api/hometown_states")
            .validate()
            .responseDecodable(of: StateResponse.self) { (response) in
                guard let items = response.value else { return }
                self.hometownStates = ["All"] + items.states
            }
        
    }
    
    func updateBrotherList() {
        print("foo")
        let spacelessSort = self.sortby.replacingOccurrences(of: "\\s|#",
                                                 with: "",
                                                 options: [.regularExpression])
        let url = "http://172.20.10.12:5000/api/brothers?sortBy=\(spacelessSort)&descending=\(self.descending)&major=\(self.major)&pcYear=\(self.pcYear)&pcSem=\(self.pcSem)&state=\(self.state)"
        print(url)
        AF.request(url)
            .validate()
            .responseDecodable(of: BrotherResponse.self) { (response) in
                print(response)
                guard let brothers = response.value else { return }
                self.brothers = brothers.brothers
            }
    }
}
