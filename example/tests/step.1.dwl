// Functional test for http://apimon.cloudhub.io

import * from bat::BDD
import * from bat::Assertions
---
describe `api-mon` in [

  it `assert that there are 10 users` in [

    GET `$(config.base_url)/users` with {} assert [

      $.response.status mustEqual 200,

      $.response.mime mustEqual "application/json",

      log($.response.body match {
        case list is Array -> sizeOf(list) mustEqual 10
        else               -> false
      })
    ]
  ]
]
