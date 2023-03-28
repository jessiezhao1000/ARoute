//
//  GroceryList.swift
//  ARoute
//
//  Created by Yiwen Zhao on 3/28/23.
//

import Foundation

struct Grocery {
    var title: String
    var type: String
    var aisle: String? = nil
    var isComplete: Bool = false
}

#if DEBUG
extension Grocery {
    static var sampleData = [
            Grocery(
                title: "Submit reimbursement report",
                type: "PRODUCE",
                aisle: "13"),
            Grocery(
                title: "Code review",
                type: "PRODUCE",
                aisle: "13",
                isComplete: true),
            Grocery(
                title: "Pick up new contacts",
                type: "PRODUCE",
                aisle: "13"),
            Grocery(
                title: "Add notes to retrospective",
                type: "PRODUCE",
                aisle: "13",
                isComplete: true),
            Grocery(
                title: "Interview new project manager candidate",
                type: "PRODUCE",
                aisle: "13"),
            Grocery(
                title: "Mock up onboarding experience",
                type: "PRODUCE",
                aisle: "13"),
            Grocery(
                title: "Review usage analytics",
                type: "PRODUCE",
                aisle: "13"),
            Grocery(
                title: "Confirm group reservation",
                type: "PRODUCE",
                aisle: "13"),
            Grocery(
                title: "Add beta testers to TestFlight",
                type: "PRODUCE",
                aisle: "13")
        ]
}
#endif
