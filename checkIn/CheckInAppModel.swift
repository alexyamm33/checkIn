//
//  CheckInAppModel.swift
//  checkIn
//
//  Created by Alex Yeh on 2022-10-02.
//

import Foundation

class CheckInAppModel {
    init(clinicHashKey: String) {
    }
    
    var pateint  = Patient()
    
    func getAPIKey(hashKey: String) -> String? {
        //Connect to AWS
        return nil
    }
    
    func getPatientWithOHIP(ohip: String) -> Patient {
        return Patient()
    }
    
    func getPatientWithName(firstName: String, lastName: String, dateOfBirth: String) -> Patient {
        return Patient()
    }
    
    func updatePatient(old: Patient, new: Patient) -> Bool {
        return true
    }
    
    func bookAppointment(patient: Patient, date: String, time: String) -> Bool {
        return true
    }
    
}
