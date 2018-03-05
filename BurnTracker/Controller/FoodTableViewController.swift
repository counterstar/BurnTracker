//
//  FoodTableViewController.swift
//  BurnTracker
//
//  Created by Vyacheslav Bratukhin on 16.02.2018.
//  Copyright © 2018 Vyacheslav Bratukhin. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController, FoodEditDelegate {
    // модель контроллера
    var foods = [Food]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.dataSource = self
//        self.tableView.delegate = self
        
        let foodItem0 = Food(name: "Куриная грудка", servingSize: (200, Food.ServingAmount.grams), servingDescription: (1, "грудка"), proteins: 20, carbohydrates: 1, fats: 12, calories: 200)
        let foodItem1 = foodItem0
        let foodItem2 = foodItem0
        
        foods.append(foodItem0)
        foods.append(foodItem1)
        foods.append(foodItem2)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // TODO: - позже настроить динамическое количество секторов
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if numberOfSections(in: self.tableView) != 1 {
            fatalError() // TODO: - убрать после настройки количества секторов
        }
        return foods.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IDFoodCell", for: indexPath)

        let foodItem = foods[indexPath.row]
            
        cell.textLabel?.text = foodItem.name
        cell.detailTextLabel?.text = String(foodItem.servingDescription.number) + " " + foodItem.servingDescription.description

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show food" {
            if let cell = sender as? UITableViewCell {
                if let dvc = (segue.destination as! UINavigationController).viewControllers.first as? FoodEditTableViewController {
                    print("preparing segue")
                    let food = foods[tableView.indexPath(for: cell)!.row]
                    dvc.food = food
                }
                
            }
        }
        
    }
    //MARK: - protocols
    func handleFood(_ item: Food) {
        foods.append(item)
    }

}
