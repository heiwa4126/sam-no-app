#!/bin/sh -ue
## required tomlq in yq. Try `apt install jq` and `pip3 install yq`
REGION=`tomlq -r .default.deploy.parameters.region samconfig.toml`
eval `tomlq -r .default.deploy.parameters.parameter_overrides samconfig.toml`

curl "http://${BucketName}.s3-website-${REGION}.amazonaws.com/"
