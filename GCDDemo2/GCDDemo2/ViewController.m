//
//  ViewController.swift
//  demo
//
//  Created by man on 2018/10/31.
//  Copyright © 2018年 man. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self asyncConcurrent];
//    [self asyncSerial];
//    [self syncConcurrent];
//    [self syncConcurrentOnBackgroundThread];
//    [self syncSerial];
//    [self syncSerialOnBackgroundThread];
//    [self asyncMainQueue];
//    [self syncMainQueue];
    [self syncOnBackgroundThread];
}

    /****************** -------- 异步执行 + 并发队列 -------- ******************/
- (void)asyncConcurrent {
    
     /* 1. 创建一个并发队列 */
    dispatch_queue_t concurrentQueue = dispatch_queue_create("download.man.com", DISPATCH_QUEUE_CONCURRENT);
    
     /* 2. 将任务放到队列中, 下面的代码将三个任务放到队列中 */
    dispatch_async(concurrentQueue, ^{
        NSLog(@"download1-------%@",[NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"download2-------%@",[NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"download3-------%@",[NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"download4-------%@",[NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"download5-------%@",[NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"download6-------%@",[NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"download7-------%@",[NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"download8-------%@",[NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"download9-------%@",[NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"download10-------%@",[NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"download11-------%@",[NSThread currentThread]);
    });
    dispatch_async(concurrentQueue, ^{
        NSLog(@"download12-------%@",[NSThread currentThread]);
    });
}

    /****************** -------- 异步执行 + 串行队列 -------- ******************/
- (void)asyncSerial {
    
     /* 1. 创建一个串行队列 */
    dispatch_queue_t serialQueue = dispatch_queue_create("download.man.com", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_t serialQueue2 = dispatch_queue_create("download.man1.com", DISPATCH_QUEUE_SERIAL);
    
    
     /* 2. 将不同的任务添加到队列中 */
    dispatch_async(serialQueue, ^{
        NSLog(@"download1--------%@",[NSThread currentThread]);
    });
    
    dispatch_async(serialQueue2, ^{
        NSLog(@"download2--------%@",[NSThread currentThread]);
    });
    
    dispatch_async(serialQueue, ^{
        NSLog(@"download3--------%@",[NSThread currentThread]);
    });
}

    /****************** -------- 同步执行 + 并发队列 -------- ******************/
- (void)syncConcurrent {
    
     /* 1. 创建一条并发队列 */
    dispatch_queue_t concurrentQueue = dispatch_queue_create("download.man.com", DISPATCH_QUEUE_CONCURRENT);
    
     /* 2. 把任务放到队列中 */
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"download1--------%@",[NSThread currentThread]);
    });
    
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"download2--------%@",[NSThread currentThread]);
    });
    
    dispatch_sync(concurrentQueue, ^{
        NSLog(@"download3--------%@",[NSThread currentThread]);
    });
    
}

- (void)syncConcurrentOnBackgroundThread {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self syncConcurrent];
    });
}

    /****************** -------- 同步操作 + 串行队列 -------- ******************/
- (void)syncSerial {
     /* 1. 创建串行队列 */
    dispatch_queue_t serialQueue = dispatch_queue_create("download.man.com", DISPATCH_QUEUE_SERIAL);
    
     /* 2. 将任务放到队列中 */
    dispatch_sync(serialQueue, ^{
        NSLog(@"download1--------%@",[NSThread currentThread]);
    });
    
    dispatch_sync(serialQueue, ^{
        NSLog(@"download2--------%@",[NSThread currentThread]);
    });
    
    dispatch_sync(serialQueue, ^{
        NSLog(@"download3--------%@",[NSThread currentThread]);
    });
}

- (void)syncSerialOnBackgroundThread {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self syncSerial];
    });
}

    /****************** -------- 异步执行 + 主队列 -------- ******************/
- (void)asyncMainQueue {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"download1------%@",[NSThread currentThread]);
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"download2------%@",[NSThread currentThread]);
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"download3------%@",[NSThread currentThread]);
    });
    
}

    /****************** -------- 同步执行 + 主队列 -------- ******************/
- (void)syncMainQueue {
    
    NSLog(@"------start-------");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"download1-------%@",[NSThread currentThread]);
    });
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"download1-------%@",[NSThread currentThread]);
    });
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"download1-------%@",[NSThread currentThread]);
    });
    
    NSLog(@"-------end---------");
    
}

- (void)syncOnBackgroundThread {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self syncMainQueue];
    });
}

- (void)test1 {
    // dispatch_async_f(dispatch_get_global_queue(0, 0), nil, task);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"downloadTask1--------%@",[NSThread currentThread]);
        });
        
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"downloadTask2--------%@",[NSThread currentThread]);
        });
        
        dispatch_sync(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"downloadTask3--------%@",[NSThread currentThread]);
        });
    });
}

void task (void *param) {
    NSLog(@"downloadTask-------%@",[NSThread currentThread]);
}

@end
