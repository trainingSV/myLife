/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A 'Table View Controller' subclass that loads some sample people and displays the name and image for every person. This class is also responsible for passing data to the 'PersonViewController' for editing or creating a new person.
     
    Customizations: If you want to modify the initial people displayed in the app or enable deleting a person while the app is running, you will need to edit this file. To learn more you can check out the the README file included in the app.
*/

import UIKit

class PeopleTableViewController: UITableViewController {
    // MARK: Properties

    // Setup the initial array of people.
    var people = [Person]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleData()        
        title = "My Life"
    }


    /// Load in and some initial sample data and update the table view's display.
    func loadSampleData() {
        /*
            You can modify the names and images here to populate this with your
            own friends and family. In the README file there are instructions for
            how to add in your own images.
        */
        let person1 = Person(name: "Byte",
                        image: UIImage(named: "Sample1"),
                dogPreference: 9.0)
        let person2 = Person(name: "Blu",
                        image: UIImage(named: "Sample2"),
                dogPreference: 6.0)
        let person3 = Person(name: "Hopper",
                        image: UIImage(named: "Sample3"),
                dogPreference: 2.0)

        people = [person1, person2, person3]
        tableView.reloadData()
    }
    
    
    // MARK: Table View
    
    /**
        The table view calls this method to find out how many rows it should
        show in any one section.
    */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // We only have a single section and want one row per person.
        return people.count
    }
    
    
    /// The table view calls this method to set up each cell in the table for display.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          // Ask the table view to create a cell for us to use to show a person.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Get the person we are displaying for this row.
        let person = people[indexPath.row]
        
        // Set the text and image in the cell.
        cell.textLabel!.text = person.name
        cell.imageView!.image = person.image
        
        // Now the cell has been setup, return it to the table view.
        return cell
    }
    
    
    // MARK: Navigation
    
    /**
        This method is called whenever the user segues, or transitions, to a new 
        view controller. In this application, this happens when the user taps the 
        "Add" button or taps a table view cell to view a person's details.
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPersonSegue" {
            print("Adding new person.")
        }
        else if segue.identifier == "ShowPersonSegue" {
            let destinationController = segue.destination as! PersonViewController
            let selectedTableCell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: selectedTableCell)
            let person = people[indexPath!.row]
            destinationController.person = person
        }
    }

    /**
        This method is called when this view controller will reappear after the 
        "Done" button was tapped on the PersonViewController.
    */
    @IBAction func unwindToPersonList(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? PersonViewController, let person = sourceViewController.person {
            /*
                If an index path was selected in the table then it was editing an
                existing person. Otherwise the user had tapped the add button.
            */
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                /*
                    Update an existing person before reloading the table row to
                    ensure the updated person is displayed in the table.
                */
                people[selectedIndexPath.row] = person
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                /*
                    Add a new person to the people array before animating in a 
                    new table row with the person's data.
                */
                let newIndexPath = IndexPath(row: people.count, section: 0)
                people.append(person)
                tableView.insertRows(at: [newIndexPath], with: .bottom)
            }
        }
    }
}

