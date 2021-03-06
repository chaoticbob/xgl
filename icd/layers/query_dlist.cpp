/*
 ***********************************************************************************************************************
 *
 *  Copyright (c) 2014-2018 Advanced Micro Devices, Inc. All Rights Reserved.
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 *
 **********************************************************************************************************************/
/**
************************************************************************************************************************
* @file  query_dlist.cpp
* @brief Helper functions for querying Dlist get AMD Radeon Settings configurations for switchable graphics.
************************************************************************************************************************
*/

#include "include/vk_alloccb.h"
#include "include/query_dlist.h"

namespace vk
{

// =====================================================================================================================
// Query primary device verdor ID and device ID
void QueryPrimaryDeviceInfo(unsigned int* pVendorId, unsigned int* pDeviceId)
{
}

// =====================================================================================================================
// Use GDI APIs to enumerate all the adapters, query AMD adapter whether it is in a hybrid graphics platform, then call
// Dlist interface to query AMD Radeon Settings configuration
void QueryDlistForApplication(
    bool* pIsHybridGraphics,
    bool* pRunOnDiscreteGpu)
{
}

} // namespace vk
