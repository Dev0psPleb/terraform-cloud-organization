terraform {
  cloud {
    organization = "${organization}"

    workspaces {
      name = "${workspace}"
    }
  }
}
