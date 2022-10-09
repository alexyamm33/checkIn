//
//  ViewModel.swift
//  checkIn
//
//  Created by Alex Yeh on 2022-10-02.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    init(hashKey: String) {
        self.model = CheckInAppModel(clinicHashKey: hashKey)
    }
    var model: CheckInAppModel
    
    func getPatientWithOHIP(ohip: String) -> Patient? {
        return model.getPatientWithOHIP(ohip: ohip)
    }
    
    func getPatientWithName(firstName: String, lastName: String, dateOfBirth: String) -> Patient? {
        return model.getPatientWithName(firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth)
    }
    
    func updatePatient(old: Patient, new: Patient) -> Bool {
        return model.updatePatient(old: old, new: new)
    }
    
    func bookAppointment(patient: Patient, date: String, time: String) -> Bool {
        return model.bookAppointment(patient: patient, date: date, time: time)
    }
    
    func updateCovidSymptom(to hasSymptoms: Bool) {
        model.pateint.hasCovidSymptoms = hasSymptoms
    }
}
