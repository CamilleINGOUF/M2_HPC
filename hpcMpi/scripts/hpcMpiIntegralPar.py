#!/usr/bin/env python3

import hpcMpi
import sys
import time as t
from mpi4py import MPI
import numpy as np

if __name__ == '__main__':

    # parse command line arguments
    step = 1e-3
    if len(sys.argv) == 2:
        step = float(sys.argv[1])


    # compute
    comm = MPI.COMM_WORLD
    worldRank = comm.Get_rank()
    worldSize = comm.Get_size()
    
    t0 = MPI.Wtime()
    
    node_result = np.empty(1, 'f')
    node_result[0] = hpcMpi.compute(hpcMpi.fPi, worldRank/worldSize, (worldRank+1)/worldSize, step)
    all_results = np.empty(1, 'f')
    comm.Reduce(node_result, all_results, op=MPI.SUM)

    t1 = MPI.Wtime()
    
    time = t1 - t0
    
    # output result
    if (worldRank == 0):
        print(step, worldSize, all_results[0], time)
