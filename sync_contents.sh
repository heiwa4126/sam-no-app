#!/bin/sh -ue
## required tomlq in yq. Try `apt install jq` and `pip3 install yq`
REGION=`tomlq -r .default.deploy.parameters.region samconfig.toml`
eval `tomlq -r .default.deploy.parameters.parameter_overrides samconfig.toml`

aws s3 sync contents "s3://$BucketName/" \
    --region "$REGION" \
    --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
