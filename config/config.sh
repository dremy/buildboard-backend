# Configuration for all bash scripts.  Running this alone does not
# do anything...just sets up a few variables for convenience.
#


# Define the hostnames of the production and QA environments here to
#   validate whether certain operations should be performed within
#   other scripts.
#
# Example: Restoring DB snapshot carelessly to prod.
HOSTNAME=`hostname`
restrict=(
  'pldigixweb1.prod.tfanet.org'
  'pldigixweb2.prod.tfanet.org'
);

# Define some global variables.
BACKUP=`cd ../backup; pwd -P`   # Directory where we want to keep the backups.
