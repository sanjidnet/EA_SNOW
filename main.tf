terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "0.70.1"
    }
  }

  backend "remote" {
    organization = "EastHealth"

    workspaces {
      name = "gh-actions"
    }
  }
}

resource "snowflake_database" "demo_db" {
  name    = "DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}
