# CVT_ComputationHighDimension

This repository contains files to compute a Centroidal Voronoi Tessellation in a higher dimensional space R^n. The dimensions supported are typically less than 30. The codes are in MATLAB. 
The paper underlying the code is at https://arxiv.org/abs/2203.15507

“Decomposition_main.m” is the main file to be run where you can define the number of generators in each dimension, the regions, their densities, tolerance etc. The following are the definitions of the supporting function files in the repository:

1. [FCVTEnergy.m] Computes the energy of a tessellation.

2. [FIsCVT.m] Checks whether the supplied pair of points and corresponding regions make up a CVT. 

3. [FLlyods.m] Computes the centroids of a CVT using Lloyd’s algorithm.

4. [FMassCentroid.m] Computes the mass centroid of a region.

5. [FVoronoi.m] Computes the Voronoi regions of a set of centroids in Omega.

6. [Fpdfdefinitions.m] This file contains the density definitions of certain commonly used density functions. 
