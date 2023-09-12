# you've got a helmrelease installed successfully
# the source controller has just been restarted
# the chart isn't ready
# when you reconcile the helmrelease, it should reconcile the chart immediately and you should be able to tell the chart isn't ready
# you might need to reconcile the helmrelease twice
# reconciling the helmrepository will likely not solve it (might not do anything at all)
