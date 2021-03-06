#!/bin/sh

sample_args="--batch_size 1000 --max_step 100000"

# Fig. 2
for beta in $(seq 0.1 0.1 0.3) $(seq 0.4 0.01 0.5) $(seq 0.6 0.1 1.0); do
    args="--lattice ising --L 16 --beta $beta --net_depth 3 --net_width 16 --kernel_size 5 --dilation_step 2 --no_stdout"
    echo train.py "$args"
    echo sample_ncus.py "$args" "$sample_args" # NCUS
    echo sample_ncus.py "$args" "$sample_args" --k_type const --k_param 256 # NGUS
    echo sample_ncu.py "$args" "$sample_args" # NCU
    echo sample_raw.py "$args" "$sample_args" # NGU and NIS
done

# Figs. 3 and 4
for beta in 0.1 0.15 0.17 0.18 $(seq 0.19 0.002 0.21) 0.22 0.23 0.25 0.3; do
    args="--lattice fpm --L 8 --beta $beta --net_depth 3 --net_width 16 --kernel_size 5 --dilation_step 1 --no_stdout"
    echo train.py "$args"
    echo sample_ncus.py "$args" "$sample_args" # NCUS
done
for beta in 0.1 0.15 0.17 0.18 0.19 $(seq 0.2 0.002 0.22) 0.23 0.25 0.3; do
    args="--lattice fpm --L 16 --beta $beta --net_depth 3 --net_width 16 --kernel_size 5 --dilation_step 2 --no_stdout"
    echo train.py "$args"
    echo sample_ncus.py "$args" "$sample_args" # NCUS
done
for beta in 0.1 0.15 0.17 0.18 0.19 $(seq 0.2 0.002 0.22) 0.23 0.25 0.3; do
    args="--lattice fpm --L 24 --beta $beta --net_depth 3 --net_width 16 --kernel_size 5 --dilation_step 3 --no_stdout"
    echo train.py "$args"
    echo sample_ncus.py "$args" "$sample_args" # NCUS
done
for beta in 0.1 0.15 0.17 0.18 0.19 $(seq 0.2 0.002 0.22) 0.23 0.25 0.3; do
    args="--lattice fpm --L 32 --beta $beta --net_depth 3 --net_width 16 --kernel_size 5 --dilation_step 4 --no_stdout"
    echo train.py "$args"
    echo sample_ncus.py "$args" "$sample_args" # NCUS
    echo sample_ncus.py "$args" "$sample_args" --k_type const --k_param 1024 # NGUS
    echo sample_ncu.py "$args" "$sample_args" # NCU
    echo sample_raw.py "$args" "$sample_args" # NGU and NIS
done
