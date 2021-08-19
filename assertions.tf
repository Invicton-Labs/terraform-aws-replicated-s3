// Ensure the AWS CLI is installed
module "command_exists_aws" {
  source                  = "Invicton-Labs/command-exists/external"
  version                 = "~> 0.1.3"
  command_unix            = "aws"
  fail_if_command_missing = true
}
