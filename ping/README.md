In this exercise, we create two pods in the ping project/namespace.  Each container has the ping command loaded.

1. oc new-project ping
2.  kubectl create deployment pingtest --image=busybox --replicas=3 -- sleep infinity

