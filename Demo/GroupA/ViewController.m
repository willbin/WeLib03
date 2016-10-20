//
//  ViewController.m
//  GroupB
//
//  Created by Will Wei on 18/10/2016.
//  Copyright © 2016 Wecomic. All rights reserved.
//

#import "ViewController.h"

#define GlipBundleIdentifier        @"com.glip.mobile"
#define RCMobileBundleIdentifier    @"com.ringcentral.RingCentralMobile"

#define AppGroupIdentifierStr       @"group.wecomic.sharedata"

#define AppGroupGlipShareInfoPlist      @"dataFromGlip.json"
#define AppGroupRCShareInfoPlist        @"dataFromRC.json"




/*
 1 access with Bundle ID;
 2 singleton
 
 */

@interface ViewController ()
{
    NSDictionary    *_srcDict;
    NSDictionary    *_dataFromGlipDict;
    NSDictionary    *_dataFromRCDict;
    
    NSURL           *_shareInfoPlistURL;
}

@property (weak, nonatomic) IBOutlet UITextView *displayTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataFromGlipDict = @{
                          @"mailbox" : @{@"id" : @"123456789",
                                         @"unreadBadge" : [NSNumber numberWithInt:32]},
                          @"currentId" : @"987654321"
                          };
    _dataFromRCDict = @{
                          @"mailbox" : @{@"id" : @"123456789",
                                         @"unreadBadge" : [NSNumber numberWithInt:32],
                                         @"authCode" : @"abc123!@#",
                                         @"phoneNum" : @"13800001111",
                                         @"email" : @"abc@ringcentral.com"
                                         },
                          @"currentId" : @"987654321"
                          };
    
    NSURL *containerURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:AppGroupIdentifierStr];
    NSLog(@"%@", containerURL);
    _shareInfoPlistURL = [containerURL URLByAppendingPathComponent:AppGroupGlipShareInfoPlist];
    
    [self createPlistIfNotExist];
}

// in this way , you can do it
- (void)readInfoWithBundleID:(NSString *)bundleIDStr
{
    if ([bundleIDStr isEqualToString:@"dddd"])
    {
        
    }
    else
    {
        
    }
}

- (void)createPlistIfNotExist
{
    NSDictionary *shareInfoDict = [NSDictionary dictionaryWithContentsOfURL:_shareInfoPlistURL];
    if (!shareInfoDict)
    {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:_dataFromRCDict
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:nil];
        if (jsonData)
        {
            NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            BOOL isSuccess = [jsonStr writeToURL:_shareInfoPlistURL atomically:YES encoding:NSUTF8StringEncoding error:nil];
            NSLog(@"%d", isSuccess);
        }
        
        self.displayTextView.text = @"just create the plist";
    }
}

- (IBAction)readBtnClicked:(id)sender
{
    NSString *jsonStr = [NSString stringWithContentsOfURL:_shareInfoPlistURL
                                                 encoding:NSUTF8StringEncoding
                                                    error:nil];
    self.displayTextView.text = jsonStr.description;
}

- (IBAction)changeBtnClicked:(id)sender
{
    NSDictionary *shareInfoDict = [NSDictionary dictionaryWithContentsOfURL:_shareInfoPlistURL];
    if (shareInfoDict)
    {
//        BOOL isGoodDay = [shareInfoDict[AppGroupKeyIsGoodDay] boolValue];
//        NSInteger goodDays = [shareInfoDict[AppGroupKeyGoodDays] integerValue];
//        
//        NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:shareInfoDict];
//        [mDict setObject:[NSString stringWithFormat:@"%d", !isGoodDay] forKey:AppGroupKeyIsGoodDay];
//        [mDict setObject:[NSString stringWithFormat:@"%ld", (long)(goodDays+1)] forKey:AppGroupKeyGoodDays];
//        
//        BOOL isSuccess = [mDict writeToURL:_shareInfoPlistURL atomically:YES];
//        NSLog(@"changed:%d", isSuccess);
    }
    
    [self readBtnClicked:nil];
}



@end
