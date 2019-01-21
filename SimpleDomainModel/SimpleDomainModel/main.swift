//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
    public var amount : Int
    public var currency : String
    
    public func convert(_ to: String) -> Money {
        if self.currency == to {
            return self
        }
        
        if self.currency == "USD" {
            return convertUSD(to: to)
        } else {
            return convertToUSD(from: self.currency)
        }
    }
    
    public func add(_ to: Money) -> Money {
        let converted = self.convert(to.currency)
        return Money(amount: converted.amount + to.amount, currency: to.currency)
    }
    public func subtract(_ from: Money) -> Money {
        let converted = self.convert(from.currency)
        return Money(amount: from.amount - converted.amount, currency: from.currency)
    }
    
    private func convertUSD(to: String) -> Money {
        switch to {
        case "GBP":
            return Money(amount: self.amount / 2, currency: "GBP")
        case "EUR":
            let newAmount = self.amount + self.amount / 2
            return Money(amount: newAmount, currency: "EUR")
        default: // CAN
            let newAmount = self.amount + self.amount / 4
            return Money(amount: newAmount, currency: "CAN")
        }
    }
    
    private func convertToUSD(from: String) -> Money {
        var amount = 0
        switch from {
        case "GBP":
            amount = self.amount * 2
        case "EUR":
            amount = self.amount - (self.amount / 3)
        default: // CAN
            amount = self.amount - (self.amount / 5)
        }
        return Money(amount: amount, currency: "USD")
    }
    
}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }
  
  public init(title : String, type : JobType) {
  }
  
  open func calculateIncome(_ hours: Int) -> Int {
  }
  
  open func raise(_ amt : Double) {
  }
}

////////////////////////////////////
// Person
//
open class Person {
  open var firstName : String = ""
  open var lastName : String = ""
  open var age : Int = 0

  fileprivate var _job : Job? = nil
  open var job : Job? {
    get { }
    set(value) {
    }
  }
  
  fileprivate var _spouse : Person? = nil
  open var spouse : Person? {
    get { }
    set(value) {
    }
  }
  
  public init(firstName : String, lastName: String, age : Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
  }
  
  open func toString() -> String {
  }
}

////////////////////////////////////
// Family
//
open class Family {
  fileprivate var members : [Person] = []
  
  public init(spouse1: Person, spouse2: Person) {
  }
  
  open func haveChild(_ child: Person) -> Bool {
  }
  
  open func householdIncome() -> Int {
  }
}





