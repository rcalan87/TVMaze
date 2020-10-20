//
//  ScheduleTableViewController.swift
//  TVMaze
//
//  Created by Alan Rodriguez on 10/10/20.
//

import UIKit

class ScheduleTableViewController: UITableViewController {
    private var shows: [Show] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    // MARK: - Helpers
    private func fetchData() {
        getSchedule { data in
            self.shows = data
            self.tableView.reloadData()
        } errorHandler: { error in
            print("error")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath) as! ShowTableViewCell
        cell.configure(for: shows[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.show = shows[indexPath.row]
        
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
