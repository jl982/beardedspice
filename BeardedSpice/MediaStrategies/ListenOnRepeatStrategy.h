//
//  ListenOnRepeatStrategy.h
//  BeardedSpice
//
//  Created by Jianneng Li on 2/7/16.
//  Copyright © 2016 BeardedSpice. All rights reserved.
//

#import "MediaStrategy.h"

@interface ListenOnRepeatStrategy : MediaStrategy
{
    NSPredicate *predicate;
}

@end
