//
//  QuizViewController.h
//  Quiz
//
//  Created by Jonathan Arp on 7/22/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizViewController : UIViewController
{
    int currentQuestionIndex;
    NSArray *questions;
    NSArray *answers;
    
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;
}

-(IBAction)showQuesiton:(id)sender;
-(IBAction)showAnswer:(id)sender;

@end
