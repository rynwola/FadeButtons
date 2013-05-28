//
//  ViewController.m
//  tester
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    //declare and define button specifics
    btnYellow = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnYellow setBackgroundColor: [UIColor yellowColor]];
    [btnYellow setFrame: CGRectMake(20, (20), 280, 30)];
    [btnYellow setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnYellow.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    btnRed = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnRed setBackgroundColor: [UIColor redColor]];
    [btnRed setFrame: CGRectMake(20, 60, 280, 30)];
    [btnRed setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnRed.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    btnBlue = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnBlue setFrame: CGRectMake(20, 100, 280, 30)];
    [btnBlue setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnBlue.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [btnBlue setBackgroundColor: [UIColor blueColor]];
    btnGreen = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnGreen setFrame: CGRectMake(20, 140, 280, 30)];
    [btnGreen setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnGreen.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [btnGreen setBackgroundColor: [UIColor greenColor]];
    
    //add buttons to the view
    [self.view addSubview:btnYellow];
    [self.view addSubview:btnRed];
    [self.view addSubview:btnBlue];
    [self.view addSubview:btnGreen];
    
    //set the counting ints to 0
    yellowCount = 0, redCount = 0, blueCount = 0, greenCount = 0;
    
    //run through the animations the first time
	[self beginAnimations];
}

-(void)beginAnimations
{
    if (!(yellowCount==5 && redCount==5 && blueCount == 5 && greenCount == 5))
    {
        //if you want 5 buttons, define another one, then the next line would be int rand=random()%6;
        int rand=((arc4random()%5)+1); //arc4random gives 0-3; add 1 for 1-4
        NSLog(@"rand: %i",rand);
        switch (rand) {
            case 1:
            {
                //make sure this button hasn't gone through the process 5 times already
                if (yellowCount<5)
                {
                    //increment the button's count
                    yellowCount++;
                    //set up animation with 1.5 second duration (alpha decline from 1->.5)
                    [UIView animateWithDuration:1.5 delay:0 options: UIViewAnimationOptionCurveEaseOut animations:^{
                        [btnYellow setAlpha:.5];
                    } completion:^(BOOL finished)
                    {
                        if(finished==TRUE)
                        {
                            [UIView animateWithDuration:1.5 delay:0 options: UIViewAnimationOptionCurveEaseOut animations:^{
                                [btnYellow setAlpha:1];
                            } completion:^(BOOL finished) {
                                if(finished==TRUE)
                                {
                                    [self beginAnimations];
                                }
                            }];
                        }
                    }];
                }
                else
                {
                    //restart the animation hoping to get another button that hasn't gone 5 times yet
                    [self beginAnimations];
                }
            }
                break; //you forgot a break here. can cause troubles
            case 2:
            {
                if (redCount<5)
                {
                    redCount++;
                    [UIView animateWithDuration:1.5 delay:0 options: UIViewAnimationOptionCurveEaseOut animations:^
                    {
                        [btnRed setAlpha:.5];
                    } completion:^(BOOL finished)
                    {
                        if(finished==TRUE)
                        {
                            [UIView animateWithDuration:1.5 delay:0 options: UIViewAnimationOptionCurveEaseOut animations:^{
                                [btnRed setAlpha:1];
                            } completion:^(BOOL finished) {
                                if(finished==TRUE)
                                {
                                    [self beginAnimations];
                                }
                            }];
                        }
                    }];
                }
                else
                {
                    [self beginAnimations];
                }
            }
                break;
            case 3:
            {
                if (blueCount<5)
                {
                    blueCount++;
                    [UIView animateWithDuration:1.5 delay:0 options: UIViewAnimationOptionCurveEaseOut animations:^
                    {
                        [btnBlue setAlpha:.5];
                    } completion:^(BOOL finished)
                    {
                        if(finished==TRUE)
                        {
                            [UIView animateWithDuration:1.5 delay:0 options: UIViewAnimationOptionCurveEaseOut animations:^{
                                [btnBlue setAlpha:1];
                            } completion:^(BOOL finished) {
                                if(finished==TRUE)
                                {
                                    [self beginAnimations];
                                }
                            }];
                        }
                    }];
                }
                else
                {
                    [self beginAnimations];
                }
            }
                break; //you forgot another break here. can cause troubles
                
            case 4:
            {
                if (greenCount<5)
                {
                    greenCount++;
                    [UIView animateWithDuration:1.5 delay:0 options: UIViewAnimationOptionCurveEaseOut animations:^
                    {
                        [btnGreen setAlpha:.5];
                    } completion:^(BOOL finished)
                    {
                        if(finished==TRUE)
                        {
                            [UIView animateWithDuration:1.5 delay:0 options: UIViewAnimationOptionCurveEaseOut animations:^{
                                [btnGreen setAlpha:1];
                            } completion:^(BOOL finished) {
                                if(finished==TRUE)
                                {
                                    [self beginAnimations];
                                }
                            }];
                        }
                    }];
                }
                else
                {
                    [self beginAnimations];
                }
            }
                break;
            default:
            {
                //in case of an awry number, restart the process (be wary; infinite loop potential)
                [self beginAnimations];
            }
                break; //it is of good practice to always have a default method in switch statements
        }
    }
    else
    {
        //the process is complete
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
