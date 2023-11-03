# Terraform: Azure DevHost

## Table of Contents
- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Description
This project (DevHost) uses Terraform as run by GitHub Actions.

Manually initiate the GitHub workflow to build; the TFStore (terraform state storage), virtual network, and the VM itself. 

## Installation

To utilize this DevHost project:

1. Setup your Repository on github with required variables and secrets. If you are using a Public repository, you can setup an environment for each VM.

    Variables:
    - LOCATION
    - CIDR_BLOCK
    - STATE_SUFFIX
    - ARM_TENANT_ID
    - ARM_SUBSCRIBER_ID
    - ARM_CLIENT_ID

    Secrets:
    - ARM_CLIENT_SECRET
    - ARM_ACCESS_KEY

    Notes:
    
    1. The ARM_ACCESS_KEY is used to access the TF State storage file. The TF State provides critical perisistence data to the Terraform deployment.
    1.  ARM_ACCESS_KEY is added to the GitHub "secrets" after the TFState component is deployed.
    1. Current workflow expects Environments by GitHub which forces the repository to be Public
    1. Fork this repository and setup your own Environments

## Usage

1. First run the TFState Apply component. You can test with Plan. After TF State is deployed, validate it in the Azure portal. Go to the new Azure Storage Account and get an Access Key to provide as secret ARM_ACCESS_KEY in GitHub.

1. Next deploy the Network component. The terraform state for the Network component will be saved in the Terraform State account. Go look at it. Validate.

1. Setup the Terraform for the new DevHost VM. 
- use your own IP addresses (for SSH access) and Public Keys (three required).
- edit the `azure/devhost/terraform.vars`
- modify the terraform as you see fit including the file `scripts/cloud-init.tfpl` to customize your linux host on first boot

1. Update the env.sh file header variables to name your Network and Compute (`INFRA_NAME`, `COMPUTE_NAME`).

1. Deploy your devhost

1. SSH to your devhost using your defined IP address (source) and Public Key (added)

