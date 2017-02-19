//
//  LinuxMain.swift
//  SwinjectAutoregistration
//
//  Created by Tomas Kohout on 01/29/17.
//  Copyright © 2017 Swinject Contributors. All rights reserved.
//

import XCTest
import Quick

@testable import SwinjectAutoregistrationTests

Quick.QCKMain([
    AutoregistrationSpec.self
//    WarningsSpec.self,
//    TypeParserSpec.self
])
