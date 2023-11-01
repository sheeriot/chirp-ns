#!/bin/bash
# Normalize ENV Variables from Pipeline and Pipeline Variables
# v0.7
# Azure Edition

# ------ Infra and Compute Name --------
export INFRA_NAME=everychirp
export TF_VAR_infra_name=$(echo "${INFRA_NAME}" | tr '[:upper:]' '[:lower:]')
# net_name is set to infra_name for use within Terraform
export TF_VAR_net_name=$TF_VAR_infra_name

export COMPUTE_NAME=vm0
export TF_VAR_compute_name=$(echo "${COMPUTE_NAME}" | tr '[:upper:]' '[:lower:]')

# --------------------------------------

echo "Setting up variables for ENV_NAME: ${ENV_NAME}"
export TF_VAR_env_name=$(echo "${ENV_NAME}" | tr '[:upper:]' '[:lower:]')
echo TF_VAR_env_name: ${TF_VAR_env_name}

# comes from terraform_runner runtime argument
export COMPONENT=$(echo "${COMPONENT}" | tr '[:upper:]' '[:lower:]')
export TF_VAR_component=${COMPONENT}
echo TF_VAR_component: ${TF_VAR_component}

# setup Storage account name. Clean non :alnum, convert to lower case, and limit length to 24 characters
STATE_SUFFIX=$(echo $STATE_SUFFIX | tr -dc '[:alnum:]' | tr '[:upper:]' '[:lower:]')
ENV_NAME_STOR=$(echo "${ENV_NAME}" | tr -dc '[:alnum:]' | tr '[:upper:]' '[:lower:]')
# max string length for storage account name is 24 characters
INFRA_NAME_STOR_MAX=$(expr 24 - ${#STATE_SUFFIX} - ${#ENV_NAME_STOR})
echo INFRA_NAME_STOR_MAX: ${INFRA_NAME_STOR_MAX}
# clean infra_name for use as storage account prefix
INFRA_NAME_STOR=$(echo "${INFRA_NAME}" | tr -dc '[:alnum:]' | tr '[:upper:]' '[:lower:]')
# truncate infra_name to max length for storage acocunt
INFRA_NAME_STOR=${INFRA_NAME_STOR:0:$INFRA_NAME_STOR_MAX}
export TFSTATE_ACCOUNT=$(echo "${INFRA_NAME_STOR}${ENV_NAME_STOR}${STATE_SUFFIX}")
echo TFSTATE_ACCOUNT: "${TFSTATE_ACCOUNT}"
export TF_VAR_tfstate_account="${TFSTATE_ACCOUNT}"


export TFSTATE_CONTAINER=tfstate
echo TFSTATE_CONTAINER: ${TFSTATE_CONTAINER}
export TF_VAR_tfstate_container=${TFSTATE_CONTAINER}

export TFSTATE_RG=$(echo "${INFRA_NAME}-${ENV_NAME}-OAM_RG" | tr '[:upper:]' '[:lower:]')
echo TFSTATE_RG: "${TFSTATE_RG}"
export TF_VAR_tfstate_rg="${TFSTATE_RG}"

# ARM Access key is used for access to TFState Storage Account
echo ARM_ACCESS_KEY: ${ARM_ACCESS_KEY}

LOCATION=$(echo "${LOCATION}" | tr -d '[:space:]')
export TF_VAR_location="${LOCATION}"
echo TF_VAR_location: ${TF_VAR_location}

CIDR_BLOCK=$(echo "${CIDR_BLOCK}" | tr -d '[:space:]')
export TF_VAR_cidr_block="${CIDR_BLOCK}"
echo TF_VAR_cidr_block: ${TF_VAR_cidr_block}
