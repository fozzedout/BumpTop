/*
 *  Copyright 2012 Google Inc. All Rights Reserved.
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

#ifndef BUMPTOP_ARRAYONSTACK_H_
#define BUMPTOP_ARRAYONSTACK_H_

// gcc apparently lets you just do: BumpBox* boxes[num_boxes];
// this way is compatible with gcc and Visual Studio
// (http://the-lazy-programmer.com/blog/?p=24)

#define ARRAY_ON_STACK(type, length) static_cast<type*>(alloca(length * sizeof(type)));

#endif  // BUMPTOP_ARRAYONSTACK_H_

