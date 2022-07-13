# Utility Container in Devops Toolchain
`

## About

This is a git repository for Utility Container. It's basic idea is to make it possible to use selected unix tools inside any Open Shift project.

## Contents

Runtime environment in the container is: 

    ubuntu:21.04

Implemented features in docker container:

    - curl
    - dig
    - lynx
    - mysql
    - nano
    - netcat
    - nmap
    - nslookup
    - psql
    - ssh
    - stress
    - telnet
    - traceroute
    - vim

    - buildah
    - podman
    - skopeo

    - wget
    - gpg2

Content:
----------
The core structure of the repository is the following:

    ## EDITABLE:
    Dockerfile              # Define docker image build instructions
    README.md               # Instructions (this document)

    ## STATIC NON-EDITABLE: (Edit only if you know what you're doing!)
    LICENSE                 # license information
    CODE_OF_CONDUCT.md      # code of conduct. Please review before contributing.
                                         
### On Quay

Utility Container is stored in Quay under utility-container repository in devops-toolchain organization.

Devops has a robot account, that handles containers in Quay.
Name of the robot is devops-toolchain+openshift.

https://container-registry.platta-net.hel.fi/organization/devops-toolchain

### On OpenShift

 utility-container in installed into the Opens Shift registry under devops-toolchain.

## How to use Tools Container in the OpenShift project. 

Switch to project, which you want to examine:

    oc project hki-kanslia-unittest3-test **)

Create a new app from Opens Shift registry:

    oc new-app --image-stream=devops-toolchain/utility-container

Find the name of the created Pod:

    oc get pods

    NAME                                 READY   STATUS    RESTARTS   AGE
    utility-container-55fddd8579-9ssrt   1/1     Running   0          23m

    note! Status shoud be running. Existing pod can be removed by oc delete (see below).

Start bash environment with Container Utility:

    oc exec -ti utility-container-55fddd8579-9ssrt -- bash   *)

Other commands:

    run these under the examined container, when needed:

    oc get all --selector app=utility-container
    oc delete all --selector app=utility-container

    oc exec utility-container-55fddd8579-9ssrt  -- nmap --help    *)

    *) utility-container-55fddd8579-9ssrt is name of the pod created with oc new-app.
    **) project hki-kanslia-unittest3-test is name of the project to examine.

## Tools Help and Manuals

You can get help for tools by calling: 

curl:       curl --help
	        curl --manual

dig:        dig -h

lynx:       lynx --help

mysql:	    mysql --help

nano:	    nano --help,

netcat:	    netcat -h

nmap:	    nmap --help

nslookup:   http://manpages.ubuntu.com/manpages/hirsute/man1/nslookup.1.html

psql:	    psql --help

ssh:	    ssh

stress:	    stress --help

telnet:     https://manpages.ubuntu.com/manpages/hirsute/man1/telnet-ssl.1.html

traceroute: traceroute --help

vim:	    vim --help

podman:     podman --help

skopeo:	    skopeo --help

buildah:	buildah --help

wget:	    wget --help

gnupg2:     gpg --help

systemd:	systemd --help


## Copyright

Copyright 2022 City-of-Helsinki. Licensed under the Apache License, Version 2.0 (the "License");
you may not use this project's files except in compliance with the License.
A copy of the License is provided in the LICENSE file in this repository.
