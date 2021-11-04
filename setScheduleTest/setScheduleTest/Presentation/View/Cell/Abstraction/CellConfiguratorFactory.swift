//
//  CellConfiguratorFactory.swift
//  setScheduleTest
//
//  Created by JMC on 30/10/21.
//

import Foundation


typealias SearchItemCellConfig = TableViewCellConfigurator<SearchItemCell, AbstractCellViewModel>
typealias ShimmerItemCellConfig = TableViewCellConfigurator<SearchShimmerCell, AbstractCellViewModel>


// collection of cell configurator
//class CellConfiguratorFactory {
//    private var items: [CellConfigurator] = []
//    
//    //get cell confurator by cellviewmodel
//    public func getCellConfigurator(cellViewModel: AbstractCellViewModel, index: Int) -> CellConfigurator? {
//        var cellConfig: CellConfigurator!
//        
//        cellConfig = SearchItemCellConfig.init(item: cellViewModel)
//        
//        return cellConfig
//    }
//    
//    //add cell configurator converted from cellviewmodel
//    public func addAsCellConfigurator(cellViewModel: AbstractCellViewModel) {
//        let cellConfig = SearchItemCellConfig.init(item: cellViewModel)
//        items.append(cellConfig)
//    }
//   
//    //add multiple cell configurator converted from cellviewmodel
//    public func addAllAsCellConfigurator(cellViewModels: [AbstractCellViewModel]) {
//        items.removeAll()
//        
//        for cellViewModel in cellViewModels {
//            let cellConfig = SearchItemCellConfig.init(item: cellViewModel)
//            items.append(cellConfig)
//        }
//    }
//
//    
//    public func clearAndaddAllAsCellConfigurator(cellViewModels: [AbstractCellViewModel]) {
//        items.removeAll()
//        
//        for cellViewModel in cellViewModels {
//            let cellConfig = SearchItemCellConfig.init(item: cellViewModel)
//            items.append(cellConfig)
//        }
//    }
//    
//    public func addCellConfigurator(cellConfig: CellConfigurator) {
//        items.append(cellConfig)
//    }
//    
//    public func insertAsCellConfigurator(cellViewModel: AbstractCellViewModel, at index: Int) {
//        let cellConfig = SearchItemCellConfig.init(item: cellViewModel)
//        items.append(cellConfig)
//    }
//    
//    public func updateAsCellConfigurator(cellViewModel: AbstractCellViewModel, at index: Int) {
//        let cellConfig = SearchItemCellConfig.init(item: cellViewModel)
//        items[index] = cellConfig
//    }
//    
//    public func insertCellConfigurator(cellConfig: CellConfigurator, at index: Int) {
//        items.insert(cellConfig, at: index)
//    }
//    
//    public func getCellConfigurator(at index: Int) -> CellConfigurator {
//        return items[index]
//    }
//    
//    public func updateCellConfigurator(cellConfig: CellConfigurator, at index: Int) {
//        items[index] = cellConfig
//    }
//    
//    public func getCount() -> Int {
//        return items.count
//    }
//    
//    public func getLastItem() -> CellConfigurator? {
//        return items.last
//    }
//    
//    public func removeCellConfigurator(at index: Int) {
//        let count = items.count;
////        items.remove(at: index)
//    }
//    
//    public func removeAll() {
//        return items.removeAll()
//    }
//}
