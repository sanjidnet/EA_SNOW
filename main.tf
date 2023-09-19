terraform {
  required_providers {
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "~> 0.70.1"
    }
  }

  backend "remote" {
    organization = "EastHealth"

    workspaces {
      name = "gh-actions"
    }
  }
}

resource "snowflake_database" "prod_db" {
  name = var.prod_db_name
}

resource "snowflake_database" "test_db" {
  name = var.test_db_name
}

resource "snowflake_database" "dev_db_jc" {
  name = var.dev_db_jc_name
}

resource "snowflake_database" "dev_db_jj" {
  name = var.dev_db_jj_name
}

resource "snowflake_database" "dev_db_mg" {
  name = var.dev_db_mg_name
}

resource "snowflake_warehouse" "warehouse" {
  name           = "east_health_small_engine"
  warehouse_size = "small"
  auto_suspend   = 60
}


