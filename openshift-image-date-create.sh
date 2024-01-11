#!/bin/bash

#podman images -n | awk '{print $1,$2}' | while read IMAGE TAG ; do echo -e $IMAGE:$TAG "---" '\c' ; podman inspect $IMAGE:$TAG | jq '.[].Created'  ; done

# skopeo inspect --authfile=.dockerconfigjson docker://registry.redhat.io/redhat/certified-operator-index:v4.14 | jq '.Created'
# echo docker://registry.redhat.io/odf4/rook-ceph-rhel9-operator@sha256:065ca8e1597db2270778c93b1794a1cc902af1c0b47c38a0936b617fa103783a | xargs skopeo inspect --authfile=.dockerconfigjson | jq '.Created'

#IMAGES=$(oc get pods -A --no-headers=true | awk '{print $2, $1}' | while read POD NS ; do echo -e $POD "--" $NS "--" '\c' ; oc get pod $POD -n $NS -o json  | jq -r '.spec.containers[].image' ; done | grep -v quay.io/openshift-release)

#IMAGES=$(oc get pods -A --no-headers=true | awk '{print $2, $1}' | while read POD NS ; do oc get pod $POD -n $NS -o json  | jq -r '.metadata.name + " -- " + .metadata.namespace + " -- " +.spec.containers[].image' ; done | grep -v quay.io/openshift-release )

oc get pods -A --no-headers=true | grep -v openshift | awk '{print $1 ,$2}' | while read NS POD
  do
    #echo $POD
    #oc get pod $POD -o json  | jq -r '.metadata.name + " -- " + .metadata.namespace + " -- " + .spec.containers[].image' | awk -F-- -v pod="$POD" '{print pod, $3}' |

    IMAGE=$(oc get pod $POD -o json -n $NS | jq -r '.spec.containers[].image')
    CREATE_DATE=$(skopeo inspect --authfile=.dockerconfigjson docker://"$IMAGE" | jq -r '.Created')
    echo $POD $NS $IMAGE $CREATE_DATE
  done


#echo "$IMAGES"
