/*
 * %%FILENAME%% - description
 *
 * Copyright (C) %%YEAR%% %%AUTHOR%%
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

#include <iostream>
#include <Foundation/NSObject.h>
#include <objc/objc.h>

using namespace std;

@interface %%FILE%% : NSObject
{
}
- (id) init;
- (void) dealloc;
- (void) say: (const char *) msg;
@end

@implementation %%FILE%%
- (id) init
{
  return [super init];
}
- (void) dealloc
{
  [super dealloc];
}
- (void) say: (const char *) msg
{
  cout << msg << endl;
}
@end

int
main (int argc, char **argv)
{
  %%FILE%% *o = [[%%FILE%% alloc] init];
  [o say: "hello world"];
  [o release];
  return 0;
}

/**This must remain at the end of the file.**********
 * vim600:set sw=2 ts=8 fdm=marker fmr=«««,»»»:     *
 * vim600:set cindent cinoptions={1s,>2s,^-1s,n-1s: *
 ****************************************************/
