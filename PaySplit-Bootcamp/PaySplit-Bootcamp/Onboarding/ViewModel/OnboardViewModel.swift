//
//  OnboardViewModel.swift
//  paysplit
//
//  Created by timofey makhlay on 4/27/20.
//  Copyright © 2020 dev. All rights reserved.
//

import UIKit

class OnboardViewModel {
    
    /// Raw data is stored here
    private var pages: [Onboard]!
    
    /// Repurposed data  for Cells
    private var cellViewModels: [OnboardCellViewModel] = [OnboardCellViewModel]() {
        didSet {
            self.reloadCollectionViewClosure?()
        }
    }
    
    /// Return the number of cell view models
    var numberOfCells: Int {
        return cellViewModels.count
    }
    
    /// Return closure for Completion closures (unused here)
    var reloadCollectionViewClosure: (()->())?
    
    /// Return cell at index value
    func getCellViewModel(at indexPath: IndexPath ) -> OnboardCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    /// Create cell view model from Onboarding Raw data
    func createCellViewModel(item: Onboard) -> OnboardCellViewModel {
        
        return OnboardCellViewModel(centerImageText: item.centerImgName, descriptionText: item.description, isGifBool: item.isGif)
    }
    
    /// Create pages raw data
    func createPages() {
        let items = [
            Onboard(centerImgName: "Scangiphy", description: "1. Scan any receipt or bill", isGif: true),
            Onboard(centerImgName: "manualGiphy", description: "2. Assign items to friends", isGif: true),
            Onboard(centerImgName: "venmoText", description: "3. Send request!", isGif: false)
        ]
        
        var vms = [OnboardCellViewModel]()
        
        for item in items {
            vms.append(createCellViewModel(item: item) )
        }
        self.cellViewModels = vms
//        self.reloadCollectionViewClosure?()
    }
}
