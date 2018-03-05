//
//  FoodEditTableViewController.swift
//  BurnTracker
//
//  Created by Vyacheslav Bratukhin on 20.02.2018.
//  Copyright © 2018 Vyacheslav Bratukhin. All rights reserved.
//

import UIKit

class FoodEditTableViewController: UITableViewController {

    var food: Food? //main model
    {
        didSet {
            updateCells()
        }
    }
    
    @IBOutlet var cells: [FoodEditTableViewCell]?
    
    @IBAction func cancel() {
        presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func save() {
        if let vc = getDelegate() {
            food = Food(name: "Новая еда", servingSize: (200, Food.ServingAmount.grams), servingDescription: (1, "порция"), proteins: 20, carbohydrates: 1, fats: 12, calories: 200) //тестовый объект еды. В будущем заменить на получение информации с полей таблицы
            vc.handleFood(food!)
            
            print("food item added")
            
            cancel() // корректно ли?
        } else {
            print("cannot add food item")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 44 //заткнуть warning о недостаточной информации для определения размера клетки (относится только к textField).
        //TODO: Придумать более изящное решение
        
        updateCells()

    }
    
    func updateCells() {
        let nameCell = cells?[0]
        nameCell?.leftTextField?.text = food?.name
        
        let servingSizeCell = cells?[1]
        servingSizeCell?.leftTextField?.text = food?.servingSize.0.description
        servingSizeCell?.rightTextField?.text = food?.servingSize.1.rawValue
        
    }
    
    func getDelegate() -> FoodEditDelegate? {
        return (presentingViewController as? UINavigationController)?.viewControllers.first as? FoodEditDelegate
    } // вспомогательный метод для текущей архитектуры VC. Берёт презентирующий нас VC (как UINavigationController), берёт из массива его VC первый объект (который должен быть FoodTableViewController), проверяет на протокол FoodEditDelegate и возвращает optional от объекта этого протокола. Метод используется в кнопке сохранения. В дальнейшем, когда появится корректная иерархия без NavigationController, этот метод можно будет упразднить.

}

protocol FoodEditDelegate {
    func handleFood (_ item: Food)
}
