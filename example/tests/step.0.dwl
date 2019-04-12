// Functional test for http://apimon.cloudhub.io

import * from bat::BDD
import * from bat::Assertions
---
describe `api-mon` in [

  // First, get a list of users
  GET `http://apimon.cloudhub.io/users` with {

  } assert [
    $.response.status mustEqual 200
  ]

]
