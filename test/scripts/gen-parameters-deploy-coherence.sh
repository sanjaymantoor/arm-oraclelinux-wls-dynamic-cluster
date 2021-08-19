#!/bin/bash
# Copyright (c) 2021, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
#
#Generate parameters with value for deploying coherence template independently

read parametersPath adminVMName adminPasswordOrKey skuUrnVersion location storageAccountName wlsDomainName wlsusername wlspassword gitUserName testbranchName managedServerPrefix

echo "Properties passed"
echo "$parametersPath $adminVMName $adminPasswordOrKey $skuUrnVersion $location $storageAccountName $wlsDomainName $wlsusername $wlspassword $gitUserName $testbranchName $managedServerPrefix"

cat <<EOF > ${parametersPath}
{
     "adminVMName":{
        "value": "${adminVMName}"
      },
      "adminPasswordOrKey": {
        "value": "${adminPasswordOrKey}"
      },
      "enableCoherenceWebLocalStorage": {
        "value": true
      },
      "numberOfCoherenceCacheInstances": {
        "value": 1
      },
      "skuUrnVersion": {
        "value": "${skuUrnVersion}"
      },
      "location": {
        "value": "${location}"
      },
      "storageAccountName": {
        "value": "${storageAccountName}"
      },
      "vmSizeSelectForCoherence": {
         "value": "Standard_D2as_v4"
      },
      "wlsDomainName": {
        "value": "${wlsDomainName}"
      },
      "wlsPassword": {
        "value": "${wlsPassword}"
      },
      "wlsUserName": {
        "value": "${wlsUserName}"
      },
      "_artifactsLocation":{
        "value": "https://raw.githubusercontent.com/${gitUserName}/arm-oraclelinux-wls-dynamic-cluster/${testbranchName}/arm-oraclelinux-wls-dynamic-cluster/src/main/arm/"
      },
      "managedServerPrefix": {
        "value": "${managedServerPrefix}"
      }
    }
EOF

cat ${parametersPath}
