//
//  ViewController.m
//  SortAlgorithm
//
//  Created by guohq on 2019/10/22.
//  Copyright © 2019 guohq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)    NSMutableArray           *dataArray;



@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

//    NSMutableArray *arr   = [NSMutableArray arrayWithObjects:@"2",@"7",@"9",@"15",@"20",@"50", nil];
//    NSMutableArray *arr1  = [NSMutableArray arrayWithObjects:@"1",@"5",@"13",@"21",@"51", nil];
//    NSMutableArray *arr2  = [self sortArr:arr arr1:arr1];
//    NSLog(@"%@",arr2);
    
    
//    NSMutableArray *arr1 = [arr copy];
//    for (NSString *str in arr1) {
//        [arr removeObject:str];
//    }
    
//    _dataArray = @[@1,@22,@9,@89,@67,@34,@87,@56].mutableCopy;
//    _dataArray = @[@8,@7,@9,@5].mutableCopy;
//    _dataArray = @[@9,@8,@7,@5].mutableCopy;


//    [self bubblingSort:_dataArray];
//    [self seleteNumSort:_dataArray];
//    [self quickSequence:_dataArray andleft:0 andright:3];
//
//    NSLog(@"%@",_dataArray);
//
//    [self method1];


//    [self gcdDemo];
//
//    NSLog(@"3");
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"1");
//        [self performSelector:@selector(pringtlog) withObject:nil afterDelay:2];
//        NSLog(@"3");
//    });
//    nodejiaocha();

}

- (void)gcdDemo{
    // 同步队列
    dispatch_queue_t queue = dispatch_queue_create("cooci", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1");
    // 异步函数
    dispatch_sync(queue, ^{
        NSLog(@"2");
        // 同步
        dispatch_sync(queue, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
        // 这个地方没有代码一样会产生死锁
        
    });
    NSLog(@"5");
    
//    dispatch_queue_t queue1 = dispatch_queue_create("com.dd", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"3");
//    dispatch_async(queue1, ^{
//        NSLog(@"4");
//        dispatch_sync(queue1, ^{
//            NSLog(@"5");
//        });
//        NSLog(@"6");
//    });
//    NSLog(@"7");
    

    
//    dispatch_queue_t queue = dispatch_queue_create("com.dd", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_sync(queue, ^{
//        NSLog(@"1");
//        NSLog(@"%@",[NSThread currentThread]);
//        dispatch_sync(queue, ^{
//            NSLog(@"2");
//            NSLog(@"%@",[NSThread currentThread]);
//        });
//        NSLog(@"3");
//    });
//

//
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"8");
//    });
//    NSLog(@"9");

}


- (void)pringtlog{
    NSLog(@"2");
}

#pragma mark -- 冒泡 On
- (void)bubblingSort:(NSMutableArray *)array{
    
    for (NSInteger i = 0; i < array.count; i ++) {
        BOOL exchange = NO;
        for (NSInteger j = 0; j < array.count - i - 1; j++) {
            if ([array[j] integerValue] > [array[j + 1] integerValue]) {
                NSInteger num = [array[j] integerValue];
                array[j]      = array[j+1];
                array[j+1]      = @(num);
                exchange      = YES;
            }
        }
        if (!exchange) {
            break;
        }
    }
    
}

#pragma mark -- 选择 On
- (void)seleteNumSort:(NSMutableArray *)array{
    
    for (NSInteger i = 0; i < array.count; i ++) {
        for (NSInteger j = i+1 ; j < array.count; j++) {
           if ([array[i] integerValue] > [array[j] integerValue]) {
               NSInteger tempFloat = [array[i] integerValue];
               array[i] = array[j];
               array[j] = [NSNumber numberWithFloat:tempFloat];
           }
        }
    }
}

#pragma mark -- 插入 On
- (void)insertNumSort:(NSMutableArray *)array{
    
    for (NSInteger i = 0; i < array.count; i ++) {
        NSInteger tmp = [array[i] integerValue];
        for (NSInteger j = i - 1; j >= 0 && tmp < [array[j] integerValue]; j--) {
            array[j + 1] = array[j];
            array[j]     = @(tmp);
        }
        
    }
}

-(void)quickSequence:(NSMutableArray *)arr andleft:(int)left andright:(int)right
{
    if (left >= right) {//如果数组长度为0或1时返回
        return ;
    }
    int key = [arr[left] intValue];
    int i = left;
    int j = right;
    
    while (i<j){
        while (i<j&&[arr[j] intValue]>=key) {
            j--;
        }
        arr[i] = arr[j];
        
        while (i<j&&[arr[i] intValue]<=key) {
            i++;
        }
        arr[j] = arr[i];
    }
    arr[i] = [NSString stringWithFormat:@"%d",key];
    [self quickSequence:arr andleft:left andright:i-1];
    [self quickSequence:arr andleft:i+1 andright:right];
}

- (void)sortArray:(NSMutableArray *)array right:(int)right left:(int)left{
    if (left >= right) {
        return;
    }
    
    int key = [array[left] intValue];
    int i   = left;
    int j   = right;
    
    while (i < j) {
        while (i<j && [array[j] intValue] > key) {
            j--;
        }
        array[i] = array[j];
        
        while (i<j && [array[i] intValue] < key) {
            i++;
        }
        array[j] = array[i];
    }
    array[i] = @(key);
    [self sortArray:array right:left left:i-1];
    [self sortArray:array right:i+1 left:right];

}

//- (void)insertSort:(NSMutableArray *)mutableArray {
//if(mutableArray == nil || mutableArray.count == 0)
//    return;
//NSLog(@"直接插入排序之前: %@", mutableArray);
//for (NSInteger i = 0; i < mutableArray.count; i++) {
//    CGFloat tempFloat = [mutableArray[i] floatValue];
//    for (NSInteger j = i - 1; j >= 0 && tempFloat < [mutableArray[j] floatValue]; j--) {
//        mutableArray[j + 1] = mutableArray[j];
//        mutableArray[j] = [NSNumber numberWithFloat:tempFloat];
//    }
//}
//NSLog(@"直接插入排序之后: %@", mutableArray);
//}


- (void)method1{
    NSLog(@"===");
}

- (void)method2{
    NSLog(@"===5555");
}

- (void)demo14{
    
      dispatch_queue_t queue = dispatch_queue_create("com.guohq", DISPATCH_QUEUE_SERIAL);
     dispatch_queue_t serialQueue = dispatch_queue_create("com.guohq1", DISPATCH_QUEUE_CONCURRENT);
     dispatch_async(queue, ^{
         NSLog(@"============serialQueue==============");
         for (int i = 0; i< 5; i++) {
             dispatch_sync(serialQueue, ^{
                 NSLog(@"serialQueue === %d +++ %@",i,[NSThread currentThread]);
             });
         }
         NSLog(@"当前线程%@",[NSThread currentThread]);
         NSLog(@"============concurrentQueue==============");
         for (int i = 0; i< 5; i++) {
             dispatch_sync(serialQueue, ^{
                 NSLog(@"concurrentQueue === %d +++ %@",i,[NSThread currentThread]);
             });
         }
     });
}



// 定义一个链表
struct Node{
    NSString *data;
    struct Node *next;
};
typedef struct Node HGNode;

struct NodeList{
    HGNode *node1;
    HGNode *node2;
};
typedef struct NodeList NodeListCreate;

// 创建一个节点
HGNode* createNode() {
    HGNode* node = (HGNode*)malloc(sizeof(HGNode));
    // 现在是一个空的节点
    return node;
}

//链表翻转
struct Node *reverseList(struct Node *head){
    struct Node *p  = head;
    struct Node *pr = NULL;
    struct Node *q  = NULL;
    
    while (p) {
        
        pr      = p->next;
        p->next = q;
        q       = p;
        p       = pr;
        
    }
    head->next  = q;
    return head;
};

// 创建链表
struct Node *constructNodeList(void){
  
    HGNode *head = NULL;
    HGNode *end  = NULL;
    for (int i = 0; i<6; i++) {
        HGNode *node = createNode();
        node->data = [NSString stringWithFormat:@"%d",i];
        if (i == 5) {
            node->next = NULL;
        }
        if (head==NULL) {
            head = node;
        }else{
            end->next = node;
        }
        end = node;
    }

    return head;
};

struct NodeList *constructNodeList1(void){
    HGNode *head1 = createNode();
    head1->data   = @"head";

    HGNode *head2 = createNode();
    head2->data   = @"9";
    
    HGNode *node2 = createNode();
    node2->data   = @"8";
    head2->next   = node2;

    HGNode *node3 = createNode();
    node3->data   = @"4";
    node2->next   = node3;
    head1->next   = node3;


    HGNode *node4 = createNode();
    node4->data   = @"5";
    node3->next   = node4;
    
    node4->next   = NULL;
    
//    HGNode* node = (HGNode*)malloc(sizeof(HGNode));
    struct NodeList *list1 = malloc(sizeof(struct NodeList));
    
    NodeListCreate *list = malloc(sizeof(NodeListCreate));
    list->node1    = head1;
    list->node2    = head2;

    return list;
};

// 创建环状链表
struct Node *constructNodeListRing(void){
  
    HGNode *head  = NULL;
    HGNode *end   = NULL;
    HGNode *temp  = NULL;

    for (int i = 0; i<5; i++) {
        HGNode *node = createNode();
        node->data = [NSString stringWithFormat:@"%d",i];
        if (head==NULL) {
            head = node;
        }else{
            end->next = node;
        }
        if (i == 1) {
            temp = node;
        }
        end = node;
        if (i == 4) {
            end->next = temp;
        }
    }

    return head;
};


void judgeNodeHaveRing(){
    HGNode *head = constructNodeListRing();
    HGNode *fastNode  = head;
    HGNode *slowNode  = head;
    int count   = 0;
    while (fastNode != NULL) {
        if (fastNode->next) {
            fastNode = fastNode->next->next;
        }else{
            fastNode = NULL;
        }
        slowNode = slowNode->next;
        count ++;
        if (fastNode == slowNode) {
            printf("\n==== %d",count);
            break;
        }
    }
    
}

void getEntranceOfCycle(){
    HGNode *head = constructNodeListRing();
    HGNode *fastNode  = head;
    HGNode *slowNode  = head;
    while (fastNode) {
        if (fastNode->next) {
            fastNode = fastNode->next->next;
        }else{
            fastNode = NULL;
        }
        slowNode = slowNode->next;
        if (slowNode == fastNode) {
            fastNode = head;
            while (fastNode != slowNode) {
                fastNode = fastNode->next;
                slowNode = slowNode->next;
            }
            while (slowNode) {
                NSLog(@"%@",slowNode->next->data);
            }
        }
    }
}

void nodejiaocha(){
    
    NodeListCreate *nodeList = constructNodeList1();
    struct Node *node1 = nodeList->node1;
    struct Node *node2 = nodeList->node2;
    
    int lenght1   = getListLength(node1);
    int lenght2   = getListLength(node2);
    
    if (lenght1 > lenght2) {
        node1     = relocateNode(node1, lenght1 - lenght2);
    }else{
        node2     = relocateNode(node2, lenght2 - lenght1);
    }
    
    while (node1 != node2) {
        node1 = node1->next;
        node2 = node2->next;
    }
    
    if (node1) {
        NSLog(@"%@",node1->data);
        NSLog(@"%@",node2->data);
    }

}

int getListLength(HGNode *node){
    int lenght = 1;
    while (node->next) {
        lenght++;
        node = node->next;
    }
    return lenght;
}

HGNode* relocateNode(HGNode *list, int offset) {
    HGNode *node1 = list;
    for (NSInteger i = 0; i < offset; i++) {
        node1 = node1->next;
    }
    return node1;
}

void  uuu222u(){
    HGNode *node = constructNodeList();
    reverseList(node);
    printf("%s",node);
};

// 查找两个视图的共同父视图
- (NSArray<UIView*>*)findCommonSuperView:(UIView *)viewOne other:(UIView *)viewOhter{
    NSMutableArray *result = [NSMutableArray array];
    NSArray *arrayOne    = [self findSuperViews:viewOne];
    NSArray *arrayOther  = [self findSuperViews:viewOhter];
    int i = 0;
    while (i < MIN((int)arrayOne.count, (int)arrayOther.count)) {
        UIView *superOne = [arrayOne objectAtIndex:arrayOne.count - i - 1];
        UIView *superTwo = [arrayOther objectAtIndex:arrayOther.count - i - 1];
        if (superOne == superTwo) {
            [result addObject:superOne];
            i++;
        }else{
            break;
        }
    }
    return result;
}

// 查找所有父视图
- (NSArray<UIView*>*)findSuperViews:(UIView *)view{
    // 初始化第一父视图
    UIView *temp = view.superview;
    // 保存结果的数组
    NSMutableArray *result = [NSMutableArray array];
    while (temp) {
        [result addObject:temp];
        // 顺着superview指针一直向上查找
        temp = temp.superview;
    }
    return  result;
}

- (NSMutableArray *)sortArr:(NSMutableArray *)arr arr1:(NSMutableArray *)arr1{
    NSInteger i   = 0;
    NSInteger j   = 0;
    NSInteger key = 0;
    NSMutableArray *result = [NSMutableArray array];
    while (i < arr.count && j < arr1.count) {
        if ([arr[i] integerValue]< [arr1[j] integerValue]) {
            result[key] = arr[i];
            i ++;
        }else{
            result[key] = arr1[j];
            j++;
        }
        key ++;
    }
    
    while (i < arr.count) {
        result[key] = arr[i];
        i ++;
    }
    
    while (j < arr1.count) {
        result[key] = arr1[j];
        j ++;
    }
    return result;
}

@end
