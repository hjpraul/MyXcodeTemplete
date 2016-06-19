//
//  SinglePicPicker.m
//  SchoolPalmUser
//
//  Created by hjpraul on 15/4/20.
//  Copyright (c) 2015年 hjpraul. All rights reserved.
//

#import "SinglePicPicker.h"
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AssetsLibrary/ALAsset.h>
#import <AssetsLibrary/ALAssetRepresentation.h>

@interface SinglePicPicker ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (copy, nonatomic) void (^completedBlock)(NSData *imageData,NSString *imgName);
@property (assign, nonatomic) CGSize size;
@end

@implementation SinglePicPicker
- (void)presentFromVC:(UIViewController *)vc
           sourceType:(UIImagePickerControllerSourceType)type
                 size:(CGSize)size
            completed:(void(^)(NSData *imageData,NSString *imgName))completedBlock{
    self.completedBlock = completedBlock;
    self.size = size;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = type;
    [vc presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerController Delegate
-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    UIImage *image = [editedImage imageScaledToSize:_size aspectRatio:YES];
    if (image) {
        NSData *data = nil;
        NSString *name = nil;
        if (UIImagePNGRepresentation(image) == nil) {
            data = UIImageJPEGRepresentation(image, 1.0);
            name = @"image.jpg";
        } else {
            data = UIImagePNGRepresentation(image);
            name = @"image.png";
        }

        [picker dismissViewControllerAnimated:YES completion:nil];
        if (_completedBlock) {
            _completedBlock(data,name);
        }
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
