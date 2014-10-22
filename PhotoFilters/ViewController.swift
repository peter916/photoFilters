//
//  ViewController.swift
//  PhotoFilters
//
//  Created by peter on 14-10-20.
//  Copyright (c) 2014 org.peter. All rights reserved.
//

import UIKit
import AssetsLibrary



class ViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
                            
    @IBOutlet var photoImageView: UIImageView
    
    let context = CIContext(options: nil)
    
    var renderedImage: CGImage!
    var inputImage: CIImage!
    
    var filter: CIFilter!
    
    
    
    
    @IBAction func applyFilter(sender: AnyObject) {
        
        //create an image to filter
        inputImage = CIImage(image:photoImageView.image)
        //create a random color pass to a filter
        let randomColor = [kCIInputAngleKey:(Double(arc4random_uniform(314))/100)]
        //apply a filter to an image
        let filteredImage = inputImage.imageByApplyingFilter("CIHueAdjust", withInputParameters: randomColor)
        //render the filtered image
        renderedImage = context.createCGImage(filteredImage, fromRect: filteredImage.extent())
        //reflect  the change back in the interface
        photoImageView.image = UIImage(CGImage:renderedImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        filter = CIFilter(name: "CISepiaTone")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func savePhoto(sender: AnyObject) {
        
        let library = ALAssetsLibrary()
        library.writeImageToSavedPhotosAlbum(renderedImage
            ,metadata: inputImage.properties()
            , completionBlock: nil)
        
    }
    
    @IBAction func loadPhoto(sender: AnyObject) {
        
        let pickerC = UIImagePickerController()
        
        pickerC.delegate = self
        
        self.presentViewController(pickerC, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: NSDictionary!) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        //println(info)
        let gotImage = info[UIImagePickerControllerOriginalImage] as UIImage
        photoImageView.image = gotImage
        
    }
    
    
}

