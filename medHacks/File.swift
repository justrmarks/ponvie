//
//  File.swift
//  medHacks
//
//  Created by Justice Marks on 11/19/16.
//  Copyright © 2016 MedHackBucks. All rights reserved.
//

import UIKit
import CoreLocation
import HealthKit
var str = "Hello, playground"

class TimerViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    var zeroTime = TimeInterval()
    var timer : Timer = Timer()
    
    let locationManager = CLLocationManager()
    var startLocation: CLLocation!
    var lastLocation: CLLocation!
    var distanceTraveled = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Need to Enable Location")
        }
        
        // We cannot access the user's HealthKit data without specific permission.
        getHealthKitPermission()
         {
            
            // Seek authorization in HealthKitManager.swift.
            healthManager.authorizeHealthKit { (authorized,  error) -> Void in
                if authorized {
                    
                    // Get and set the user's height.
                    self.setHeight()
                } else {
                    if error != nil {
                        print(error)
                    }
                    print("Permission denied.")
                }
            }
        }
        let healthKitStore: HKHealthStore = HKHealthStore()
        
        func authorizeHealthKit(completion: ((_: Bool, _: NSError?) -> Void)!){
        
        // State the health data type(s) we want to read from HealthKit.
        let healthDataToRead = Set(arrayLiteral: HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!)
        
        // State the health data type(s) we want to write from HealthKit.
        let healthDataToWrite = Set(arrayLiteral: HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!)
        
        // Just in case OneHourWalker makes its way to an iPad...
        if !HKHealthStore.isHealthDataAvailable() {
            print("Can't access HealthKit.")
        }
        
        // Request authorization to read and/or write the specific data.
        healthKitStore.requestAuthorization(toShare: healthDataToWrite, read: healthDataToRead) { (success, error) -> Void in
            if( completion != nil ) {
                completion (success)}}};;
