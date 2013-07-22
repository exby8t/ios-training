//
//  QuizViewController.m
//  Quiz
//
//  Created by Jonathan Arp on 7/22/13.
//  Copyright (c) 2013 ND. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil

{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        questions = @[@"What is cognac made of?", @"What is 7 + 7?", @"What is the air velocity of an unladened swallow?"];
        answers = @[@"Grapes", @"14", @"European or african?"];
    }
    
    NSLog(@"nib is %@", nibNameOrNil);
    
    return self;
    
}


-(IBAction)showQuesiton:(id)sender{
    
    currentQuestionIndex++;
    
    if(currentQuestionIndex == [questions  count]){
        currentQuestionIndex = 0;
    }
    
        [questionField setText : [questions objectAtIndex:currentQuestionIndex]];
        [answerField setText : @"?????"];
    }


-(IBAction)showAnswer:(id)sender{
    [answerField setText:[answers objectAtIndex:currentQuestionIndex]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
