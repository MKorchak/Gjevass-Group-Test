//
//  MainViewController.swift
//  test
//
//  Created by Misha Korchak on 02.10.16.
//  Copyright © 2016 Misha Korchak. All rights reserved.
//

import UIKit
import CoreData
var k = 0
var y: CGFloat = 0
var x: CGFloat = 0

class MainViewController: UIViewController {
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var ScrollView2: UIScrollView!
    @IBAction func Button1(_ sender: UIButton) {
        k = 0
        y = ScrollView.contentOffset.y
        x = ScrollView2.contentOffset.x
    }
    @IBAction func Button2(_ sender: UIButton) {
        k = 1
        y = ScrollView.contentOffset.y
        x = ScrollView2.contentOffset.x
    }
    @IBOutlet weak var light: UIImageView!
    @IBOutlet weak var stick: UIImageView!
    @IBOutlet weak var stick2: UIImageView!
    
    
    
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        lightning()
        
        
        
    
        
        light.alpha = 0
        
        sticking()
        
        stick2.transform = CGAffineTransform(rotationAngle: 0.047)
        
        let poster1: UIImage = UIImage(named: "Tmp-album-1.jpg")!
        let poster1Data: NSData = UIImageJPEGRepresentation(poster1, 1)! as NSData
        let poster2: UIImage = UIImage(named: "Tmp-album-2.jpg")!
        let poster2Data: NSData = UIImageJPEGRepresentation(poster2, 1)! as NSData
        deleteData()
        storeTranscription(sImage: poster1Data)
        storeTranscription(sImage: poster2Data)
        getTranscriptions()
        
        ScrollView.contentSize.height = 3132
        ScrollView2.contentSize.width = 645
        ScrollView.contentOffset.y = y
        ScrollView2.contentOffset.x = x
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func lightning() {
        
        UIView.animate(withDuration: 1, animations: {
            
            self.light.alpha = 1
            
            }, completion: { (Completed: Bool) -> Void in
                
                UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                    
                    self.light.alpha = 0
                    
                    }, completion: { (Completed: Bool) -> Void in
                        
                        self.lightning()
                        
                })
                
        })
        
    }
    
    func sticking() {
        
        UIView.animate(withDuration: 1, animations: {
            
            self.stick2.transform = CGAffineTransform(rotationAngle: -0.047)
            
            }, completion: { (Completed: Bool) -> Void in
                
                UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                    
                    self.stick2.transform = CGAffineTransform(rotationAngle: 0.047)
                    
                    }, completion: { (Completed: Bool) -> Void in
                        
                        self.sticking()
                        
                })
                
        })
        
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getTranscriptions () {
        //create a fetch request, telling it about the entity
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        var x = 25
        let y = 2775
        var rotation = 0.02
        
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            //print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                let frame = CGRect(
                    x: x,
                    y: y,
                    width: 102,
                    height: 139)
                let imageView = UIImageView(frame: frame)
                imageView.image = UIImage(data: (trans.value(forKey: "sImage")) as! Data)
                imageView.transform = CGAffineTransform(rotationAngle: CGFloat(rotation))
                ScrollView.addSubview(imageView)
                rotation += 0.027
                x += 136
                
            }
        } catch {
            print("Error with request: \(error)")
        }
    }
    
    func storeTranscription (sImage: NSData) {
        let context = getContext()
        let poster1: UIImage = UIImage(named: "Tmp-poster-1.jpg")!
        let poster1Data: NSData = UIImageJPEGRepresentation(poster1, 1)! as NSData
        
        //retrieve the entity that we just created
        //let entity =  NSEntityDescription.entity(forEntityName: "Store", in: context)
        
        let transc = Store(context: context)
        transc.sImage = poster1Data
        
        //set the entity values
        transc.setValue(sImage, forKey: "sImage")
        
        //save the object
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        } catch {
            
        }
    }
    
    func deleteData() {
        let context = getContext()
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        do {
            //go get the results
            let searchResults = try getContext().fetch(fetchRequest)
            
            //I like to check the size of the returned results!
            //print ("num of results = \(searchResults.count)")
            
            //You need to convert to NSManagedObject to use 'for' loops
            for trans in searchResults as [NSManagedObject] {
                //get the Key Value pairs (although there may be a better way to do that...
                let managedObjectData:NSManagedObject = trans
                context.delete(managedObjectData)
            }
        } catch {
            print("Error with request: \(error)")
        }
        
    }

   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
