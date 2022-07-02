In this step, you will use the listNetNamespace.sh script to get id of the netnamespace and run a tcpdump from within that namespace.  This effectively captures from within the container.

Here are some steps that you can do

1.  Login to any of your master or worker nodes using the core user.  This needs to be the user associated with the SSH public key that was used when creating the cluster.
    ssh core@<ipornameofserver>
2.  From that server, sudo to root
    sudo su -
3.  Run the toolbox command
    toolbox
4.  
