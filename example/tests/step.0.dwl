// Functional test for http://apimon.cloudhub.io

import * from bat::BDD
import * from bat::Assertions
---
describe `api-mon` in [

  // First, get a list of users
  GET `$(config.base_url)/users` with {

  } assert [
    $.response.status mustEqual 200
  ]

]
