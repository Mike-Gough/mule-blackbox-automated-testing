// Functional test for http://apimon.cloudhub.io

import * from bat::BDD
import * from bat::Assertions
---
describe `api-mon` in [
  it `assert that there are 10 users` in [
    GET `http://apimon.cloudhub.io/users` with {} assert [
      $.response.status mustEqual 200, //< ---- ASSERTION
      $.response.mime mustEqual "application/json", //< ---- ASSERTION
      log($.response.body match{case list is Array -> sizeOf(list) mustEqual 10
        else -> false}) // < ---- ASSERTION
    ]
  ]
]
