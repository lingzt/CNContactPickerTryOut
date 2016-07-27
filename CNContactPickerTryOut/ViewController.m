//
//  ViewController.m
//  CNContactPickerTryOut
//
//  Created by ling toby on 7/27/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray<CNContact*> *contactList;
@property (strong, nonatomic) CNContactPickerViewController *contactPicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//
///*!
// * @abstract Invoked when the picker is closed.
// * @discussion The picker will be dismissed automatically after a contact or property is picked.
// */
//- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker;
//
///*!
// * @abstract Singular delegate methods.
// * @discussion These delegate methods will be invoked when the user selects a single contact or property.
// */
//
//- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty;
//
///*!
// * @abstract Plural delegate methods.
// * @discussion These delegate methods will be invoked when the user is done selecting multiple contacts or properties.
// * Implementing one of these methods will configure the picker for multi-selection.
// */
//- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContacts:(NSArray<CNContact*> *)contacts;
//- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperties:(NSArray<CNContactProperty*> *)contactProperties;
//

- (IBAction)addContact:(id)sender {
    _contactPicker = [[CNContactPickerViewController alloc] init];
    _contactPicker.delegate = self;
    [self presentViewController:_contactPicker animated:YES completion:nil];
}



//Listen for delegates
- (void) contactPickerDidCancel: (CNContactPickerViewController *) picker
{
    NSLog(@"didCancel");
}

-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContacts:(NSArray<CNContact *> *)contacts{
    NSMutableArray *tempContacts = [contacts mutableCopy];
    [self.contactList arrayByAddingObjectsFromArray:tempContacts];
    NSLog(@"To get give name_______________________%@",[[tempContacts objectAtIndex:0] givenName]);
    NSLog(@"To get phone muber_______________________%@",[[[[[tempContacts objectAtIndex:0] phoneNumbers] objectAtIndex:0] valueForKey:@"value"] valueForKey:@"digits"]);
    NSLog(@"%@",contacts.description);
    

}
//-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact{
//    [self.contactList addObjectsFromArray:contact];
//    NSLog(@"didSelectContact");
//}




- (void)      contactPicker: (CNContactPickerViewController *) picker
   didSelectContactProperty: (CNContactProperty *)             contactProperty
{
    NSLog(@"didSelectProperty");
}

@end
