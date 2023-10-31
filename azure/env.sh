#!/bin/bash
# Normalize ENV Variables from Pipeline and Pipeline Variables
# v0.7
# Azure Edition

# ------ Infra and Compute Name --------
export INFRA_NAME=everychirp
export TF_VAR_infra_name=$(echo "${INFRA_NAME}" | tr '[:upper:]' '[:lower:]')
export TF_VAR_net_name=$TF_VAR_infra_name

export COMPUTE_NAME=everychirp
export TF_VAR_compute_name=$(echo "${COMPUTE_NAME}" | tr '[:upper:]' '[:lower:]')

# --------------------------------------

echo "Setting up variables for ENV_NAME: ${ENV_NAME}"
export TF_VAR_env_name=$(echo "${ENV_NAME}" | tr '[:upper:]' '[:lower:]')
echo TF_VAR_env_name: ${TF_VAR_env_name}
# comes from terraform_runner runtime argument
echo "Component: ${COMPONENT}"
export TF_VAR_component=$(echo "${COMPONENT}" | tr '[:upper:]' '[:lower:]')
echo TF_VAR_component: ${TF_VAR_component}

# declare ARM_TENANT_ID_VAR=${ENV_NAME}_ARM_TENANT_ID
# export ARM_TENANT_ID=${!ARM_TENANT_ID_VAR}
# echo ARM_TENANT_ID: ${ARM_TENANT_ID}

# declare ARM_SUBSCRIPTION_ID_VAR=${ENV_NAME}_ARM_SUBSCRIPTION_ID
# export ARM_SUBSCRIPTION_ID=${!ARM_SUBSCRIPTION_ID_VAR}
# echo ARM_SUBSCRIPTION_ID: ${ARM_SUBSCRIPTION_ID}

# declare ARM_CLIENT_ID_VAR=${ENV_NAME}_ARM_CLIENT_ID
# export ARM_CLIENT_ID=${!ARM_CLIENT_ID_VAR}
# echo ARM_CLIENT_ID: ${ARM_CLIENT_ID}

# declare ARM_CLIENT_SECRET_VAR=${ENV_NAME}_ARM_CLIENT_SECRET
# export ARM_CLIENT_SECRET=${!ARM_CLIENT_SECRET_VAR}
# echo ARM_CLIENT_SECRET: ${ARM_CLIENT_SECRET}

# declare LOCATION_VAR=${ENV_NAME}_LOCATION
# export LOCATION=${!LOCATION_VAR}
# echo LOCATION: ${LOCATION}
# export TF_VAR_location=$LOCATION

#TF State - RG, Account, Container
# STATE_SUFFIX=$(echo "${!STATE_SUFFIX}" | tr '[:upper:]' '[:lower:]')
# length of the state suffix
# remove any non lower case characters or numbers from the state suffix

STATE_SUFFIX_LENGTH=${#STATE_SUFFIX}
ENV_NAME_LENGTH=${#ENV_NAME}
INFRA_NAME_MAX=$(expr 24 - $STATE_SUFFIX_LENGTH - $ENV_NAME_LENGTH)
echo INFRA_NAME_MAX: ${INFRA_NAME_MAX}
# trucate $INFRA_NAME to 14 characters
INFRA_NAME_SHORT=$(echo "${INFRA_NAME}" | cut -c1-${INFRA_NAME_MAX})
export TFSTATE_ACCOUNT=$(echo "${INFRA_NAME_SHORT}${ENV_NAME}${STATE_SUFFIX}" | tr '[:upper:]' '[:lower:]')
echo TFSTATE_ACCOUNT: "${TFSTATE_ACCOUNT}"
export TF_VAR_tfstate_account="${TFSTATE_ACCOUNT}"

export TFSTATE_CONTAINER=tfstate
echo TFSTATE_CONTAINER: ${TFSTATE_CONTAINER}
export TF_VAR_tfstate_container=${TFSTATE_CONTAINER}

export TFSTATE_RG=$(echo "${INFRA_NAME}-${ENV_NAME}-OAM_RG" | tr '[:upper:]' '[:lower:]')
echo TFSTATE_RG: "${TFSTATE_RG}"
export TF_VAR_tfstate_rg="${TFSTATE_RG}"

echo ARM_ACCESS_KEY: ${ARM_ACCESS_KEY}

CIDR_BLOCK=$(echo "${CIDR_BLOCK}" | tr -d '[:space:]')
export TF_VAR_cidr_block="${CIDR_BLOCK}"
echo TF_VAR_cidr_block: ${TF_VAR_cidr_block}
