###########################
#GMYC analysis
##################################
# Install the missing dependency from CRAN
install.packages("paran")

# Install splits from R-Forge
install.packages("splits", repos="http://R-Forge.R-project.org")

# Load the library 
library(splits); library(ape)

# Load your tree
my_tree <- read.nexus("~/Desktop/NT/Fig_extra_GMYC_MrBayes.tre")

# Define outgroup labels to drop
outgroup_tips <- c("Pseudanophthalmus_barberi", "Pseudanophthalmus_loganensis", 
                   "Pseudanophthalmus_ciliaris", "Pseudanophthalmus_colemanensis", 
                   "Pseudanophthalmus sp 11", "Pseudanophthalmus_Plano_Saltpeter_Cave", 
                   "Pseudanophthalmus_princeps", "Pseudanophthalmus_pubescens", 
                   "Pseudanophthalmus sp 16")

# Prune to leave only the ingroup
ingroup_only <- drop.tip(my_tree, outgroup_tips)

# Make it ultrametric (Required for GMYC)
# chronos() converts branch lengths to relative time
ultrametric_tree <- chronos(multi2di(ingroup_only))

# Run GMYC
gmyc_output <- gmyc(ultrametric_tree, method = "single")
summary(gmyc_output)

#Basic GMYC plot
plot(gmyc_output)

# More detailed visualization
# This shows the "lineage-through-time" (LTT) plot
# It helps you see where the transition point (threshold) occurs
plot(gmyc_output, type = "ltt")
