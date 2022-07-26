1.  oc new-project exercise1

************ The object definitions for steps 2-4 will be described some *****************

2.  oc create -f httpd.yaml
3.  oc create -f service.yaml
4.  oc create -f route.yaml
5.  Let's look at the IP addresses that were assigned to the pods/containers
    oc get po -o wide
6.  Let's look at the IPs that were assigned to the service
    oc get svc
7.  The pod IPs will be end-points to the service.  Let's look at endpoints
    oc get ep (or oc get endpoints)
    Take note of the pod IPs and the node that this pod is on
8.  Now, we will edit this deployment to increase the number of replicas to 3
    oc edit deployment
        This will bring up a vi editor.  Search for replicas and change the number to 3
        Save (:wq!)
9.  Now, run the "oc get po -o wide" command again.  You will see three pods running and the node that each is running on. Even though, these 3 pods may showup on three different nodes, there is no guarantee on which node the pods will land on.  Ideally, we would want pods on separate nodes.  This is only guaranteed if we setup a daemonset or an affinity rule.
10.  Run, "oc get ep".  This will now show the pod IPs that are being load-balanced behind the service.

************************** I may demonstrate this part (11 through 13) in my environment **************************************

11.  If possible, pull the network cable or reboot one of the nodes that is running an instance of the pod.
12.  As this is happening, notice how long it takes before the node changes from a ready state to a nonready state.  Run "oc get nodes" to see this.
13.  Also, notice how long (if at all) it takes for the pod endpoint to be removed from the service.  Run "oc get ep" to see this.
14.  How long did it take before the endpoint was removed from the service?
15.  Either bring the network back up on the node or see if it has fully rebooted and is ready (oc get nodes).
16.  This process showed how a workload will behave if it doesn't have the appropriate checks in place.  We will now add a readiness and liveliness check to this deployment which will allow Openshift to remediate the fact that one of the pods is failing more quickly.

********* Explain Liveliness and Readiness Checks ************************

17.  oc apply -f httpd-replicas-probes.yaml (ignore warning message)
18.  Remove cable or reboot node again.
19.  Note the different behavior.  Endpoints of failing node get removed more quickly and new pods are deployed to meet the number of replicas required (3) by deployment.
