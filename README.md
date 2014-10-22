photoFilters
==========

##CoreImage
参考链接：http://www.cocoachina.com/swift/20140903/9514.html

继承UIImagePickerControllerDelegate,UINavigationControllerDelegate
###打开相册
@IBAction func loadPhoto(sender: AnyObject) {
        
        let pickerC = UIImagePickerController()
        
        pickerC.delegate = self
        
        self.presentViewController(pickerC, animated: true, completion: nil)
}
###选择图片
//重写方法
func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: NSDictionary!) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
       
        let gotImage = info[UIImagePickerControllerOriginalImage] as UIImage
        photoImageView.image = gotImage
}

###保存相册
 @IBAction func savePhoto(sender: AnyObject) {
        
        let library = ALAssetsLibrary()
        library.writeImageToSavedPhotosAlbum(renderedImage
            ,metadata: inputImage.properties()
            , completionBlock: nil)
}
###图像过滤

###关键类
ALAssetsLibrary 保存图片至相册
UIImagePickerController 打开相册选择图片
CIFilter 图片过滤
