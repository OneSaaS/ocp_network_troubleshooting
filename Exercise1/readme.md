1.  oc new-project exercise1
2.  oc create -f httpd.yaml
3.  oc create -f service.yaml
4.  oc create -f route.yaml
5.  Let's look at the IP addresses that were assigned to the pods/containers
    oc get po -o wide
6.  Let's look at the IPs that were assigned to the service
    oc get svc
7.  The pod IPs will be end-points to the service.  Let's look at endpoints
    oc get ep (or oc get endpoints)
